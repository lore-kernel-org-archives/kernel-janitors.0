From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 17:05:00 +0000
Subject: [PATCH 8/8] powerpc/nvram: Move an assignment for the variable "err" in nvram_scan_partitions()
Message-Id: <e8e419d4-cbf2-78e6-fb76-ec65a63bf5f6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
In-Reply-To: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Daniel Axtens <dja@axtens.net>, Geliang Tang <geliangtang@163.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 17:27:37 +0100

A local variable was set to an error code before a concrete error situation
was detected. Thus move the corresponding assignment into an if branch
to indicate a software failure there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/nvram_64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index ed54147e3c60..5172115c4ef1 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -1173,9 +1173,10 @@ int __init nvram_scan_partitions(void)
 			goto out;
 		}
 		tmp_part = kmalloc(sizeof(*tmp_part), GFP_KERNEL);
-		err = -ENOMEM;
-		if (!tmp_part)
+		if (!tmp_part) {
+			err = -ENOMEM;
 			goto out;
+		}
 		
 		memcpy(&tmp_part->header, &phead, NVRAM_HEADER_LEN);
 		tmp_part->index = cur_index;
-- 
2.11.0

