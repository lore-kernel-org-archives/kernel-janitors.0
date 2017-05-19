From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 17:45:56 +0000
Subject: [PATCH 0/4] ueagle-atm: Adjustments for eight function implementations
Message-Id: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthieu Castet <castet.matthieu@free.fr>, Stanislaw Gruszka <stf_xl@wp.pl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 19:41:23 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete error messages for failed memory allocations in two functions
  Improve a size determination in uea_bind()
  Delete unnecessary return statements in two functions
  Adjust three checks for null pointers

 drivers/usb/atm/ueagle-atm.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

-- 
2.13.0

