package entities.responses.wcms.categoryType.create;

import org.codehaus.jackson.annotate.JsonProperty;

public class CategoryTypes {
    private String code;
    private String name;
    private String tenantId;
    private String description;
    private boolean active;
    private int id;
    private Object auditDeatils;

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTenantId() {
        return this.tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getActive() {
        return this.active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Object getAuditDeatils() {
        return this.auditDeatils;
    }

    public void setAuditDeatils(Object auditDeatils) {
        this.auditDeatils = auditDeatils;
    }
}
