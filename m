From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Aug 2020 17:43:16 +0000
Subject: [PATCH] powerpc/oprofile: fix spelling mistake "contex" -> "context"
Message-Id: <20200804174316.402425-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Richter <rric@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, oprofile-list@lists.sf.net, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/powerpc/oprofile/cell/spu_task_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/oprofile/cell/spu_task_sync.c b/arch/powerpc/oprofile/cell/spu_task_sync.c
index df59d0bb121f..489f993100d5 100644
--- a/arch/powerpc/oprofile/cell/spu_task_sync.c
+++ b/arch/powerpc/oprofile/cell/spu_task_sync.c
@@ -572,7 +572,7 @@ void spu_sync_buffer(int spu_num, unsigned int *samples,
 		 * samples are recorded.
 		 * No big deal -- so we just drop a few samples.
 		 */
-		pr_debug("SPU_PROF: No cached SPU contex "
+		pr_debug("SPU_PROF: No cached SPU context "
 			  "for SPU #%d. Dropping samples.\n", spu_num);
 		goto out;
 	}
-- 
2.27.0
