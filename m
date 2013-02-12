From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 12 Feb 2013 04:01:53 +0000
Subject: [PATCH 5/5] xen: remove redundant NULL check before unregister_and_remove_pcpu().
Message-Id: <1360641713-24895-6-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Cyril Roelandt <tipecaml@gmail.com>, konrad.wilk@oracle.com, jeremy@goop.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org

unregister_and_remove_pcpu on a NULL pointer is a no-op, so the NULL check in
sync_pcpu can be removed.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/xen/pcpu.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index 067fcfa..5a27a45 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -278,8 +278,7 @@ static int sync_pcpu(uint32_t cpu, uint32_t *max_cpu)
 	 * Only those at cpu present map has its sys interface.
 	 */
 	if (info->flags & XEN_PCPU_FLAGS_INVALID) {
-		if (pcpu)
-			unregister_and_remove_pcpu(pcpu);
+		unregister_and_remove_pcpu(pcpu);
 		return 0;
 	}
 
-- 
1.7.10.4

