From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 16:56:35 +0000
Subject: [PATCH 3/8] powerpc/nvram: Move an assignment for the variable "ret" in dev_nvram_write()
Message-Id: <dcaccc31-99ac-ef90-cbef-79dbf72f0a4d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
In-Reply-To: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Daniel Axtens <dja@axtens.net>, Geliang Tang <geliangtang@163.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 15:55:36 +0100

A local variable was set to an error code before a concrete error situation
was detected. Thus move the corresponding assignment into an if branch
to indicate a software failure there.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/nvram_64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index cf839adf3aa7..dc90a0e9ad65 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -806,9 +806,10 @@ static ssize_t dev_nvram_write(struct file *file, const char __user *buf,
 	if (!tmp)
 		return -ENOMEM;
 
-	ret = -EFAULT;
-	if (copy_from_user(tmp, buf, count))
+	if (copy_from_user(tmp, buf, count)) {
+		ret = -EFAULT;
 		goto out;
+	}
 
 	ret = ppc_md.nvram_write(tmp, count, ppos);
 
-- 
2.11.0

