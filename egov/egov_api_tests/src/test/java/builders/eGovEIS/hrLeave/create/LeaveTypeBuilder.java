package builders.eGovEIS.hrLeave.create;

import entities.requests.eGovEIS.hrLeave.create.LeaveType;

public final class LeaveTypeBuilder {

    LeaveType leaveType = new LeaveType();

    public LeaveTypeBuilder() {
        leaveType.setId(2);
    }

    public LeaveTypeBuilder withId(int id) {
        leaveType.setId(id);
        return this;
    }

    public LeaveType build() {
        return leaveType;
    }
}