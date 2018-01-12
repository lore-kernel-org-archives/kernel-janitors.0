From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 16:57:20 +0000
Subject: [PATCH 0/2] mvebu-mbus: Adjustments for mvebu_devs_debug_show()
Message-Id: <4796228f-fa7f-24db-0049-2d2b9041c5b0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, =?UTF-8?Q?Jan_L=c3=bcbbe?= <jlu@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 17:47:57 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use seq_putc()
  Fix a typo in five comment lines

 drivers/bus/mvebu-mbus.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

-- 
2.15.1

