---
title: "Asp.Net MVC Elmah config"
date: "2015-10-25"
tags: 
  - "dev"
---

It took me too long to figure this out, but for anyone who needs it, here's a default, working, ELMAH config for a ASP.Net MVC 5 deployment.

<configuration>
 <configSections>
 <sectionGroup name="elmah">
 <section name="security" requirePermission="false" type="Elmah.SecuritySectionHandler, Elmah" />
 <section name="errorLog" requirePermission="false" type="Elmah.ErrorLogSectionHandler, Elmah" />
 <section name="errorMail" requirePermission="false" type="Elmah.ErrorMailSectionHandler, Elmah" />
 <section name="errorFilter" requirePermission="false" type="Elmah.ErrorFilterSectionHandler, Elmah" />
 </sectionGroup>
 <system.webServer>
 <modules>
 <add name="ErrorLog" type="Elmah.ErrorLogModule, Elmah" preCondition="managedHandler" />
 <add name="ErrorMail" type="Elmah.ErrorMailModule, Elmah" preCondition="managedHandler" />
 <add name="ErrorFilter" type="Elmah.ErrorFilterModule, Elmah" preCondition="managedHandler" />
 </modules>
 </system.webServer>
 <elmah>
 <security allowRemoteAccess="false" />
 </elmah>
 <location path="elmah.axd" inheritInChildApplications="false">
 <system.webServer>
 <handlers>
 <add name="ELMAH" verb="POST,GET,HEAD" path="elmah.axd" type="Elmah.ErrorLogPageFactory, Elmah" preCondition="integratedMode" />
 </handlers>
 </system.webServer>
 </location>
</configuration>
