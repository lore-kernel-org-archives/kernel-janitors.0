From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 27 Mar 2011 02:42:33 +0000
Subject: [PATCH 3/3] tg3: Fix inline keyword usage
Message-Id: <1301193753-10045-3-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301193753-10045-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1301193753-10045-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Carlson <mcarlson@broadcom.com>
Cc: Michael Chan <mchan@broadcom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Javier Martinez Canillas <martinez.javier@gmail.com>

The correct usage is "static inline void" not "static void inline".

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/net/tg3.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/tg3.c b/drivers/net/tg3.c
index 58c6049..d7e564d 100644
--- a/drivers/net/tg3.c
+++ b/drivers/net/tg3.c
@@ -13061,7 +13061,7 @@ done:
 
 static struct pci_dev * __devinit tg3_find_peer(struct tg3 *);
 
-static void inline vlan_features_add(struct net_device *dev, unsigned long flags)
+static inline void vlan_features_add(struct net_device *dev, unsigned long flags)
 {
 	dev->vlan_features |= flags;
 }
-- 
1.7.2.3

