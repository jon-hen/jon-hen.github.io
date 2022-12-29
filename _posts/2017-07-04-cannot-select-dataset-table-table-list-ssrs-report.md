---
title: Cannot select dataset for table in table or list of SSRS report?
date: 2017-07-04T06:29:10-04:00
author: jonashendrickx
category: programming
---
If you use a table in your SSRS report as a root element and specify a dataset for it; it will cause problems down the road when you need to update your SSRS report to add a second table with a different dataset. SSRS will disable the dropdown selection and grey out the control for the second table, which will make you unable to add the second dataset to your newly added table.

In the code below, I will illustrate the problem:

    <?xml version="1.0" encoding="utf-8"?>
    <Report xmlns="http://schemas.microsoft.com/sqlserver/reporting/2008/01/reportdefinition" xmlns:rd="http://schemas.microsoft.com/SQLServer/reporting/reportdesigner">
      <Body>
        <ReportItems>
          <Tablix Name="RootTable">
            <TablixBody>
              <CellContents>
                <Rectangle Name="RootTablePane">
                  <ReportItems>
                    <Rectangle Name="SubPane">
                      <ReportItems>
                        <Tablix Name="SubTable"> 
                          <!-- Cannot select dataset, dropdown is greyed out.-->
                        </Tablix>
                      </ReportItems> 
                    </Rectangle>
                  </ReportItems>
                </Rectangle>
              </CellContents>
            </TablixRows>
          </TablixBody> 
          <DataSetName>DataSet1</DataSetName> 
         </Tablix>
       </ReportItems> 
     </Body> 
    </Report>
    

The actual solution for this is the following. It&#8217;s better to put both tables at the same level and not to nest them! That way you will be able to specify a different dataset for each without problems!

    <?xml version="1.0" encoding="utf-8"?>
    <Body>
      <Rectangle Name="RootPane">
        <Rectangle>
          <Tablix Name="FirstTable">
          </Tablix>
        </Rectangle>
        <Rectangle>
          <Tablix Name="SecondTable">
          </Tablix>
        </Rectangle>
      </Rectangle>
    </Body>

&nbsp;