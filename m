From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 09 Sep 2019 20:19:19 +0000
Subject: [PATCH] iommu/io-pgtable: Move some initialization data to .init.rodata
Message-Id: <20190909201919.5841-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The memory used by '__init' functions can be freed once the initialization
phase has been performed.

Mark some 'static const' array defined and used within some '__init'
functions as '__initconst', so that the corresponding data can also be
discarded.

Without '__initconst', the data are put in the .rodata section.
With the qualifier, they are put in the .init.rodata section.

With gcc 8.3.0, the following changes have been measured:

Without '__initconst':
   section      size
  .rodata       00000720
  .init.rodata  00000018

With '__initconst':
   section      size
  .rodata       00000660
  .init.rodata  00000058

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Adding __initconst "within" a function is not in line with kernel/include/init.h
which states that:
 * Don't forget to initialize data not at file scope, i.e. within a function,
 * as gcc otherwise puts the data into the bss section and not into the init
 * section.
However, having the array within the function or out-side the function
seems to have no impact in the generated code and in the section used.
According to my test, both put the data in .init.rodata.

Maybe the comment is outdated or related to some older vesion of gcc.
---
 drivers/iommu/io-pgtable-arm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 161a7d56264d..24076f0560c6 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1109,7 +1109,7 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 
 static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 {
-	static const enum io_pgtable_fmt fmts[] = {
+	static const enum io_pgtable_fmt fmts[] __initconst = {
 		ARM_64_LPAE_S1,
 		ARM_64_LPAE_S2,
 	};
@@ -1208,13 +1208,13 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 
 static int __init arm_lpae_do_selftests(void)
 {
-	static const unsigned long pgsize[] = {
+	static const unsigned long pgsize[] __initconst = {
 		SZ_4K | SZ_2M | SZ_1G,
 		SZ_16K | SZ_32M,
 		SZ_64K | SZ_512M,
 	};
 
-	static const unsigned int ias[] = {
+	static const unsigned int ias[] __initconst = {
 		32, 36, 40, 42, 44, 48,
 	};
 
-- 
2.20.1
