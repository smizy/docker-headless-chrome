'use strict'

const puppeteer = require('puppeteer');
const devices = require('puppeteer/DeviceDescriptors');

async function main () {

  const browser = await puppeteer.launch({
    args: ['--no-sandbox']
  });
  const page = await browser.newPage();
  await page.emulate(devices['iPhone 6']);
  await page.goto('https://www.yahoo.co.jp/');
  await page.screenshot({path: 'full.png', fullPage: false});
  browser.close();

}

main()