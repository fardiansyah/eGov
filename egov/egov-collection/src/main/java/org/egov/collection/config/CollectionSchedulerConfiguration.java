/*
 * eGov suite of products aim to improve the internal efficiency,transparency,
 * accountability and the service delivery of the government  organizations.
 *
 *  Copyright (C) 2017  eGovernments Foundation
 *
 *  The updated version of eGov suite of products as by eGovernments Foundation
 *  is available at http://www.egovernments.org
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see http://www.gnu.org/licenses/ or
 *  http://www.gnu.org/licenses/gpl.html .
 *
 *  In addition to the terms of the GPL license to be adhered to in using this
 *  program, the following additional terms are to be complied with:
 *
 *      1) All versions of this program, verbatim or modified must carry this
 *         Legal Notice.
 *
 *      2) Any misrepresentation of the origin of the material is prohibited. It
 *         is required that all modified versions of this material be marked in
 *         reasonable ways as different from the original version.
 *
 *      3) This license does not grant any rights to any user of the program
 *         with regards to rights under trademark law for use of the trade names
 *         or trademarks of eGovernments Foundation.
 *
 *  In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 */

package org.egov.collection.config;

import org.egov.collection.scheduler.AxisReconciliationJob;
import org.egov.collection.scheduler.RemittanceInstrumentJob;
import org.egov.infra.config.scheduling.QuartzSchedulerConfiguration;
import org.egov.infra.config.scheduling.SchedulerConfigCondition;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

import static org.quartz.CronTrigger.MISFIRE_INSTRUCTION_DO_NOTHING;

@Configuration
@Conditional(SchedulerConfigCondition.class)
public class CollectionSchedulerConfiguration extends QuartzSchedulerConfiguration {

    @Bean
    public SchedulerFactoryBean collectionScheduler(DataSource dataSource) {
        SchedulerFactoryBean collectionScheduler = createSchedular(dataSource);
        collectionScheduler.setSchedulerName("collection-scheduler");
        collectionScheduler.setAutoStartup(true);
        collectionScheduler.setOverwriteExistingJobs(true);
        collectionScheduler.setTriggers(
                axisReconciliationCronTrigger().getObject(),
                remittanceCashInstrumentCronTrigger0().getObject(),
                remittanceCashInstrumentCronTrigger1().getObject(),
                remittanceDDInstrumentCronTrigger0().getObject(),
                remittanceDDInstrumentCronTrigger1().getObject(),
                remittanceChequeInstrumentCronTrigger0().getObject(),
                remittanceChequeInstrumentCronTrigger1().getObject());
        return collectionScheduler;
    }

    @Bean
    public JobDetailFactoryBean axisReconciliationJobDetail() {
        JobDetailFactoryBean axisReconciliationJobDetail = new JobDetailFactoryBean();
        axisReconciliationJobDetail.setGroup("COLLECTION_JOB_GROUP");
        axisReconciliationJobDetail.setName("COLLECTION_AXIS_RECON_JOB");
        axisReconciliationJobDetail.setDurability(true);
        axisReconciliationJobDetail.setJobClass(AxisReconciliationJob.class);
        axisReconciliationJobDetail.setRequestsRecovery(true);
        Map<String, String> jobDetailMap = new HashMap<>();
        jobDetailMap.put("jobBeanName", "axisReconciliationJob");
        jobDetailMap.put("userName", "egovernments");
        jobDetailMap.put("cityDataRequired", "true");
        jobDetailMap.put("moduleName", "collection");
        axisReconciliationJobDetail.setJobDataAsMap(jobDetailMap);
        return axisReconciliationJobDetail;
    }

    @Bean
    public CronTriggerFactoryBean axisReconciliationCronTrigger() {
        CronTriggerFactoryBean axisReconciliationCron = new CronTriggerFactoryBean();
        axisReconciliationCron.setJobDetail(axisReconciliationJobDetail().getObject());
        axisReconciliationCron.setGroup("COLLECTION_TRIGGER_GROUP");
        axisReconciliationCron.setName("COLLECTION_AXIS_RECON_TRIGGER");
        axisReconciliationCron.setCronExpression("0 */30 * * * ?");
        axisReconciliationCron.setMisfireInstruction(MISFIRE_INSTRUCTION_DO_NOTHING);
        return axisReconciliationCron;
    }

