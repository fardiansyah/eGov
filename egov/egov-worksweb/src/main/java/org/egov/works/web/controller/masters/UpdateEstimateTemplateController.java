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
package org.egov.works.web.controller.masters;

import javax.servlet.http.HttpServletRequest;

import org.egov.infra.exception.ApplicationException;
import org.egov.works.masters.entity.EstimateTemplate;
import org.egov.works.masters.service.EstimateTemplateService;
import org.egov.works.utils.WorksConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/masters")
public class UpdateEstimateTemplateController extends BaseEstimateTemplateController {

    @Autowired
    private EstimateTemplateService estimateTemplateService;

    @RequestMapping(value = "/estimatetemplate-edit/{estimateTemplateId}", method = RequestMethod.GET)
    public String showEstimateTemplateFormToModify(final Model model, @PathVariable final Long estimateTemplateId)
            throws ApplicationException {
        final EstimateTemplate estimateTemplate = estimateTemplateService.getEstimateTemplateById(estimateTemplateId);
        estimateTemplateService.setEstimateTemplateTempSorAndNonSorList(estimateTemplate);
        model.addAttribute(ESTIMATETEMPLATE, estimateTemplate);
        model.addAttribute(WorksConstants.MODE, WorksConstants.EDIT);
        estimateTemplateService.loadModelValues(model, WorksConstants.EDIT);
        return "estimatetemplate-modify";
    }

    @RequestMapping(value = "/estimatetemplate-edit", method = RequestMethod.POST)
    public String modifyEstimateTemplate(@ModelAttribute final EstimateTemplate estimateTemplate,
            final BindingResult resultBinder, final Model model, final HttpServletRequest request)
            throws ApplicationException {
        final String mode = request.getParameter(WorksConstants.MODE);
        validateEstimateTemplate(estimateTemplate, resultBinder);
        validateEstimateTemplateActivities(estimateTemplate, resultBinder);
        if (WorksConstants.EDIT.equalsIgnoreCase(mode) && estimateTemplate.getId() != null)
            model.addAttribute(WorksConstants.MODE, mode);

        if (resultBinder.hasErrors()) {
            estimateTemplateService.loadModelValues(model, mode);
            return "estimatetemplate-modify";
        }
        estimateTemplateService.createEstimateTemplateActivities(estimateTemplate);
        estimateTemplateService.update(estimateTemplate);
        return "redirect:/masters/estimatetemplate-success?estimateTemplateId=" + estimateTemplate.getId();

    }

}
