---
title: Use a enum as ItemsSource with RadComboBox
date: 2018-04-04T04:17:25-04:00
author: jonashendrickx
category: programming
---
Recently, I encountered a situation where I needed to display an enum in a WPF RadComboBox. There may be various approaches to this, but I will just describe the one that was applicable to my situation.

First of all you&#8217;ll need to define your enum. We will use the &#8216;Display&#8217; attribute to access the property DisplayName later in our XAML code.

    public enum MaterialUnit
    {
        [Display(Name = "Piece")]
        Piece = 0,
        [Display(Name = "Box")]
        Box = 1,
        [Display(Name = "Roll")]
        Roll = 2,
        [Display(Name = "Meter")]
        Meter = 3
    }

Next, in your view model, we need to define a list which will bind to the &#8216;ItemsSource&#8217; property of our &#8216;RadComboBox&#8217; control. If &#8216;_unitTypes&#8217; was not yet initialized, we will initialize it with one simple line.

    private IEnumerable<MaterialUnit> _unitTypes;
    public IEnumerable<MaterialUnit> UnitTypes => _unitTypes ?? (_unitTypes = Telerik.Windows.Data.EnumDataSource.FromType<MaterialUnit>());

Finally, now go to your XAML code, and add the following:

    <telerik:RadComboBox
        ItemsSource="{Binding UnitTypes}"
        DisplayMemberPath="DisplayName" <!-- Display Attribute - Name Property -->
        SelectedValuePath="Value"
        SelectedValue="{Binding SelectedMaterialUnit}" />

The property &#8216;SelectedMaterialUnit&#8217; is of type MaterialUnit, and stores the enum value that is selected.