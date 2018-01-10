From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 10:20:52 +0000
Subject: [PATCH 0/4] SGI-XPNET: Adjustments for five function implementations
Message-Id: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Cliff Whickman <cpw@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 11:16:54 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in xpnet_dev_hard_start_xmit()
  Use common code in xpnet_dev_hard_start_xmit()
  Adjust five checks for null pointers

 drivers/misc/sgi-xp/xpnet.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

-- 
2.15.1

