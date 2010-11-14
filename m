From: Vasiliy Kulikov <segoon@openwall.com>
Date: Sun, 14 Nov 2010 20:08:34 +0000
Subject: [PATCH] net: bnx2x: fix error value sign
Message-Id: <1289765315-6028-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Eilon Greenstein <eilong@broadcom.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

bnx2x_init_one() should return negative value on error.
By mistake it returns ENODEV instead of -ENODEV.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested.

 drivers/net/bnx2x/bnx2x_main.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/bnx2x/bnx2x_main.c b/drivers/net/bnx2x/bnx2x_main.c
index 4a6f0ea..be52edc 100644
--- a/drivers/net/bnx2x/bnx2x_main.c
+++ b/drivers/net/bnx2x/bnx2x_main.c
@@ -9064,7 +9064,7 @@ static int __devinit bnx2x_init_one(struct pci_dev *pdev,
 	default:
 		pr_err("Unknown board_type (%ld), aborting\n",
 			   ent->driver_data);
-		return ENODEV;
+		return -ENODEV;
 	}
 
 	cid_count += CNIC_CONTEXT_USE;
-- 
1.7.0.4

