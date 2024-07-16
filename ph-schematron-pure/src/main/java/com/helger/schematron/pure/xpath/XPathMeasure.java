package com.helger.schematron.pure.xpath;

public final class XPathMeasure
{
  String expression;
  long count;
  long time;

  public XPathMeasure(String expression, long count, long time) {
    this.expression = expression;
    this.count = count;
    this.time = time;
  }
}