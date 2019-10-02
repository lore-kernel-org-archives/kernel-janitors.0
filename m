From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 02 Oct 2019 07:12:27 +0000
Subject: [PATCH 2/2] Coccinelle: Move coccicheck directories into a new subdirectory
Message-Id: <327d09a5-1efb-5cff-f7c5-d08df09eed23@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190928094245.45696-1-yuehaibing@huawei.com>
 <7664d59f-78cf-7644-0ee8-304b3d78d752@web.de>
 <alpine.DEB.2.21.1909291840280.3346@hadrien>
 <d8c97f0a-6ce2-0f5a-74a9-63366c17f3a6@web.de>
In-Reply-To: <d8c97f0a-6ce2-0f5a-74a9-63366c17f3a6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Martijn Coenen <maco@android.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Maennich <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Yue Haibing <yuehaibing@huawei.com>, Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 2 Oct 2019 08:33:13 +0200

The standard system configuration for the tool “coccicheck” depends
on a specific directory for the selection of files which should be
automatically executed as scripts for the semantic patch language.
Move the needed directories into a subdirectory which indicates the support
for the default operation mode of provided files in this hierarchy.

Fixes: eb8305aecb958e8787e7d603c7765c1dcace3a2b ("scripts: Coccinelle script for namespace dependencies.")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccicheck                                              | 2 +-
 .../{ => coccicheck/default}/api/alloc/alloc_cast.cocci         | 0
 .../{ => coccicheck/default}/api/alloc/pool_zalloc-simple.cocci | 0
 .../{ => coccicheck/default}/api/alloc/zalloc-simple.cocci      | 0
 .../{ => coccicheck/default}/api/atomic_as_refcounter.cocci     | 0
 .../{ => coccicheck/default}/api/check_bq27xxx_data.cocci       | 0
 .../coccinelle/{ => coccicheck/default}/api/d_find_alias.cocci  | 0
 .../default}/api/debugfs/debugfs_simple_attr.cocci              | 0
 .../default}/api/devm_platform_ioremap_resource.cocci           | 0
 scripts/coccinelle/{ => coccicheck/default}/api/err_cast.cocci  | 0
 scripts/coccinelle/{ => coccicheck/default}/api/kstrdup.cocci   | 0
 scripts/coccinelle/{ => coccicheck/default}/api/memdup.cocci    | 0
 .../coccinelle/{ => coccicheck/default}/api/memdup_user.cocci   | 0
 .../{ => coccicheck/default}/api/platform_get_irq.cocci         | 0
 .../{ => coccicheck/default}/api/platform_no_drv_owner.cocci    | 0
 .../coccinelle/{ => coccicheck/default}/api/pm_runtime.cocci    | 0
 scripts/coccinelle/{ => coccicheck/default}/api/ptr_ret.cocci   | 0
 .../coccinelle/{ => coccicheck/default}/api/resource_size.cocci | 0
 .../coccinelle/{ => coccicheck/default}/api/simple_open.cocci   | 0
 .../coccinelle/{ => coccicheck/default}/api/stream_open.cocci   | 0
 scripts/coccinelle/{ => coccicheck/default}/api/vma_pages.cocci | 0
 scripts/coccinelle/{ => coccicheck/default}/free/clk_put.cocci  | 0
 .../coccinelle/{ => coccicheck/default}/free/devm_free.cocci    | 0
 .../coccinelle/{ => coccicheck/default}/free/ifnullfree.cocci   | 0
 scripts/coccinelle/{ => coccicheck/default}/free/iounmap.cocci  | 0
 scripts/coccinelle/{ => coccicheck/default}/free/kfree.cocci    | 0
 .../coccinelle/{ => coccicheck/default}/free/kfreeaddr.cocci    | 0
 .../{ => coccicheck/default}/free/pci_free_consistent.cocci     | 0
 .../coccinelle/{ => coccicheck/default}/free/put_device.cocci   | 0
 .../default}/iterators/device_node_continue.cocci               | 0
 scripts/coccinelle/{ => coccicheck/default}/iterators/fen.cocci | 0
 .../coccinelle/{ => coccicheck/default}/iterators/itnull.cocci  | 0
 .../{ => coccicheck/default}/iterators/list_entry_update.cocci  | 0
 .../{ => coccicheck/default}/iterators/use_after_iter.cocci     | 0
 .../coccinelle/{ => coccicheck/default}/locks/call_kern.cocci   | 0
 .../coccinelle/{ => coccicheck/default}/locks/double_lock.cocci | 0
 scripts/coccinelle/{ => coccicheck/default}/locks/flags.cocci   | 0
 .../coccinelle/{ => coccicheck/default}/locks/mini_lock.cocci   | 0
 .../coccinelle/{ => coccicheck/default}/misc/array_size.cocci   | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/badty.cocci    | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/boolconv.cocci | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/boolinit.cocci | 0
 .../coccinelle/{ => coccicheck/default}/misc/boolreturn.cocci   | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/bugon.cocci    | 0
 .../{ => coccicheck/default}/misc/cond_no_effect.cocci          | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/cstptr.cocci   | 0
 .../coccinelle/{ => coccicheck/default}/misc/doubleinit.cocci   | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/ifaddr.cocci   | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/ifcol.cocci    | 0
 .../coccinelle/{ => coccicheck/default}/misc/irqf_oneshot.cocci | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/noderef.cocci  | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/of_table.cocci | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/orplus.cocci   | 0
 .../coccinelle/{ => coccicheck/default}/misc/returnvar.cocci    | 0
 .../coccinelle/{ => coccicheck/default}/misc/semicolon.cocci    | 0
 scripts/coccinelle/{ => coccicheck/default}/misc/warn.cocci     | 0
 scripts/coccinelle/{ => coccicheck/default}/null/badzero.cocci  | 0
 .../coccinelle/{ => coccicheck/default}/null/deref_null.cocci   | 0
 scripts/coccinelle/{ => coccicheck/default}/null/eno.cocci      | 0
 scripts/coccinelle/{ => coccicheck/default}/null/kmerr.cocci    | 0
 .../{ => coccicheck/default}/tests/doublebitand.cocci           | 0
 .../coccinelle/{ => coccicheck/default}/tests/doubletest.cocci  | 0
 .../coccinelle/{ => coccicheck/default}/tests/odd_ptr_err.cocci | 0
 .../default}/tests/unsigned_lesser_than_zero.cocci              | 0
 64 files changed, 1 insertion(+), 1 deletion(-)
 rename scripts/coccinelle/{ => coccicheck/default}/api/alloc/alloc_cast.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/alloc/pool_zalloc-simple.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/alloc/zalloc-simple.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/atomic_as_refcounter.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/check_bq27xxx_data.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/d_find_alias.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/debugfs/debugfs_simple_attr.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/devm_platform_ioremap_resource.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/err_cast.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/kstrdup.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/memdup.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/memdup_user.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/platform_get_irq.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/platform_no_drv_owner.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/pm_runtime.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/ptr_ret.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/resource_size.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/simple_open.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/stream_open.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/api/vma_pages.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/free/clk_put.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/free/devm_free.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/free/ifnullfree.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/free/iounmap.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/free/kfree.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/free/kfreeaddr.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/free/pci_free_consistent.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/free/put_device.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/iterators/device_node_continue.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/iterators/fen.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/iterators/itnull.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/iterators/list_entry_update.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/iterators/use_after_iter.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/locks/call_kern.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/locks/double_lock.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/locks/flags.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/locks/mini_lock.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/array_size.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/badty.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/boolconv.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/boolinit.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/boolreturn.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/bugon.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/cond_no_effect.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/cstptr.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/doubleinit.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/ifaddr.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/ifcol.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/irqf_oneshot.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/noderef.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/of_table.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/orplus.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/returnvar.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/semicolon.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/misc/warn.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/null/badzero.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/null/deref_null.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/null/eno.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/null/kmerr.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/tests/doublebitand.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/tests/doubletest.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/tests/odd_ptr_err.cocci (100%)
 rename scripts/coccinelle/{ => coccicheck/default}/tests/unsigned_lesser_than_zero.cocci (100%)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index e04d328210ac..3359f3f528ba 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -254,7 +254,7 @@ else
 fi

 if [ "$COCCI" = "" ] ; then
