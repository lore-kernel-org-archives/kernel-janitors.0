From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jun 2015 14:29:02 +0000
Subject: [PATCH 0/2] staging: wilc1000: Deletion of two unnecessary checks
Message-Id: <558EB32E.6090003@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Park <chris.park@atmel.com>, Dean Lee <dean.lee@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johnny Kim <johnny.kim@atmel.com>, Rachel Kim <rachel.kim@atmel.com>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>

Further update suggestions were taken into account after a patch was applied
from static source code analysis.

Markus Elfring (2):
  Delete unnecessary checks before two function calls
  One function call less in mac_ioctl() after error detection

 drivers/staging/wilc1000/linux_wlan.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

-- 
2.4.4

