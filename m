From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 20:52:05 +0000
Subject: [PATCH 2/2] powermac: Improve a size determination in five functions
Message-Id: <97bf4b4e-811e-58c4-214e-7d60c014a3d0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5188c0b3-476a-6a14-bab5-052ad0f4dae0@users.sourceforge.net>
In-Reply-To: <5188c0b3-476a-6a14-bab5-052ad0f4dae0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 22:40:39 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/powermac/low_i2c.c    | 6 +++---
 arch/powerpc/platforms/powermac/pfunc_core.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index ecd166b5549b..46b7eb1a0f5f 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -492,7 +492,7 @@ static struct pmac_i2c_host_kw *__init kw_i2c_host_init(struct device_node *np)
 	const u32		*psteps, *prate, *addrp;
 	u32			steps;
 
-	host = kzalloc(sizeof(struct pmac_i2c_host_kw), GFP_KERNEL);
+	host = kzalloc(sizeof(*host), GFP_KERNEL);
 	if (!host)
 		return NULL;
 
@@ -571,7 +571,7 @@ static void __init kw_i2c_add(struct pmac_i2c_host_kw *host,
 {
 	struct pmac_i2c_bus *bus;
 
-	bus = kzalloc(sizeof(struct pmac_i2c_bus), GFP_KERNEL);
+	bus = kzalloc(sizeof(*bus), GFP_KERNEL);
 	if (bus = NULL)
 		return;
 
@@ -1253,7 +1253,7 @@ static void* pmac_i2c_do_begin(struct pmf_function *func, struct pmf_args *args)
 	 * near OOM that need to be resolved, the allocator itself should
 	 * probably make GFP_NOIO implicit during suspend
 	 */
-	inst = kzalloc(sizeof(struct pmac_i2c_pf_inst), GFP_KERNEL);
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
 	if (inst = NULL) {
 		pmac_i2c_close(bus);
 		return NULL;
diff --git a/arch/powerpc/platforms/powermac/pfunc_core.c b/arch/powerpc/platforms/powermac/pfunc_core.c
index df3c93bef228..e0462fedcdb8 100644
--- a/arch/powerpc/platforms/powermac/pfunc_core.c
+++ b/arch/powerpc/platforms/powermac/pfunc_core.c
@@ -643,7 +643,7 @@ static int pmf_add_function_prop(struct pmf_device *dev, void *driverdata,
 
 	while (length >= 12) {
 		/* Allocate a structure */
-		func = kzalloc(sizeof(struct pmf_function), GFP_KERNEL);
+		func = kzalloc(sizeof(*func), GFP_KERNEL);
 		if (func = NULL)
 			goto bail;
 		kref_init(&func->ref);
@@ -719,7 +719,7 @@ int pmf_register_driver(struct device_node *np,
 		return -EBUSY;
 	}
 
-	dev = kzalloc(sizeof(struct pmf_device), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev = NULL) {
 		DBG("pmf: no memory !\n");
 		return -ENOMEM;
-- 
2.14.2