-    for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
+    for f in `find $srctree/scripts/coccinelle/coccicheck/default/ -name '*.cocci' -type f | sort`; do
 	coccinelle $f
     done
 else
diff --git a/scripts/coccinelle/api/alloc/alloc_cast.cocci b/scripts/coccinelle/coccicheck/default/api/alloc/alloc_cast.cocci
similarity index 100%
rename from scripts/coccinelle/api/alloc/alloc_cast.cocci
rename to scripts/coccinelle/coccicheck/default/api/alloc/alloc_cast.cocci
diff --git a/scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci b/scripts/coccinelle/coccicheck/default/api/alloc/pool_zalloc-simple.cocci
similarity index 100%
rename from scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci
rename to scripts/coccinelle/coccicheck/default/api/alloc/pool_zalloc-simple.cocci
diff --git a/scripts/coccinelle/api/alloc/zalloc-simple.cocci b/scripts/coccinelle/coccicheck/default/api/alloc/zalloc-simple.cocci
similarity index 100%
rename from scripts/coccinelle/api/alloc/zalloc-simple.cocci
rename to scripts/coccinelle/coccicheck/default/api/alloc/zalloc-simple.cocci
diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/coccicheck/default/api/atomic_as_refcounter.cocci
similarity index 100%
rename from scripts/coccinelle/api/atomic_as_refcounter.cocci
rename to scripts/coccinelle/coccicheck/default/api/atomic_as_refcounter.cocci
diff --git a/scripts/coccinelle/api/check_bq27xxx_data.cocci b/scripts/coccinelle/coccicheck/default/api/check_bq27xxx_data.cocci
similarity index 100%
rename from scripts/coccinelle/api/check_bq27xxx_data.cocci
rename to scripts/coccinelle/coccicheck/default/api/check_bq27xxx_data.cocci
diff --git a/scripts/coccinelle/api/d_find_alias.cocci b/scripts/coccinelle/coccicheck/default/api/d_find_alias.cocci
similarity index 100%
rename from scripts/coccinelle/api/d_find_alias.cocci
rename to scripts/coccinelle/coccicheck/default/api/d_find_alias.cocci
diff --git a/scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci b/scripts/coccinelle/coccicheck/default/api/debugfs/debugfs_simple_attr.cocci
similarity index 100%
rename from scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
rename to scripts/coccinelle/coccicheck/default/api/debugfs/debugfs_simple_attr.cocci
diff --git a/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci b/scripts/coccinelle/coccicheck/default/api/devm_platform_ioremap_resource.cocci
similarity index 100%
rename from scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
rename to scripts/coccinelle/coccicheck/default/api/devm_platform_ioremap_resource.cocci
diff --git a/scripts/coccinelle/api/err_cast.cocci b/scripts/coccinelle/coccicheck/default/api/err_cast.cocci
similarity index 100%
rename from scripts/coccinelle/api/err_cast.cocci
rename to scripts/coccinelle/coccicheck/default/api/err_cast.cocci
diff --git a/scripts/coccinelle/api/kstrdup.cocci b/scripts/coccinelle/coccicheck/default/api/kstrdup.cocci
similarity index 100%
rename from scripts/coccinelle/api/kstrdup.cocci
rename to scripts/coccinelle/coccicheck/default/api/kstrdup.cocci
diff --git a/scripts/coccinelle/api/memdup.cocci b/scripts/coccinelle/coccicheck/default/api/memdup.cocci
similarity index 100%
rename from scripts/coccinelle/api/memdup.cocci
rename to scripts/coccinelle/coccicheck/default/api/memdup.cocci
diff --git a/scripts/coccinelle/api/memdup_user.cocci b/scripts/coccinelle/coccicheck/default/api/memdup_user.cocci
similarity index 100%
rename from scripts/coccinelle/api/memdup_user.cocci
rename to scripts/coccinelle/coccicheck/default/api/memdup_user.cocci
diff --git a/scripts/coccinelle/api/platform_get_irq.cocci b/scripts/coccinelle/coccicheck/default/api/platform_get_irq.cocci
similarity index 100%
rename from scripts/coccinelle/api/platform_get_irq.cocci
rename to scripts/coccinelle/coccicheck/default/api/platform_get_irq.cocci
diff --git a/scripts/coccinelle/api/platform_no_drv_owner.cocci b/scripts/coccinelle/coccicheck/default/api/platform_no_drv_owner.cocci
similarity index 100%
rename from scripts/coccinelle/api/platform_no_drv_owner.cocci
rename to scripts/coccinelle/coccicheck/default/api/platform_no_drv_owner.cocci
diff --git a/scripts/coccinelle/api/pm_runtime.cocci b/scripts/coccinelle/coccicheck/default/api/pm_runtime.cocci
similarity index 100%
rename from scripts/coccinelle/api/pm_runtime.cocci
rename to scripts/coccinelle/coccicheck/default/api/pm_runtime.cocci
diff --git a/scripts/coccinelle/api/ptr_ret.cocci b/scripts/coccinelle/coccicheck/default/api/ptr_ret.cocci
similarity index 100%
rename from scripts/coccinelle/api/ptr_ret.cocci
rename to scripts/coccinelle/coccicheck/default/api/ptr_ret.cocci
diff --git a/scripts/coccinelle/api/resource_size.cocci b/scripts/coccinelle/coccicheck/default/api/resource_size.cocci
similarity index 100%
rename from scripts/coccinelle/api/resource_size.cocci
rename to scripts/coccinelle/coccicheck/default/api/resource_size.cocci
diff --git a/scripts/coccinelle/api/simple_open.cocci b/scripts/coccinelle/coccicheck/default/api/simple_open.cocci
similarity index 100%
rename from scripts/coccinelle/api/simple_open.cocci
rename to scripts/coccinelle/coccicheck/default/api/simple_open.cocci
diff --git a/scripts/coccinelle/api/stream_open.cocci b/scripts/coccinelle/coccicheck/default/api/stream_open.cocci
similarity index 100%
rename from scripts/coccinelle/api/stream_open.cocci
rename to scripts/coccinelle/coccicheck/default/api/stream_open.cocci
diff --git a/scripts/coccinelle/api/vma_pages.cocci b/scripts/coccinelle/coccicheck/default/api/vma_pages.cocci
similarity index 100%
rename from scripts/coccinelle/api/vma_pages.cocci
rename to scripts/coccinelle/coccicheck/default/api/vma_pages.cocci
diff --git a/scripts/coccinelle/free/clk_put.cocci b/scripts/coccinelle/coccicheck/default/free/clk_put.cocci
similarity index 100%
rename from scripts/coccinelle/free/clk_put.cocci
rename to scripts/coccinelle/coccicheck/default/free/clk_put.cocci
diff --git a/scripts/coccinelle/free/devm_free.cocci b/scripts/coccinelle/coccicheck/default/free/devm_free.cocci
similarity index 100%
rename from scripts/coccinelle/free/devm_free.cocci
rename to scripts/coccinelle/coccicheck/default/free/devm_free.cocci
diff --git a/scripts/coccinelle/free/ifnullfree.cocci b/scripts/coccinelle/coccicheck/default/free/ifnullfree.cocci
similarity index 100%
rename from scripts/coccinelle/free/ifnullfree.cocci
rename to scripts/coccinelle/coccicheck/default/free/ifnullfree.cocci
diff --git a/scripts/coccinelle/free/iounmap.cocci b/scripts/coccinelle/coccicheck/default/free/iounmap.cocci
similarity index 100%
rename from scripts/coccinelle/free/iounmap.cocci
rename to scripts/coccinelle/coccicheck/default/free/iounmap.cocci
diff --git a/scripts/coccinelle/free/kfree.cocci b/scripts/coccinelle/coccicheck/default/free/kfree.cocci
similarity index 100%
rename from scripts/coccinelle/free/kfree.cocci
rename to scripts/coccinelle/coccicheck/default/free/kfree.cocci
diff --git a/scripts/coccinelle/free/kfreeaddr.cocci b/scripts/coccinelle/coccicheck/default/free/kfreeaddr.cocci
similarity index 100%
rename from scripts/coccinelle/free/kfreeaddr.cocci
rename to scripts/coccinelle/coccicheck/default/free/kfreeaddr.cocci
diff --git a/scripts/coccinelle/free/pci_free_consistent.cocci b/scripts/coccinelle/coccicheck/default/free/pci_free_consistent.cocci
similarity index 100%
rename from scripts/coccinelle/free/pci_free_consistent.cocci
rename to scripts/coccinelle/coccicheck/default/free/pci_free_consistent.cocci
diff --git a/scripts/coccinelle/free/put_device.cocci b/scripts/coccinelle/coccicheck/default/free/put_device.cocci
similarity index 100%
rename from scripts/coccinelle/free/put_device.cocci
rename to scripts/coccinelle/coccicheck/default/free/put_device.cocci
diff --git a/scripts/coccinelle/iterators/device_node_continue.cocci b/scripts/coccinelle/coccicheck/default/iterators/device_node_continue.cocci
similarity index 100%
rename from scripts/coccinelle/iterators/device_node_continue.cocci
rename to scripts/coccinelle/coccicheck/default/iterators/device_node_continue.cocci
diff --git a/scripts/coccinelle/iterators/fen.cocci b/scripts/coccinelle/coccicheck/default/iterators/fen.cocci
similarity index 100%
rename from scripts/coccinelle/iterators/fen.cocci
rename to scripts/coccinelle/coccicheck/default/iterators/fen.cocci
diff --git a/scripts/coccinelle/iterators/itnull.cocci b/scripts/coccinelle/coccicheck/default/iterators/itnull.cocci
similarity index 100%
rename from scripts/coccinelle/iterators/itnull.cocci
rename to scripts/coccinelle/coccicheck/default/iterators/itnull.cocci
diff --git a/scripts/coccinelle/iterators/list_entry_update.cocci b/scripts/coccinelle/coccicheck/default/iterators/list_entry_update.cocci
similarity index 100%
rename from scripts/coccinelle/iterators/list_entry_update.cocci
rename to scripts/coccinelle/coccicheck/default/iterators/list_entry_update.cocci
diff --git a/scripts/coccinelle/iterators/use_after_iter.cocci b/scripts/coccinelle/coccicheck/default/iterators/use_after_iter.cocci
similarity index 100%
rename from scripts/coccinelle/iterators/use_after_iter.cocci
rename to scripts/coccinelle/coccicheck/default/iterators/use_after_iter.cocci
diff --git a/scripts/coccinelle/locks/call_kern.cocci b/scripts/coccinelle/coccicheck/default/locks/call_kern.cocci
similarity index 100%
rename from scripts/coccinelle/locks/call_kern.cocci
rename to scripts/coccinelle/coccicheck/default/locks/call_kern.cocci
diff --git a/scripts/coccinelle/locks/double_lock.cocci b/scripts/coccinelle/coccicheck/default/locks/double_lock.cocci
similarity index 100%
rename from scripts/coccinelle/locks/double_lock.cocci
rename to scripts/coccinelle/coccicheck/default/locks/double_lock.cocci
diff --git a/scripts/coccinelle/locks/flags.cocci b/scripts/coccinelle/coccicheck/default/locks/flags.cocci
similarity index 100%
rename from scripts/coccinelle/locks/flags.cocci
rename to scripts/coccinelle/coccicheck/default/locks/flags.cocci
diff --git a/scripts/coccinelle/locks/mini_lock.cocci b/scripts/coccinelle/coccicheck/default/locks/mini_lock.cocci
similarity index 100%
rename from scripts/coccinelle/locks/mini_lock.cocci
rename to scripts/coccinelle/coccicheck/default/locks/mini_lock.cocci
diff --git a/scripts/coccinelle/misc/array_size.cocci b/scripts/coccinelle/coccicheck/default/misc/array_size.cocci
similarity index 100%
rename from scripts/coccinelle/misc/array_size.cocci
rename to scripts/coccinelle/coccicheck/default/misc/array_size.cocci
diff --git a/scripts/coccinelle/misc/badty.cocci b/scripts/coccinelle/coccicheck/default/misc/badty.cocci
similarity index 100%
rename from scripts/coccinelle/misc/badty.cocci
rename to scripts/coccinelle/coccicheck/default/misc/badty.cocci
diff --git a/scripts/coccinelle/misc/boolconv.cocci b/scripts/coccinelle/coccicheck/default/misc/boolconv.cocci
similarity index 100%
rename from scripts/coccinelle/misc/boolconv.cocci
rename to scripts/coccinelle/coccicheck/default/misc/boolconv.cocci
diff --git a/scripts/coccinelle/misc/boolinit.cocci b/scripts/coccinelle/coccicheck/default/misc/boolinit.cocci
similarity index 100%
rename from scripts/coccinelle/misc/boolinit.cocci
rename to scripts/coccinelle/coccicheck/default/misc/boolinit.cocci
diff --git a/scripts/coccinelle/misc/boolreturn.cocci b/scripts/coccinelle/coccicheck/default/misc/boolreturn.cocci
similarity index 100%
rename from scripts/coccinelle/misc/boolreturn.cocci
rename to scripts/coccinelle/coccicheck/default/misc/boolreturn.cocci
diff --git a/scripts/coccinelle/misc/bugon.cocci b/scripts/coccinelle/coccicheck/default/misc/bugon.cocci
similarity index 100%
rename from scripts/coccinelle/misc/bugon.cocci
rename to scripts/coccinelle/coccicheck/default/misc/bugon.cocci
diff --git a/scripts/coccinelle/misc/cond_no_effect.cocci b/scripts/coccinelle/coccicheck/default/misc/cond_no_effect.cocci
similarity index 100%
rename from scripts/coccinelle/misc/cond_no_effect.cocci
rename to scripts/coccinelle/coccicheck/default/misc/cond_no_effect.cocci
diff --git a/scripts/coccinelle/misc/cstptr.cocci b/scripts/coccinelle/coccicheck/default/misc/cstptr.cocci
similarity index 100%
rename from scripts/coccinelle/misc/cstptr.cocci
rename to scripts/coccinelle/coccicheck/default/misc/cstptr.cocci
diff --git a/scripts/coccinelle/misc/doubleinit.cocci b/scripts/coccinelle/coccicheck/default/misc/doubleinit.cocci
similarity index 100%
rename from scripts/coccinelle/misc/doubleinit.cocci
rename to scripts/coccinelle/coccicheck/default/misc/doubleinit.cocci
diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/coccicheck/default/misc/ifaddr.cocci
similarity index 100%
rename from scripts/coccinelle/misc/ifaddr.cocci
rename to scripts/coccinelle/coccicheck/default/misc/ifaddr.cocci
diff --git a/scripts/coccinelle/misc/ifcol.cocci b/scripts/coccinelle/coccicheck/default/misc/ifcol.cocci
similarity index 100%
rename from scripts/coccinelle/misc/ifcol.cocci
rename to scripts/coccinelle/coccicheck/default/misc/ifcol.cocci
diff --git a/scripts/coccinelle/misc/irqf_oneshot.cocci b/scripts/coccinelle/coccicheck/default/misc/irqf_oneshot.cocci
similarity index 100%
rename from scripts/coccinelle/misc/irqf_oneshot.cocci
rename to scripts/coccinelle/coccicheck/default/misc/irqf_oneshot.cocci
diff --git a/scripts/coccinelle/misc/noderef.cocci b/scripts/coccinelle/coccicheck/default/misc/noderef.cocci
similarity index 100%
rename from scripts/coccinelle/misc/noderef.cocci
rename to scripts/coccinelle/coccicheck/default/misc/noderef.cocci
diff --git a/scripts/coccinelle/misc/of_table.cocci b/scripts/coccinelle/coccicheck/default/misc/of_table.cocci
similarity index 100%
rename from scripts/coccinelle/misc/of_table.cocci
rename to scripts/coccinelle/coccicheck/default/misc/of_table.cocci
diff --git a/scripts/coccinelle/misc/orplus.cocci b/scripts/coccinelle/coccicheck/default/misc/orplus.cocci
similarity index 100%
rename from scripts/coccinelle/misc/orplus.cocci
rename to scripts/coccinelle/coccicheck/default/misc/orplus.cocci
diff --git a/scripts/coccinelle/misc/returnvar.cocci b/scripts/coccinelle/coccicheck/default/misc/returnvar.cocci
similarity index 100%
rename from scripts/coccinelle/misc/returnvar.cocci
rename to scripts/coccinelle/coccicheck/default/misc/returnvar.cocci
diff --git a/scripts/coccinelle/misc/semicolon.cocci b/scripts/coccinelle/coccicheck/default/misc/semicolon.cocci
similarity index 100%
rename from scripts/coccinelle/misc/semicolon.cocci
rename to scripts/coccinelle/coccicheck/default/misc/semicolon.cocci
diff --git a/scripts/coccinelle/misc/warn.cocci b/scripts/coccinelle/coccicheck/default/misc/warn.cocci
similarity index 100%
rename from scripts/coccinelle/misc/warn.cocci
rename to scripts/coccinelle/coccicheck/default/misc/warn.cocci
diff --git a/scripts/coccinelle/null/badzero.cocci b/scripts/coccinelle/coccicheck/default/null/badzero.cocci
similarity index 100%
rename from scripts/coccinelle/null/badzero.cocci
rename to scripts/coccinelle/coccicheck/default/null/badzero.cocci
diff --git a/scripts/coccinelle/null/deref_null.cocci b/scripts/coccinelle/coccicheck/default/null/deref_null.cocci
similarity index 100%
rename from scripts/coccinelle/null/deref_null.cocci
rename to scripts/coccinelle/coccicheck/default/null/deref_null.cocci
diff --git a/scripts/coccinelle/null/eno.cocci b/scripts/coccinelle/coccicheck/default/null/eno.cocci
similarity index 100%
rename from scripts/coccinelle/null/eno.cocci
rename to scripts/coccinelle/coccicheck/default/null/eno.cocci
diff --git a/scripts/coccinelle/null/kmerr.cocci b/scripts/coccinelle/coccicheck/default/null/kmerr.cocci
similarity index 100%
rename from scripts/coccinelle/null/kmerr.cocci
rename to scripts/coccinelle/coccicheck/default/null/kmerr.cocci
diff --git a/scripts/coccinelle/tests/doublebitand.cocci b/scripts/coccinelle/coccicheck/default/tests/doublebitand.cocci
similarity index 100%
rename from scripts/coccinelle/tests/doublebitand.cocci
rename to scripts/coccinelle/coccicheck/default/tests/doublebitand.cocci
diff --git a/scripts/coccinelle/tests/doubletest.cocci b/scripts/coccinelle/coccicheck/default/tests/doubletest.cocci
similarity index 100%
rename from scripts/coccinelle/tests/doubletest.cocci
rename to scripts/coccinelle/coccicheck/default/tests/doubletest.cocci
diff --git a/scripts/coccinelle/tests/odd_ptr_err.cocci b/scripts/coccinelle/coccicheck/default/tests/odd_ptr_err.cocci
similarity index 100%
rename from scripts/coccinelle/tests/odd_ptr_err.cocci
rename to scripts/coccinelle/coccicheck/default/tests/odd_ptr_err.cocci
diff --git a/scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci b/scripts/coccinelle/coccicheck/default/tests/unsigned_lesser_than_zero.cocci
similarity index 100%
rename from scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci
rename to scripts/coccinelle/coccicheck/default/tests/unsigned_lesser_than_zero.cocci
--
2.23.0
