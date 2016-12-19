package steps.works;

import cucumber.api.PendingException;
import cucumber.api.java8.En;
import pages.works.ContractorPage;
import steps.BaseSteps;

/**
 * Created by manjunatha-lap on 16/12/2016.
 */
public class ContractorSteps extends BaseSteps implements En {
    public ContractorSteps() {
        And("^he chooses to create contractor$", () -> {
            pageStore.get(ContractorPage.class).chooseToCreateContractor();
        });
        And("^he enters the contractor master data$", () -> {
            pageStore.get(ContractorPage.class).entersContractorMasterData();
        });
    }
}
