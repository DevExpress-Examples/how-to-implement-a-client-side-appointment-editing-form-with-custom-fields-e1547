using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using DevExpress.Web.Internal;
using DevExpress.Web.ASPxScheduler;
using DevExpress.XtraScheduler;

public partial class UserForms_ScriptAppointmentForm : ASPxSchedulerClientFormBase {
    #region Fields
    IEnumerable labelDataSource;
    IEnumerable statusDataSource;
    IEnumerable resourceDataSource;
    ASPxScheduler scheduler;
    #endregion

    #region Properties
    public override string ClassName { get { return "ASPxClientAppointmentForm"; } }
    ASPxScheduler Scheduler {
        get {
            if(scheduler == null)
                this.scheduler = FindControlById(SchedulerId) as ASPxScheduler;
            return scheduler;
        }
    }
    protected  IEnumerable LabelDataSource {
        get {
            if(labelDataSource == null) {
                this.labelDataSource = ASPxSchedulerFormDataHelper.CreateLabelDataSource(Scheduler);
            }
            return labelDataSource;
        }
    }
    protected IEnumerable StatusDataSource {
        get {
            if (statusDataSource == null)
                this.statusDataSource = ASPxSchedulerFormDataHelper.CreateStatusesDataSource(Scheduler);
            return statusDataSource;
        }
    }
    protected IEnumerable ResourceDataSource {
        get {
            if (resourceDataSource == null)
                this.resourceDataSource = ASPxSchedulerFormDataHelper.CreateResourceDataSource(Scheduler);
            return resourceDataSource;
        }
    }
    #endregion 

    protected override Control[] GetChildControls() {
        Control[] controls = new Control[] { edtStartDate, edtEndDate, tbSubject,
                tbDescription, tbLocation, edtLabel, edtStatus, chkAllDay,
                chkRecurrence, edtResource, recurrenceControl, btnOk, btnCancel, btnDelete,
                edtPrice
        };
        return controls;
    }
}

