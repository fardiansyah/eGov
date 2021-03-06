/*
 * eGov suite of products aim to improve the internal efficiency,transparency,
 * accountability and the service delivery of the government  organizations.
 *
 *  Copyright (C) 2016  eGovernments Foundation
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

package org.egov.infra.workflow.entity.contract;

import com.google.gson.GsonBuilder;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.util.Date;

public class StateInfoBuilder {
    String refNum;
    String refDate;
    String task;
    String citizenName;
    String citizenPhoneno;
    String citizenAddress;
    String status;
    String resolutionDate;
    String location;
    String sender;
    String senderPhoneno;
    String itemDetails;

    public StateInfoBuilder refNum(String refNum) {
        this.refNum = refNum;
        return this;
    }

    public StateInfoBuilder refDate(Date refDate) {
    	DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/yyyy hh:mm a");
        this.refDate = formatter.print(new DateTime(refDate));
        return this;
    }

    public StateInfoBuilder task(String task) {
        this.task = task;
        return this;
    }

    public StateInfoBuilder citizenName(String citizenName) {
        this.citizenName = citizenName;
        return this;
    }

    public StateInfoBuilder citizenPhoneno(String citizenPhoneno) {
        this.citizenPhoneno = citizenPhoneno;
        return this;
    }

    public StateInfoBuilder citizenAddress(String citizenAddress) {
        this.citizenAddress = citizenAddress;
        return this;
    }

    public StateInfoBuilder status(String status) {
        this.status = status;
        return this;
    }

    public StateInfoBuilder resolutionDate(Date resolutionDate) {
        this.resolutionDate = new LocalDate(resolutionDate).toString("dd-MM-yyyy");
        return this;
    }

    public StateInfoBuilder location(String location) {
        this.location = location;
        return this;
    }

    public StateInfoBuilder sender(String sender) {
        this.sender = sender;
        return this;
    }

    public StateInfoBuilder senderPhoneno(String senderPhoneno) {
        this.senderPhoneno = senderPhoneno;
        return this;
    }

    public StateInfoBuilder itemDetails(String itemDetails) {
        this.itemDetails = itemDetails;
        return this;
    }

    public String toJson() {
        return new GsonBuilder().create().toJson(this);
    }
}
