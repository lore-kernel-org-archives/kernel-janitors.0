From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 19:05:55 +0000
Subject: [PATCH 0/2] sn/ioc3: Adjustments for ioc3_probe()
Message-Id: <5248143d-b207-536a-16eb-ea899cd639b8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 20:03:45 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/sn/ioc3.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.15.1

