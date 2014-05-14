library bwu_dart.bwu_datagrid.formatters;

import 'dart:html' as dom;
import 'package:bwu_datagrid/datagrid/helpers.dart';

/***
 * Contains basic BwuDatagrid formatters.
 *
 * NOTE:  These are merely examples.  You will most likely need to implement something more
 *        robust/extensible/localizable/etc. for your use!
 *
 * @module Formatters
 * @namespace Slick
 */

//(function ($) {
//  // register namespace
//  $.extend(true, window, {
//    "Slick": {
//      "Formatters": {
//        "PercentComplete": PercentCompleteFormatter,
//        "PercentCompleteBar": PercentCompleteBarFormatter,
//        "YesNo": YesNoFormatter,
//        "Checkmark": CheckmarkFormatter
//      }
//    }
//  });


//typedef String FormatterFn(dom.HtmlElement target, int row, int cell, dynamic value, Column m, dataContext);

class DefaultFormatter extends Formatter {
  void call(dom.HtmlElement target, int row, int cell, dynamic value, Column columnDef, /*Map/Item*/ dynamic dataContext) {
    if (value != null) {
      //return "";
    //} else {
      /*return*/ target.text = ('$value'.replaceAll(r'&',"&amp;").replaceAll(r'<',"&lt;").replaceAll(r'>',"&gt;"));
    }
  }
}


abstract class Formatter {
  void call(dom.HtmlElement target, int row, int cell, dynamic value, Column columnDef, /*Map/Item*/ dynamic dataContext);
}

class PercentCompleteFormatter extends Formatter {

  void call(dom.HtmlElement target, int row, int cell, dynamic value, Column columnDef, /*Map/Item*/ dynamic dataContext) {
    if (value == null || value == "") {
      target.text = '-';
    } else if (value < 50) {
      target.appendHtml("<span style='color:red;font-weight:bold;'>${value}%</span>");
    } else {
      target.appendHtml("<span style='color:green'>${value}%</span>");
    }
  }
}

class PercentCompleteBarFormatter extends Formatter {

  void call(dom.HtmlElement target, int row, int cell, dynamic value, Column columnDef, /*Map/Item*/dynamic dataContext) {
    if (value == null || value == "") {
      target.text = '';
    }

    var color;

    if (value < 30) {
      color = 'red';
    } else if (value < 70) {
      color = 'silver';
    } else {
      color = 'green';
    }

    target.appendHtml('<span class="percent-complete-bar" style="background: ${color};width:${value}%"></span>');
  }
}

class YesNoFormatter extends Formatter {
  void call(dom.HtmlElement target, int row, int cell, dynamic value, Column columnDef, /*Map/Item*/dynamic  dataContext) {
    target.text =  value ? 'Yes' : 'No';
  }
}

class CheckmarkFormatter extends Formatter {
  void call(dom.HtmlElement target, int row, int cell, dynamic value, Column columnDef, /*Map/Item*/dynamic  dataContext) {
    if(value != null && value is bool && value) {
      target.appendHtml('<img src="packages/bwu_datagrid/assets/images/tick.png">'); // : '';
    }
  }
}
