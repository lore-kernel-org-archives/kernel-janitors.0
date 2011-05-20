From: matt mooney <mfm@muteddisk.com>
Date: Fri, 20 May 2011 04:37:00 +0000
Subject: [PATCH 06/12] staging: usbip: stub_main.c: use KMEM_CACHE macro
Message-Id: <810a17cd0703bc6899a73d83dc30dcfe575ec5e9.1305866084.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305866084.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305866084.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Change kmem_cache_create() to the KMEM_CACHE() macro.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub_main.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/usbip/stub_main.c b/drivers/staging/usbip/stub_main.c
index 53d6977..45a0f5d 100644
--- a/drivers/staging/usbip/stub_main.c
+++ b/drivers/staging/usbip/stub_main.c
@@ -249,9 +249,8 @@ static int __init usbip_host_init(void)
 {
 	int ret;
 
-	stub_priv_cache = kmem_cache_create("stub_priv",
-					    sizeof(struct stub_priv), 0,
-					    SLAB_HWCACHE_ALIGN, NULL);
+	stub_priv_cache = KMEM_CACHE(stub_priv, SLAB_HWCACHE_ALIGN);
+
 	if (!stub_priv_cache) {
 		pr_err("kmem_cache_create failed\n");
 		return -ENOMEM;
-- 
1.7.5.1

