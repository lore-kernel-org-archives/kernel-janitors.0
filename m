From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 16:53:57 +0000
Subject: [PATCH 1/8] powerpc/nvram: Return directly after a failed parameter validation in dev_nvram_write()
Message-Id: <5a23fa96-5227-3bcd-414d-65b2ae1f2f52@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
In-Reply-To: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Daniel Axtens <dja@axtens.net>, Geliang Tang <geliangtang@163.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 15:22:56 +0100

* Return directly after an inappropriate input parameter was detected.

* Delete an initialisation for the variable "tmp" at the beginning
  and an assignment for the variable "ret" which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/nvram_64.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index 34d2c595de23..37d08b95c3f0 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -790,17 +790,15 @@ static ssize_t dev_nvram_write(struct file *file, const char __user *buf,
 			  size_t count, loff_t *ppos)
 {
 	ssize_t ret;
-	char *tmp = NULL;
+	char *tmp;
 	ssize_t size;
 
-	ret = -ENODEV;
 	if (!ppc_md.nvram_size)
-		goto out;
+		return -ENODEV;
 
-	ret = 0;
 	size = ppc_md.nvram_size();
 	if (*ppos >= size || size < 0)
-		goto out;
+		return 0;
 
 	count = min_t(size_t, count, size - *ppos);
 	count = min(count, PAGE_SIZE);
-- 
2.11.0

