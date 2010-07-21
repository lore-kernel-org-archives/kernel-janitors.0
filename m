From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 21 Jul 2010 19:07:21 +0000
Subject: [PATCH 1/2] edac: i5000: carefull error handling
Message-Id: <1279739241-8203-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-kernel@vger.kernel.org, Tamas Vincze <tom@vincze.org>, Doug Thompson <dougthompson@xmission.com>, Andrew Morton <akpm@linux-foundation.org>, bluesmoke-devel@lists.sourceforge.net

-EIO is not the only error code that pci_enable_device() may return,
also the set of errors can be enhanced in future. We should compare
return code with zero, not with concrete error value.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/edac/i5000_edac.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index 996c1bd..a5cefab 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -1482,7 +1482,7 @@ static int __devinit i5000_init_one(struct pci_dev *pdev,
 
 	/* wake up device */
 	rc = pci_enable_device(pdev);
-	if (rc = -EIO)
+	if (rc)
 		return rc;
 
 	/* now probe and enable the device */
-- 
1.7.0.4

