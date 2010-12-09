From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 15:00:01 +0000
Subject: [PATCH] c2port: Remove redundant unlikely()
Message-Id: <1291906801-1389-2-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1291906801-1389-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1291906801-1389-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: giometti@linux.it
Cc: Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/misc/c2port/core.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/misc/c2port/core.c b/drivers/misc/c2port/core.c
index 19fc7c1..95a82de 100644
--- a/drivers/misc/c2port/core.c
+++ b/drivers/misc/c2port/core.c
@@ -913,7 +913,7 @@ struct c2port_device *c2port_device_register(char *name,
 
 	c2dev->dev = device_create(c2port_class, NULL, 0, c2dev,
 					"c2port%d", id);
-	if (unlikely(IS_ERR(c2dev->dev))) {
+	if (IS_ERR(c2dev->dev)) {
 		ret = PTR_ERR(c2dev->dev);
 		goto error_device_create;
 	}
-- 
1.7.0.4

