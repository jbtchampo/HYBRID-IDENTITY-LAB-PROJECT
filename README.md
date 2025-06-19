
# 🔐 Hybrid Identity Lab Project

This lab demonstrates the setup and validation of a hybrid identity infrastructure where an on-premises Active Directory (AD) environment is synchronized with Azure Active Directory (Azure AD) using Azure AD Connect. It includes group policy enforcement on-prem and Conditional Access enforcement in the cloud.

## 🚀 Project Goals

- Set up a local AD domain controller
- Synchronize on-prem AD with Azure AD using Azure AD Connect
- Test on-prem GPO application on a domain-joined client
- Enforce Conditional Access policies for synced users in Azure AD

## 🛠️ Lab Environment

| Component            | Description                             |
|---------------------|-----------------------------------------|
| Windows Server 2019 | Domain Controller (AD DS)               |
| Windows 10/11       | Domain-joined client for GPO testing    |
| Azure Subscription  | Azure AD, Conditional Access            |
| Azure AD Connect    | Identity synchronization tool           |

## 🧩 Setup Steps

### 1. Configure On-Prem AD

- Promote a server to Domain Controller (e.g., `corp.local`)
- Create sample users and OUs

### 2. Install Azure AD Connect

- Use Express or Custom configuration
- Sync selected OUs to Azure AD

### 3. Verify Sync

- Log in to Azure Portal > Azure AD > Users
- Confirm synced users and test password sync

### 4. Group Policy Testing

- Join client VM to on-prem domain
- Apply GPO (e.g., disable USB, restrict Control Panel)
- Use `gpupdate /force` and validate policy

### 5. Conditional Access

- Go to Azure AD > Security > Conditional Access
- Create policies (e.g., require MFA from unknown locations)
- Validate login behavior from compliant vs non-compliant devices

## ✅ Outcomes

- Hybrid identity successfully established
- GPOs applied and validated on domain client
- Conditional Access enforced as configured

## ✨ Optional Enhancements

- Self-Service Password Reset
- Device write-back
- PowerShell scripting for automation

## 📷 Screenshots

> Includes screenshots of sync status, Azure portal, GPO result, and CA policy.

---

**Created by:** Jean Berlin Tchampo  
**LinkedIn:** [linkedin.com/in/jeanberlintchampo1](https://www.linkedin.com/in/jeanberlintchampo1)

# HYBRID-IDENTITY-LAB-PROJECT
Configured on-prem AD synchronized with Azure AD via AAD Connect; tested group policies and conditional access enforcement.
