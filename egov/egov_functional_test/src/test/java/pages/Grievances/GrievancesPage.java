package pages.Grievances;

import entities.grievances.CreateComplaintDetails;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;
import pages.BasePage;

/**
 * Created by tester1 on 1/23/2017.
 */
public class GrievancesPage extends BasePage {
    private WebDriver webDriver;

    @FindBy(xpath = "html/body/div[1]/div/div[1]/div[2]/div[2]/a/div[2]")
    private WebElement registerComplaintLink;

    @FindBy(id = "f-name")
    private WebElement citizenNameTextBox;

    @FindBy(id = "mob-no")
    private WebElement mobNoTextBox;

    @FindBy(id = "email")
    private WebElement emailIdTextBox;

    @FindBy(id = "address")
    private WebElement citizenAddressTextBox;

    @FindBy(id = "complaintTypeCategory")
    private WebElement complaintTypeCategorySelect;

    @FindBy(id = "complaintType")
    private WebElement complaintTypeSelect;

    @FindBy(id = "doc")
    private WebElement grievanceDetailsText;

    @FindBy(id = "location")
    private WebElement grievanceLocationText;

    @FindBy(id = "landmarkDetails")
    private WebElement locationLandmarkText;

    @FindBy(id = "create-griev")
    private WebElement createGrievanceButton;

    @FindBy(linkText = "New Request")
    private WebElement newRequestLink;

    @FindBy(xpath = ".//*[@id='section-newrequest-1']/div[2]/header/div/a")
    private WebElement registerComplaint;

    @FindBy(id = "ctn_no")
    private WebElement CRNNumber;

    @FindBy(css = ".dropdown-toggle")
    private WebElement profileLink;

    @FindBy(linkText = "Sign out")
    private WebElement signOutLink;

    @FindBy(id = "status")
    private WebElement selectStatus;

    @FindBy(id = "inc_messge")
    private WebElement incMessageBox;

    @FindBy(xpath = ".//*[@id='complaintUpdate']/div[6]/div/button[1]")
    private WebElement submitButton;

    @FindBy(xpath = "html/body/div[1]/div/div[1]/div/div/div[1]/div/strong")
    private WebElement acknMsg;

    @FindBy(xpath = "html/body/div[1]/div/div[3]/div/a")
    private WebElement closeButton;


    public GrievancesPage (WebDriver webDriver) {this.webDriver= webDriver;}

    public void openCreateGrievancePage() {
        waitForElementToBeClickable(registerComplaintLink, webDriver);
        registerComplaintLink.click();
        switchToNewlyOpenedWindow(webDriver);

    }

    public void enterCitizenContactDetails(CreateComplaintDetails createComplaintDetails) {
    waitForElementToBeClickable(citizenNameTextBox, webDriver);
    enterText(citizenNameTextBox, createComplaintDetails.getCitizenName());
    enterText(mobNoTextBox, createComplaintDetails.getcitizenMobNo());
    enterText(emailIdTextBox, createComplaintDetails.getEmailId());
    enterText(citizenAddressTextBox,createComplaintDetails.getcitizenAddress());

    }

    public void enterGrievanceDetails(CreateComplaintDetails createComplaintDetails) {
    new Select(complaintTypeCategorySelect).selectByVisibleText(createComplaintDetails.getGrievanceCategory());
    new Select(complaintTypeSelect).selectByVisibleText(createComplaintDetails.getGrievanceType());
    enterText(grievanceDetailsText, createComplaintDetails.getGrievanceDetails());
   // enterText(grievanceLocationText, createComplaintDetails.getGrievanceLocation());
      enterText(grievanceLocationText, "abbas nagar-m");
      WebElement dropdown = webDriver.findElement(By.className("tt-highlight"));
      dropdown.click();
    grievanceLocationText.sendKeys(Keys.TAB);
    enterText(locationLandmarkText, createComplaintDetails.getLocationLandmark());
    createGrievanceButton.click();

    }

    public void getRegisterComplaintPage() {
    newRequestLink.click();
    waitForElementToBeClickable(registerComplaint, webDriver);
    registerComplaint.click();
    switchToNewlyOpenedWindow(webDriver);
    }

    public String getCRN() {
        waitForElementToBeVisible(CRNNumber, webDriver);
        String CrnNum=CRNNumber.getText();
        closeButton.click();
        switchToPreviouslyOpenedWindow(webDriver);
//        webDriver.close();
        return CrnNum;
    }

    public void signOut() {
        waitForElementToBeClickable(profileLink,webDriver);
        profileLink.click();
        profileLink.click();
        waitForElementToBeClickable(signOutLink, webDriver);
        signOutLink.click();
    }

    public String officialMarkStatus() {
        new Select(selectStatus).selectByVisibleText("COMPLETED");
        enterText(incMessageBox, "Completed");
        submitButton.click();
        String success=webDriver.findElement(By.xpath("html/body/div[1]/div/div[1]/div/div/div[1]/div/strong")).getText();
        closeButton.click();
        switchToPreviouslyOpenedWindow(webDriver);
        return success;
    }
}