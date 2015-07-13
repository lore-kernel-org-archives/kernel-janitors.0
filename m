From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Jul 2015 18:51:32 +0000
Subject: [PATCH 1/2] staging: unisys: Use kzalloc instead of kmalloc/memset
Message-Id: <0d6047c2d4dc00ac399310ea33f0c15aef83253b.1436813029.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benjamin.romer@unisys.com, david.kershner@unisys.com, gregkh@linuxfoundation.org
Cc: sparmaintainer@unisys.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This patch turns a kmalloc/memset into an equivalent kzalloc.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/unisys/visorbus/visorbus_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/unisys/visorbus/visorbus_main.c b/drivers/staging/unisys/visorbus/visorbus_main.c
index 6db4719..bbc907d 100644
--- a/drivers/staging/unisys/visorbus/visorbus_main.c
+++ b/drivers/staging/unisys/visorbus/visorbus_main.c
@@ -281,12 +281,11 @@ devmajorminor_create_file(struct visor_device *dev, const char *name,
 		rc = -ENOMEM;
 		goto away;
 	}
-	myattr = kmalloc(sizeof(*myattr), GFP_KERNEL);
+	myattr = kzalloc(sizeof(*myattr), GFP_KERNEL);
 	if (!myattr) {
 		rc = -ENOMEM;
 		goto away;
 	}
-	memset(myattr, 0, sizeof(struct devmajorminor_attribute));
 	myattr->show = DEVMAJORMINOR_ATTR;
 	myattr->store = NULL;
 	myattr->slot = slot;
-- 
2.1.4