    @Bean
    public JobDetailFactoryBean remittanceCashInstrumentJobDetail0() {
        return createJobDetailFactory("cash", 0);
    }

    @Bean
    public JobDetailFactoryBean remittanceCashInstrumentJobDetail1() {
        return createJobDetailFactory("cash", 1);
    }

    @Bean
    public JobDetailFactoryBean remittanceDDInstrumentJobDetail0() {
        return createJobDetailFactory("dd", 0);
    }

    @Bean
    public JobDetailFactoryBean remittanceDDInstrumentJobDetail1() {
        return createJobDetailFactory("dd", 1);
    }

    @Bean
    public JobDetailFactoryBean remittanceChequeInstrumentJobDetail0() {
        return createJobDetailFactory("cheque", 0);
    }

    @Bean
    public JobDetailFactoryBean remittanceChequeInstrumentJobDetail1() {
        return createJobDetailFactory("cheque", 1);
    }

    @Bean
    public CronTriggerFactoryBean remittanceCashInstrumentCronTrigger0() {
        return createCronTrigger(remittanceCashInstrumentJobDetail0(), 0);
    }

    @Bean
    public CronTriggerFactoryBean remittanceCashInstrumentCronTrigger1() {
        return createCronTrigger(remittanceCashInstrumentJobDetail1(), 1);
    }

    @Bean
    public CronTriggerFactoryBean remittanceDDInstrumentCronTrigger0() {
        return createCronTrigger(remittanceDDInstrumentJobDetail0(), 0);
    }

    @Bean
    public CronTriggerFactoryBean remittanceDDInstrumentCronTrigger1() {
        return createCronTrigger(remittanceDDInstrumentJobDetail1(), 1);
    }

    @Bean
    public CronTriggerFactoryBean remittanceChequeInstrumentCronTrigger0() {
        return createCronTrigger(remittanceChequeInstrumentJobDetail0(), 0);
    }

    @Bean
    public CronTriggerFactoryBean remittanceChequeInstrumentCronTrigger1() {
        return createCronTrigger(remittanceChequeInstrumentJobDetail1(), 1);
    }

    private JobDetailFactoryBean createJobDetailFactory(String instrumentType, int modulo) {
        JobDetailFactoryBean remittanceInstrumentJobDetail = new JobDetailFactoryBean();
        remittanceInstrumentJobDetail.setGroup("COLLECTION_JOB_GROUP");
        remittanceInstrumentJobDetail.setName(String.format("COLLECTION_REMIT_INSTRMNT_%d_JOB", modulo));
        remittanceInstrumentJobDetail.setDurability(true);
        remittanceInstrumentJobDetail.setJobClass(RemittanceInstrumentJob.class);
        remittanceInstrumentJobDetail.setRequestsRecovery(true);
        Map<String, String> jobDetailMap = new HashMap<>();
        jobDetailMap.put("jobBeanName", String.format("remittance%sInstrumentJob%d", instrumentType, modulo));
        jobDetailMap.put("modulo", String.valueOf(modulo));
        jobDetailMap.put("instrumentType", instrumentType);
        jobDetailMap.put("userName", "egovernments");
        jobDetailMap.put("cityDataRequired", "true");
        jobDetailMap.put("moduleName", "collection");
        remittanceInstrumentJobDetail.setJobDataAsMap(jobDetailMap);
        return remittanceInstrumentJobDetail;
    }

    private CronTriggerFactoryBean createCronTrigger(JobDetailFactoryBean jobDetail, int modulo) {
        CronTriggerFactoryBean remittanceCron = new CronTriggerFactoryBean();
        remittanceCron.setJobDetail(jobDetail.getObject());
        remittanceCron.setGroup("COLLECTION_TRIGGER_GROUP");
        remittanceCron.setName(String.format("COLLECTION_REMIT_INSTRMNT_%d_TRIGGER", modulo));
        remittanceCron.setCronExpression("0 */10 * * * ?");
        remittanceCron.setMisfireInstruction(MISFIRE_INSTRUCTION_DO_NOTHING);
        return remittanceCron;
    }
}
