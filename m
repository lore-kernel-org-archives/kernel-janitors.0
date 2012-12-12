From: Cyril Roelandt <tipecaml@gmail.com>
Date: Wed, 12 Dec 2012 00:24:52 +0000
Subject: [PATCH 3/5] c2port: fix return value check in duramar2150_c2port_init().
Message-Id: <1355271894-5284-4-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>, paul.gortmaker@windriver.com, gregkh@suse.de

The c2port_device_register() function returns ERR_PTR() and never returns NULL,
so the NULL check should be replaced by a call to IS_ERR().

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/misc/c2port/c2port-duramar2150.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/c2port/c2port-duramar2150.c b/drivers/misc/c2port/c2port-duramar2150.c
index 5484301..2742e60 100644
--- a/drivers/misc/c2port/c2port-duramar2150.c
+++ b/drivers/misc/c2port/c2port-duramar2150.c
@@ -129,7 +129,7 @@ static int __init duramar2150_c2port_init(void)
 
 	duramar2150_c2port_dev = c2port_device_register("uc",
 					&duramar2150_c2port_ops, NULL);
-	if (!duramar2150_c2port_dev) {
+	if (IS_ERR(duramar2150_c2port_dev)) {
 		ret = -ENODEV;
 		goto free_region;
 	}
-- 
1.7.10.4

