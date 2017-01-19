From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 16:57:37 +0000
Subject: [PATCH 4/8] powerpc/nvram: Return directly after a failed parameter validation in dev_nvram_read()
Message-Id: <b5dc24f8-4b74-9dfe-fb18-7dc0699b87ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
In-Reply-To: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Daniel Axtens <dja@axtens.net>, Geliang Tang <geliangtang@163.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 16:12:48 +0100

* Return directly after an inappropriate input parameter was detected.

* Delete an initialisation for the variable "tmp" at the beginning
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/nvram_64.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index dc90a0e9ad65..463551589b97 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -745,24 +745,18 @@ static ssize_t dev_nvram_read(struct file *file, char __user *buf,
 			  size_t count, loff_t *ppos)
 {
 	ssize_t ret;
-	char *tmp = NULL;
+	char *tmp;
 	ssize_t size;
 
-	if (!ppc_md.nvram_size) {
-		ret = -ENODEV;
-		goto out;
-	}
+	if (!ppc_md.nvram_size)
+		return -ENODEV;
 
 	size = ppc_md.nvram_size();
-	if (size < 0) {
-		ret = size;
-		goto out;
-	}
+	if (size < 0)
+		return size;
 
-	if (*ppos >= size) {
-		ret = 0;
-		goto out;
-	}
+	if (*ppos >= size)
+		return 0;
 
 	count = min_t(size_t, count, size - *ppos);
 	count = min(count, PAGE_SIZE);
-- 
2.11.0

