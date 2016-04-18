Imports System.Collections.Generic
Imports RadWeather
Imports RadWeather.Providers
Imports System.IO

Partial Class Weather_IauBirWeather
    Inherits System.Web.UI.UserControl

    Private _City As Integer = 2254447
    Private _Status As Integer = 1
    Public Property CityCode As Integer
        Get
            Return _City
        End Get
        Set(ByVal value As Integer)
            _City = value
        End Set
    End Property
    Public Property GetStatus As Integer
        Get
            Return _Status
        End Get
        Set(value As Integer)
            _Status = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
        Else
            If Me.GetStatus = 0 Then
                Exit Sub
            End If
            Try
                'Me.CityCode = 2254447
                GetWeather()
                Dim CityList As List(Of RadWeather.City) = GetCities()
                cmbx_Cities.DataSource = CityList
                cmbx_Cities.DataTextField = "FarsiName"
                cmbx_Cities.DataValueField = "Code"
                cmbx_Cities.DataBind()
                cmbx_Cities.SelectedValue = Me.CityCode
            Catch ex As Exception
            End Try
        End If
        Try
            lbl_WeatherHead.Text = "پيش بيني و وضعيت هواي " + "<span style='font-size: 10pt; font-family: IaubirYekan; color: #FFFF00'>" + cmbx_Cities.SelectedItem.Text.Trim + "</span>"
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub GetWeather()
        If Me.GetStatus = 0 Then
            Exit Sub
        End If
        Dim Yprovider As New YahooProvider(Server.MapPath("~/Weather"))
        Dim CWeather As IWeather = New Weather(Yprovider).GetForecast(Me.CityCode, "fa", DegreesUnit.Celsius)
        img_CurrentCondition.ImageUrl = "./Images/Large/" + CWeather.Today.CurrentConditionCode.ToString.Trim + ".gif"
        img_CurrentCondition.ToolTip = CWeather.Today.CurrentCondition.Trim
        ' Today
        ltr_Today_High.Text = ValidTemp(CWeather.Today.HighTemperature)
        ltr_Today_Low.Text = ValidTemp(CWeather.Today.LowTemperature)
        img_TodayCond.ImageUrl = "./Images/small/" + CWeather.Today.ConditionCode.ToString.Trim + ".gif"
        img_TodayCond.ToolTip = CWeather.Today.Condition.Trim
        'Day1
        ltr_Day1_Name.Text = CWeather.NextDays.Day1.DayName.Trim
        ltr_Day1_High.Text = ValidTemp(CWeather.NextDays.Day1.HighTemperature)
        ltr_Day1_Low.Text = ValidTemp(CWeather.NextDays.Day1.LowTemperature)
        img_Day1Cond.ImageUrl = "./Images/small/" + CWeather.NextDays.Day1.ConditionCode.ToString.Trim + ".gif"
        img_Day1Cond.ToolTip = CWeather.NextDays.Day1.Condition.Trim
        'Day2
        ltr_Day2_Name.Text = CWeather.NextDays.Day2.DayName.Trim
        ltr_Day2_High.Text = ValidTemp(CWeather.NextDays.Day2.HighTemperature)
        ltr_Day2_Low.Text = ValidTemp(CWeather.NextDays.Day2.LowTemperature)
        img_Day2Cond.ImageUrl = "./Images/small/" + CWeather.NextDays.Day2.ConditionCode.ToString.Trim + ".gif"
        img_Day2Cond.ToolTip = CWeather.NextDays.Day2.Condition.Trim
        'Day3
        ltr_Day3_Name.Text = CWeather.NextDays.Day3.DayName.Trim
        ltr_Day3_High.Text = ValidTemp(CWeather.NextDays.Day3.HighTemperature)
        ltr_Day3_Low.Text = ValidTemp(CWeather.NextDays.Day3.LowTemperature)
        img_Day3Cond.ImageUrl = "./Images/small/" + CWeather.NextDays.Day3.ConditionCode.ToString.Trim + ".gif"
        img_Day3Cond.ToolTip = CWeather.NextDays.Day3.Condition.Trim
        'Day4
        ltr_Day4_Name.Text = CWeather.NextDays.Day4.DayName.Trim
        ltr_Day4_High.Text = ValidTemp(CWeather.NextDays.Day4.HighTemperature)
        ltr_Day4_Low.Text = ValidTemp(CWeather.NextDays.Day4.LowTemperature)
        img_Day4Cond.ImageUrl = "./Images/small/" + CWeather.NextDays.Day4.ConditionCode.ToString.Trim + ".gif"
        img_Day4Cond.ToolTip = CWeather.NextDays.Day4.Condition.Trim

        lbl_CurrentTemp.Text = ValidTemp(CWeather.Today.CurrentTemperature)

    End Sub

    Private Function ValidTemp(ByVal _Temp As Integer) As String
        Return IClass.Base.PersianNumber(IIf(_Temp < 0, "-" + (_Temp * -1).ToString, _Temp.ToString)) '+ "°"
    End Function

    Protected Friend Function GetCities() As List(Of RadWeather.City)
        Return RadWeather.Helpers.WeatherHelper.GetCities(Path.Combine(Server.MapPath("~"), "Weather\WeatherData\Locations\Locations.xml"), "IR")
    End Function

    Protected Sub cmbx_Cities_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbx_Cities.SelectedIndexChanged
        Try
            Me.CityCode = cmbx_Cities.SelectedValue
            GetWeather()
        Catch ex As Exception
        End Try
    End Sub

End Class
