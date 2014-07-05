From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Sat, 05 Jul 2014 01:31:49 +0000
Subject: [PATCH] [media] davinci-vpfe: Fix retcode check
Message-Id: <1404523909-2058-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Andrey Utkin <andrey.krieger.utkin@gmail.com>

See https://bugzilla.kernel.org/show_bug.cgi?idi071
---8<---
Use signed type to check correctly for negative error code

Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c b/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c
index b2daf5e..e326032 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c
@@ -254,7 +254,7 @@ int config_ipipe_hw(struct vpfe_ipipe_device *ipipe)
 	void __iomem *ipipe_base = ipipe->base_addr;
 	struct v4l2_mbus_framefmt *outformat;
 	u32 color_pat;
-	u32 ipipe_mode;
+	int ipipe_mode;
 	u32 data_path;
 
 	/* enable clock to IPIPE */
-- 
1.8.3.2

