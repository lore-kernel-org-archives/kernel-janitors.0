From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 18:59:24 +0000
Subject: [PATCH] media: cx23885: remove redundant assignment to err
Message-Id: <20190530185924.9206-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is assigned with a value that is never read and
it is re-assigned a new value later on.  The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cx23885/cx23885-dvb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
index e2e63f05645e..13595fcb6a40 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -2657,8 +2657,6 @@ int cx23885_dvb_register(struct cx23885_tsport *port)
 			dev->pci_bus,
 			dev->pci_slot);
 
-		err = -ENODEV;
-
 		/* dvb stuff */
 		/* We have to init the queue for each frontend on a port. */
 		pr_info("%s: cx23885 based dvb card\n", dev->name);
-- 
2.20.1
