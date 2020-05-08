From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Fri, 08 May 2020 09:12:56 +0000
Subject: [PATCH] powerpc/spufs: adjust list element pointer type
Message-Id: <1588929176-28527-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Nic Volanschi <eugene.volanschi@inria.fr>, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

Other uses of &gang->aff_list_head, eg in spufs_assert_affinity, indicate
that the list elements have type spu_context, not spu as used here.  Change
the type of tmp accordingly.

This has no impact on the execution, because tmp is not used in the body of
the loop.

Fixes: c5fc8d2a92461 ("[CELL] cell: add placement computation for scheduling of affinity contexts")
Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/powerpc/platforms/cell/spufs/sched.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
index f18d5067cd0f..487fcb47f10d 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -344,8 +344,7 @@ static struct spu *aff_ref_location(struct spu_context *ctx, int mem_aff,
 static void aff_set_ref_point_location(struct spu_gang *gang)
 {
 	int mem_aff, gs, lowest_offset;
-	struct spu_context *ctx;
-	struct spu *tmp;
+	struct spu_context *tmp, *ctx;
 
 	mem_aff = gang->aff_ref_ctx->flags & SPU_CREATE_AFFINITY_MEM;
 	lowest_offset = 0;
