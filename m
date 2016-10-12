From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 14:44:52 +0000
Subject: [PATCH 09/34] [media] DaVinci-VPBE: Reduce the scope for a variable in vpbe_set_default_output()
Message-Id: <207ad99c-288a-0fca-677c-dcdc5334eb25@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 09:54:26 +0200

* Move the definition for the variable "ret" into an if branch
  so that an extra initialisation can be avoided at the beginning
  by this refactoring.

* Return a success code as a constant at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpbe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index d6a0221..19611a2 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -297,19 +297,19 @@ static int vpbe_set_output(struct vpbe_device *vpbe_dev, int index)
 static int vpbe_set_default_output(struct vpbe_device *vpbe_dev)
 {
 	struct vpbe_config *cfg = vpbe_dev->cfg;
-	int ret = 0;
 	int i;
 
 	for (i = 0; i < cfg->num_outputs; i++) {
 		if (!strcmp(def_output,
 			    cfg->outputs[i].output.name)) {
-			ret = vpbe_set_output(vpbe_dev, i);
+			int ret = vpbe_set_output(vpbe_dev, i);
+
 			if (!ret)
 				vpbe_dev->current_out_index = i;
 			return ret;
 		}
 	}
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.10.1

