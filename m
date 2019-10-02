From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 02 Oct 2019 07:09:07 +0000
Subject: [PATCH 0/2] Coccinelle: Extend directory hierarchy
Message-Id: <d8c97f0a-6ce2-0f5a-74a9-63366c17f3a6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190928094245.45696-1-yuehaibing@huawei.com>
 <7664d59f-78cf-7644-0ee8-304b3d78d752@web.de>
 <alpine.DEB.2.21.1909291840280.3346@hadrien>
In-Reply-To: <alpine.DEB.2.21.1909291840280.3346@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Martijn Coenen <maco@android.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Maennich <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Yue Haibing <yuehaibing@huawei.com>, Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 2 Oct 2019 09:05:09 +0200

Introduce a specific directory structure as a fix for a recently added
script for the semantic patch language. Pick this opportunity up
for another collateral evolution.

Markus Elfring (2):
  Move the SmPL script “add_namespace.cocci” into a new directory
  Move coccicheck directories into a new subdirectory

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
 scripts/coccinelle/{misc => direct}/add_namespace.cocci         | 0
 scripts/nsdeps                                                  | 2 +-
 66 files changed, 2 insertions(+), 2 deletions(-)
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
 rename scripts/coccinelle/{misc => direct}/add_namespace.cocci (100%)

--
2.23.0
