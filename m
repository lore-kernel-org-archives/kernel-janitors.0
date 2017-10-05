From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 20:51:13 +0000
Subject: [PATCH 1/2] powermac: Delete an error message for a failed memory allocation in kw_i2c_host_init()
Message-Id: <5dc8fe2f-0459-faff-585f-a92137115895@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5188c0b3-476a-6a14-bab5-052ad0f4dae0@users.sourceforge.net>
In-Reply-To: <5188c0b3-476a-6a14-bab5-052ad0f4dae0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 22:30:29 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 70183eb3d5c8..ecd166b5549b 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -493,11 +493,8 @@ static struct pmac_i2c_host_kw *__init kw_i2c_host_init(struct device_node *np)
 	u32			steps;
 
 	host = kzalloc(sizeof(struct pmac_i2c_host_kw), GFP_KERNEL);
-	if (host = NULL) {
-		printk(KERN_ERR "low_i2c: Can't allocate host for %pOF\n",
-		       np);
+	if (!host)
 		return NULL;
-	}
 
 	/* Apple is kind enough to provide a valid AAPL,address property
 	 * on all i2c keywest nodes so far ... we would have to fallback
-- 
2.14.2

