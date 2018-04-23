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
Imports DevExpress.XtraScheduler
Imports DevExpress.Web.ASPxScheduler
Imports DevExpress.Web.ASPxScheduler.Internal
Imports System.Drawing
Imports System.Data.SqlClient

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        ' Data binding should be performed manually
        DataHelper.SetupDefaultMappings(ASPxScheduler1)
        DataHelper.ProvideRowInsertion(ASPxScheduler1, objectDataSource.AppointmentDataSource)
        objectDataSource.AttachTo(ASPxScheduler1)
        If Not IsPostBack Then
            AppointmentForm.DataBind()
        End If
    End Sub


    Protected Sub ASPxScheduler1_BeforeExecuteCallbackCommand(ByVal sender As Object, ByVal e As SchedulerCallbackCommandEventArgs)
        If e.CommandId = SchedulerCallbackCommandId.ClientSideUpdateAppointment Then
            e.Command = New MyUpdateAppointmentCommand(DirectCast(sender, ASPxScheduler))
        ElseIf e.CommandId = SchedulerCallbackCommandId.ClientSideInsertAppointment Then
            e.Command = New MyInsertAppointmentCommand(DirectCast(sender, ASPxScheduler))
        End If
    End Sub
End Class
Friend Class MyInsertAppointmentCommand
    Inherits AppointmentClientSideInsertCallbackCommand

    Public Sub New(ByVal scheduler As ASPxScheduler)
        MyBase.New(scheduler)
    End Sub

    Protected Overrides Function CreateAppointmentFormController(ByVal apt As Appointment) As AppointmentFormController
        Return New MyAppointmentFormController(Control, apt)
    End Function

    Protected Overrides Sub AssignControllerCustomFieldsValues(ByVal controller As AppointmentFormController, ByVal clientAppointment As ClientAppointmentProperties)
        Dim editedAppointment As Appointment = controller.EditedAppointmentCopy
        Dim result As Double = 0
        If clientAppointment.Properties("Price") IsNot Nothing Then
            Double.TryParse(clientAppointment.Properties("Price").ToString(), result)
        End If
        editedAppointment.CustomFields("Price") = result
        MyBase.AssignControllerCustomFieldsValues(controller, clientAppointment)
    End Sub
End Class
Friend Class MyUpdateAppointmentCommand
    Inherits AppointmentClientSideUpdateCallbackCommand

    Public Sub New(ByVal scheduler As ASPxScheduler)
        MyBase.New(scheduler)
    End Sub

    Protected Overrides Function CreateAppointmentFormController(ByVal apt As Appointment) As AppointmentFormController
        Return New MyAppointmentFormController(Control, apt)
    End Function

    Protected Overrides Sub AssignControllerCustomFieldsValues(ByVal controller As AppointmentFormController, ByVal clientAppointment As ClientAppointmentProperties)
        Dim editedAppointment As Appointment = controller.EditedAppointmentCopy
        Dim result As Double = 0
        If clientAppointment.Properties("Price") IsNot Nothing Then
            Double.TryParse(clientAppointment.Properties("Price").ToString(), result)
        End If
        editedAppointment.CustomFields("Price") = result
        MyBase.AssignControllerCustomFieldsValues(controller, clientAppointment)
    End Sub
End Class

Public Class MyAppointmentFormController
    Inherits AppointmentFormController

    Private Const PriceFieldName As String = "Price"

    Public Sub New(ByVal control As ASPxScheduler, ByVal apt As Appointment)
        MyBase.New(control, apt)
    End Sub
    Public Property Price() As Double
        Get
            Return CDbl(EditedAppointmentCopy.CustomFields(PriceFieldName))
        End Get
        Set(ByVal value As Double)
            EditedAppointmentCopy.CustomFields(PriceFieldName) = value
        End Set
    End Property

    Private Property SourcePrice() As Double
        Get
            Return CDbl(SourceAppointment.CustomFields(PriceFieldName))
        End Get
        Set(ByVal value As Double)
            SourceAppointment.CustomFields(PriceFieldName) = value
        End Set
    End Property

    Protected Overrides Sub ApplyCustomFieldsValues()
        SourcePrice = Price
    End Sub
End Class
