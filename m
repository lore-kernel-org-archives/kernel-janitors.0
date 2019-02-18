From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 12:56:44 +0000
Subject: [PATCH -next] powerpc/pseries: Drop pointless static qualifier in vpa_debugfs_init()
Message-Id: <20190218125644.87448-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <yamada.masahiro@socionext.com>, Aravinda Prasad <aravinda@linux.vnet.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, "Aneesh
 Kumar K.V" <aneesh.kumar@linux.ibm.com>, Laurent Dufour <ldufour@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

There is no need to have the 'struct dentry *vpa_dir' variable static
since new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index f2a9f0adc2d3..f649c1b652eb 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1263,7 +1263,7 @@ static int __init vpa_debugfs_init(void)
 {
 	char name[16];
 	long i;
-	static struct dentry *vpa_dir;
+	struct dentry *vpa_dir;
 
 	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
 		return 0;
