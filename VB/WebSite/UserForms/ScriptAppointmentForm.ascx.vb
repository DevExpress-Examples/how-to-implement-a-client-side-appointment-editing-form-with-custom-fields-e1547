Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Text
Imports DevExpress.Web.Internal
Imports DevExpress.Web.ASPxScheduler
Imports DevExpress.XtraScheduler

Partial Public Class UserForms_ScriptAppointmentForm
    Inherits ASPxSchedulerClientFormBase

    #Region "Fields"

    Private labelDataSource_Renamed As IEnumerable

    Private statusDataSource_Renamed As IEnumerable

    Private resourceDataSource_Renamed As IEnumerable

    Private scheduler_Renamed As ASPxScheduler
    #End Region

    #Region "Properties"
    Public Overrides ReadOnly Property ClassName() As String
        Get
            Return "ASPxClientAppointmentForm"
        End Get
    End Property
    Private ReadOnly Property Scheduler() As ASPxScheduler
        Get
            If scheduler_Renamed Is Nothing Then
                Me.scheduler_Renamed = TryCast(FindControlById(SchedulerId), ASPxScheduler)
            End If
            Return scheduler_Renamed
        End Get
    End Property
    Protected ReadOnly Property LabelDataSource() As IEnumerable
        Get
            If labelDataSource_Renamed Is Nothing Then
                Me.labelDataSource_Renamed = ASPxSchedulerFormDataHelper.CreateLabelDataSource(Scheduler)
            End If
            Return labelDataSource_Renamed
        End Get
    End Property
    Protected ReadOnly Property StatusDataSource() As IEnumerable
        Get
            If statusDataSource_Renamed Is Nothing Then
                Me.statusDataSource_Renamed = ASPxSchedulerFormDataHelper.CreateStatusesDataSource(Scheduler)
            End If
            Return statusDataSource_Renamed
        End Get
    End Property
    Protected ReadOnly Property ResourceDataSource() As IEnumerable
        Get
            If resourceDataSource_Renamed Is Nothing Then
                Me.resourceDataSource_Renamed = ASPxSchedulerFormDataHelper.CreateResourceDataSource(Scheduler)
            End If
            Return resourceDataSource_Renamed
        End Get
    End Property
    #End Region 

    Protected Overrides Function GetChildControls() As Control()

        Dim controls_Renamed() As Control = { edtStartDate, edtEndDate, tbSubject, tbDescription, tbLocation, edtLabel, edtStatus, chkAllDay, chkRecurrence, edtResource, recurrenceControl, btnOk, btnCancel, btnDelete, edtPrice }
        Return controls_Renamed
    End Function
End Class

