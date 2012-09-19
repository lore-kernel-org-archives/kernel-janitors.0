From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 00:57:00 +0000
Subject: usb-serial.c:1415 code aligned with following code on line 1416
Message-Id: <20120919005700.GB10838@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Greg,

FYI, coccinelle warns about

drivers/usb/serial/usb-serial.c:1415:3-51: code aligned with following code on line 1416

vim +1415 drivers/usb/serial/usb-serial.c

  1412		/* we only set the reset_resume field if the serial_driver has one */
  1413		for (sd = serial_drivers; *sd; ++sd) {
  1414			if ((*sd)->reset_resume)
> 1415				udriver->reset_resume = usb_serial_reset_resume;
> 1416				break;
  1417		}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
