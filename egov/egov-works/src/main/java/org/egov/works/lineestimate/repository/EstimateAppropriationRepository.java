/*
 * eGov suite of products aim to improve the internal efficiency,transparency,
 *    accountability and the service delivery of the government  organizations.
 *
 *     Copyright (C) <2015>  eGovernments Foundation
 *
 *     The updated version of eGov suite of products as by eGovernments Foundation
 *     is available at http://www.egovernments.org
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program. If not, see http://www.gnu.org/licenses/ or
 *     http://www.gnu.org/licenses/gpl.html .
 *
 *     In addition to the terms of the GPL license to be adhered to in using this
 *     program, the following additional terms are to be complied with:
 *
 *         1) All versions of this program, verbatim or modified must carry this
 *            Legal Notice.
 *
 *         2) Any misrepresentation of the origin of the material is prohibited. It
 *            is required that all modified versions of this material be marked in
 *            reasonable ways as different from the original version.
 *
 *         3) This license does not grant any rights to any user of the program
 *            with regards to rights under trademark law for use of the trade names
 *            or trademarks of eGovernments Foundation.
 *
 *   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 */
package org.egov.works.lineestimate.repository;

import org.egov.works.abstractestimate.entity.AbstractEstimate;
import org.egov.works.lineestimate.entity.EstimateAppropriation;
import org.egov.works.lineestimate.entity.LineEstimateDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface EstimateAppropriationRepository extends JpaRepository<EstimateAppropriation, Long> {
    EstimateAppropriation findById(final Long id);

    @Query("from EstimateAppropriation ep where ep.budgetUsage.id=(select max(budgetUsage.id) from EstimateAppropriation ep1 where ep1.lineEstimateDetails=?)")
    EstimateAppropriation findLatestByLineEstimateDetails(final LineEstimateDetails lineEstimateDetails);

    @Query("from EstimateAppropriation ep where ep.budgetUsage.id=(select max(budgetUsage.id) from EstimateAppropriation ep1 where ep1.abstractEstimate=?)")
    EstimateAppropriation findLatestByAbstractEstimate(final AbstractEstimate abstractEstimate);

    @Query("from EstimateAppropriation ep where ep.budgetUsage.id=(select max(budgetUsage.id) from EstimateAppropriation ep1 where ep1.abstractEstimate.id=?)")
    EstimateAppropriation findLatestByAbstractEstimate_Id(final Long abstractEstimateId);

    EstimateAppropriation findByBudgetUsage_Id(final Long budgetUsageId);
}