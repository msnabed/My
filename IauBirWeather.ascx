<%@ Control Language="VB" AutoEventWireup="false" CodeFile="IauBirWeather.ascx.vb"
    Inherits="Weather_IauBirWeather" %>
<style>
    .WeatherNumStyle{
    text-align: center;
    width: 40px; 
    font-family: IaubirYekan,Iaubir,Tahoma;
    font-weight:normal;
    font-size: 10pt;
    direction:ltr;
    }
</style>
<div id="BWeather"
    style="padding: 0px; border: 1px solid #000000; margin-right: auto; margin-left: auto; width: 200px; background-color: #ABBFE0; color: #000000;">
    <asp:UpdatePanel ID="upnl_Weather" runat="server" RenderMode="Inline">
        <ContentTemplate>
            <div id="WeatherHead" style="background-color: #336699; color: #FFFFFF; height: 20px; margin: 0px; padding: 2px; vertical-align: middle; text-align: center; font-family: Iaubir">
                <asp:Label ID="lbl_WeatherHead" runat="server" Text="پيش بيني وضع هوا"></asp:Label>
            </div>
            <table dir="rtl" style="width: 100%">
                <tr>
                    <td dir="ltr" style="width: 50%; text-align: center;">
                        <span style="font-size: 8pt; font-family: tahoma; color: #000000">دماي فعلي</span>
                    </td>
                    <td style="width: 50%; text-align: center">
                        <span style="font-size: 8pt; font-family: tahoma; color: #000000">وضع هوا</span>
                    </td>
                </tr>
                <tr>
                    <td dir="ltr" style="margin: 0px; padding: 0px; width: 50%; text-align: center; font-family: IauBirYekan,Iaubir; font-size: 30pt;font-weight:bold">
                        <asp:Label ID="lbl_CurrentTemp" runat="server" Text="0"></asp:Label>
                    </td>
                    <td style="padding: 0px; width: 50%; text-align: center">
                        <asp:Image ID="img_CurrentCondition" runat="server" Height="52px" Width="52px" />
                    </td>
                </tr>
            </table>
            <div id="WeatherForecast">
                <table dir="rtl" style="width: 100%; color: #000000;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="padding: 4px 5px 4px 0px; margin: 0px; text-align: right; color: #0000FF; vertical-align: middle; height: 24px;">&nbsp;</td>
                        <td style="padding: 4px 0px 4px 0px; margin: 0px; text-align: center; color: #0000FF; vertical-align: middle; height: 24px; width: 40px;">
                            <span style="font-size: 7pt">حداكثر</span>
                        </td>
                        <td style="padding: 4px 0px 4px 0px; margin: 0px; text-align: center; color: #0000FF; vertical-align: middle; height: 24px; width: 40px;">
                            <span style="font-size: 7pt">حداقل</span>
                        </td>
                        <td style="padding: 4px 0px 4px 0px; margin: 0px; text-align: center; color: #0000FF; vertical-align: middle; height: 24px;">
                            <span style="font-size: 7pt">وضعيت</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 5px; vertical-align: middle;">امروز
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Today_High" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Today_Low" runat="server"></asp:Literal>
                        </td>
                        <td style="text-align: center">
                            <asp:Image ID="img_TodayCond" runat="server" Height="24px" Width="24px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 5px; vertical-align: middle;">
                            <asp:Literal ID="ltr_Day1_Name" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Day1_High" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Day1_Low" runat="server"></asp:Literal>
                        </td>
                        <td style="text-align: center">
                            <asp:Image ID="img_Day1Cond" runat="server" Height="24px" Width="24px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 5px; vertical-align: middle;">
                            <asp:Literal ID="ltr_Day2_Name" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Day2_High" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Day2_Low" runat="server"></asp:Literal>
                        </td>
                        <td style="text-align: center">
                            <asp:Image ID="img_Day2Cond" runat="server" Height="24px" Width="24px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 5px; vertical-align: middle;">
                            <asp:Literal ID="ltr_Day3_Name" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Day3_High" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Day3_Low" runat="server"></asp:Literal>
                        </td>
                        <td style="text-align: center">
                            <asp:Image ID="img_Day3Cond" runat="server" Height="24px" Width="24px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 5px; vertical-align: middle;">
                            <asp:Literal ID="ltr_Day4_Name" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Day4_High" runat="server"></asp:Literal>
                        </td>
                        <td class="WeatherNumStyle">
                            <asp:Literal ID="ltr_Day4_Low" runat="server"></asp:Literal>
                        </td>
                        <td style="text-align: center">
                            <asp:Image ID="img_Day4Cond" runat="server" Height="24px" Width="24px" />
                        </td>
                    </tr>
                </table>
            </div>

            <div id="CityChoice">
                <table style="margin: 5px 0px 5px 0px; width: 100%" dir="rtl" cellpadding="0"
                    cellspacing="0">
                    <tr>
                        <td style="padding: 0px">
                            <span style="font-size: 7pt">انتخاب شهر</span>
                        </td>
                        <td style="padding: 0px">
                            <asp:DropDownList ID="cmbx_Cities" runat="server" Width="100px"
                                Font-Names="IauBir" Font-Size="9pt" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        <td style="padding: 0px; width: 20px;">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server"
                                AssociatedUpdatePanelID="upnl_Weather" DisplayAfter="50">
                                <ProgressTemplate>
                                    &nbsp;<asp:Image ID="Image1" runat="server"
                                        ImageUrl="~/Weather/Images/aLoader.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>
