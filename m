From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Nov 2018 12:33:16 +0000
Subject: [PATCH -next] powerpc/platforms/85xx: drop pointless static qualifier
Message-Id: <1542285196-156161-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Wood <oss@buserror.net>, Kumar Gala <galak@kernel.crashing.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Yue Haibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

There is no need to have the 'void __iomem *cpld_base' variable static
since new value always be assigned before use it.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 arch/powerpc/platforms/85xx/t1042rdb_diu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/t1042rdb_diu.c b/arch/powerpc/platforms/85xx/t1042rdb_diu.c
index dac36ba..2d16521 100644
--- a/arch/powerpc/platforms/85xx/t1042rdb_diu.c
+++ b/arch/powerpc/platforms/85xx/t1042rdb_diu.c
@@ -39,7 +39,7 @@
  */
 static void t1042rdb_set_monitor_port(enum fsl_diu_monitor_port port)
 {
-	static void __iomem *cpld_base;
+	void __iomem *cpld_base;
 
 	cpld_base = of_iomap(cpld_node, 0);
 	if (!cpld_base) {
