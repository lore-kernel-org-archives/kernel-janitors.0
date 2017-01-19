From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 17:00:38 +0000
Subject: [PATCH 6/8] powerpc/nvram: Delete three error messages for a failed memory allocation
Message-Id: <00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
In-Reply-To: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Daniel Axtens <dja@axtens.net>, Geliang Tang <geliangtang@163.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 16:56:46 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/nvram_64.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index 68b970bcf2fc..7af1baaaf01b 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -1040,10 +1040,8 @@ loff_t __init nvram_create_partition(const char *name, int sig,
 	
 	/* Create our OS partition */
 	new_part = kmalloc(sizeof(*new_part), GFP_KERNEL);
-	if (!new_part) {
-		pr_err("%s: kmalloc failed\n", __func__);
+	if (!new_part)
 		return -ENOMEM;
-	}
 
 	new_part->index = free_part->index;
 	new_part->header.signature = sig;
@@ -1145,10 +1143,8 @@ int __init nvram_scan_partitions(void)
 	total_size = ppc_md.nvram_size();
 	
 	header = kmalloc(NVRAM_HEADER_LEN, GFP_KERNEL);
-	if (!header) {
-		printk(KERN_ERR "nvram_scan_partitions: Failed kmalloc\n");
+	if (!header)
 		return -ENOMEM;
-	}
 
 	while (cur_index < total_size) {
 
@@ -1181,10 +1177,8 @@ int __init nvram_scan_partitions(void)
 		}
 		tmp_part = kmalloc(sizeof(struct nvram_partition), GFP_KERNEL);
 		err = -ENOMEM;
-		if (!tmp_part) {
-			printk(KERN_ERR "nvram_scan_partitions: kmalloc failed\n");
+		if (!tmp_part)
 			goto out;
-		}
 		
 		memcpy(&tmp_part->header, &phead, NVRAM_HEADER_LEN);
 		tmp_part->index = cur_index;
-- 
2.11.0

