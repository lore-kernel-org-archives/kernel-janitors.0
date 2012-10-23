From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:17 +0000
Subject: [PATCH 14/23] tuners/tda18271: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-14-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>

This kind of memcpy() is error-prone. Its replacement with a struct
assignment is prefered because it's type-safe and much easier to read.

Found by coccinelle. Hand patched and reviewed.
Tested by compilation only.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier struct_name;
struct struct_name to;
struct struct_name from;
expression E;
@@
-memcpy(&(to), &(from), E);
+to = from;
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/media/tuners/tda18271-maps.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/tuners/tda18271-maps.c b/drivers/media/tuners/tda18271-maps.c
index fb881c6..b62e925 100644
--- a/drivers/media/tuners/tda18271-maps.c
+++ b/drivers/media/tuners/tda18271-maps.c
@@ -1290,13 +1290,11 @@ int tda18271_assign_map_layout(struct dvb_frontend *fe)
 	switch (priv->id) {
 	case TDA18271HDC1:
 		priv->maps = &tda18271c1_map_layout;
-		memcpy(&priv->std, &tda18271c1_std_map,
-		       sizeof(struct tda18271_std_map));
+		priv->std = tda18271c1_std_map;
 		break;
 	case TDA18271HDC2:
 		priv->maps = &tda18271c2_map_layout;
-		memcpy(&priv->std, &tda18271c2_std_map,
-		       sizeof(struct tda18271_std_map));
+		priv->std = tda18271c2_std_map;
 		break;
 	default:
 		ret = -EINVAL;
-- 
1.7.4.4

