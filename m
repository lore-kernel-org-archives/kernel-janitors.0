From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 08:43:25 +0000
Subject: [PATCH 0/8] rtc-ab-b5ze-s3: Fine-tuning for some function implementations
Message-Id: <5688DF2D.6090204@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Jan 2016 09:37:34 +0100

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (8):
  Better exception handling in abb5zes3_probe()
  Delete an unnecessary variable in abb5zes3_rtc_set_alarm()
  Delete an unnecessary variable initialisation in _abb5zes3_rtc_set_timer()
  Replace a variable initialisation by an assignment in _abb5zes3_rtc_set_alarm()
  Replace a variable initialisation by an assignment in _abb5zes3_rtc_read_alarm()
  Delete an unnecessary variable in _abb5zes3_rtc_read_timer()
  Delete an unnecessary variable in _abb5zes3_rtc_interrupt()
  Delete an unnecessary variable in _abb5zes3_rtc_set_timer()

 drivers/rtc/rtc-ab-b5ze-s3.c | 59 ++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 32 deletions(-)

-- 
2.6.3

