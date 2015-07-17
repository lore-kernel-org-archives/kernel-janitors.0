From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 17 Jul 2015 07:19:59 +0000
Subject: [PATCH 1/2] powerpc/nvram: Add missing kfree in error path
Message-Id: <4fd8daff1bb5daad99d909aa75ff5c2702c4c490.1437117145.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'nvram_write_header' fails, then 'new_part' should be freed, otherwise,
there is a memory leak.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is *untested* because I have no way to trigger the error.
---
 arch/powerpc/kernel/nvram_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index 1e703f8..574ff59 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -1079,6 +1079,7 @@ loff_t __init nvram_create_partition(const char *name, int sig,
 	if (rc <= 0) {
 		pr_err("nvram_create_os_partition: nvram_write_header "
 		       "failed (%d)\n", rc);
+		kfree(new_part);
 		return rc;
 	}
 	list_add_tail(&new_part->partition, &free_part->partition);
-- 
2.1.4

