From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 13:10:31 +0000
Subject: [PATCH 0/4] staging/wlan-ng/prism2fw: Adjustments for two function implementations
Message-Id: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maciek Borzecki <maciek.borzecki@gmail.com>, Simo Koskinen <koskisoft@gmail.com>, Thibaut Sautereau <thibaut.sautereau@telecom-sudparis.eu>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 14:03:02 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in mkimage()
  Use a known error code after a failed kzalloc() in mkimage()
  Delete an error message for a failed memory allocation in writeimage()
  Use common error handling code in writeimage()

 drivers/staging/wlan-ng/prism2fw.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

-- 
2.15.1


