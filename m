From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 17:49:48 +0000
Subject: [PATCH 08/10] MIPS: use resource_size
Message-Id: <1577900990-8588-9-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: kernel-janitors@vger.kernel.org, Paul Burton <paulburton@kernel.org>, James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource ptr; @@
- (ptr.end - ptr.start + 1)
+ resource_size(&ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/mips/kernel/setup.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index c3d4212b5f1d..701f4bc3046f 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -515,8 +515,7 @@ static void __init request_crashkernel(struct resource *res)
 	ret = request_resource(res, &crashk_res);
 	if (!ret)
 		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
-			(unsigned long)((crashk_res.end -
-					 crashk_res.start + 1) >> 20),
+			(unsigned long)(resource_size(&crashk_res) >> 20),
 			(unsigned long)(crashk_res.start  >> 20));
 }
 #else /* !defined(CONFIG_KEXEC)		*/
@@ -698,8 +697,7 @@ static void __init arch_mem_init(char **cmdline_p)
 	mips_parse_crashkernel();
 #ifdef CONFIG_KEXEC
 	if (crashk_res.start != crashk_res.end)
-		memblock_reserve(crashk_res.start,
-				 crashk_res.end - crashk_res.start + 1);
+		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
 #endif
 	device_tree_init();
 	sparse_init();
