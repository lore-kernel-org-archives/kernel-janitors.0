From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 08 Jul 2013 16:50:05 +0000
Subject: build regressions 2013-07-08
Message-Id: <51daedbd.bvNcVTL1KVAvoFeW%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/f2fs/dir.c:649:25: error: 'bit_ops' undeclared (first use in this function)
samsung-laptop.c:(.init.text+0xb165): undefined reference to `acpi_video_unregister'
samsung-laptop.c:(.init.text+0xb165): undefined reference to `acpi_video_unregister'
samsung-laptop.c:(.init.text+0xb165): undefined reference to `acpi_video_unregister'
samsung-laptop.c:(.init.text+0xb165): undefined reference to `acpi_video_unregister'
arch/xtensa/kernel/time.c:27:31: fatal error: linux/sched_clock.h: No such file or directory

[warnings]
fs/f2fs/dir.c:619:6: warning: unused variable 'slots' [-Wunused-variable]

[sparse]
drivers/infiniband/hw/mlx5/qp.c:901:9: sparse: context imbalance in 'mlx5_ib_lock_cqs' - different lock contexts for basic block
drivers/infiniband/hw/mlx5/qp.c:926:9: sparse: context imbalance in 'mlx5_ib_unlock_cqs' - different lock contexts for basic block
include/linux/spinlock.h:340:9: sparse: context imbalance in 'mlx5_ib_post_send' - different lock contexts for basic block
drivers/net/ethernet/mellanox/mlx5/core/main.c:215:38: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] uar_page_sz @@    got restricted __be32 [usertype] uar_page_sz @@
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:337:27: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:337:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:337:27: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:337:27: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:337:27: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:337:27: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:337:27: sparse: restricted __be32 degrades to integer
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:341:25: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:341:25: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:341:25: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:341:25: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:341:25: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:341:25: sparse: cast from restricted __be32
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:341:25: sparse: restricted __be32 degrades to integer
drivers/net/ethernet/mellanox/mlx5/core/health.c:142:17: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:142:17: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:144:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:144:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:145:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:145:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:146:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:146:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:147:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:147:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:148:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:149:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:149:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:150:9: sparse: dereference of noderef expression
drivers/net/ethernet/mellanox/mlx5/core/health.c:150:9: sparse: dereference of noderef expression
fs/locks.c:165:1: sparse: symbol 'file_lock_lglock_lock' was not declared. Should it be static?
fs/locks.c:166:8: sparse: symbol 'file_lock_list' was not declared. Should it be static?
fs/f2fs/dir.c:649:61: sparse: undefined identifier 'bit_ops'

[coccinelle]
drivers/net/ethernet/mellanox/mlx5/core/cmd.c:894:7-14: WARNING opportunity for memdup_user
drivers/infiniband/hw/mlx5/mr.c:445:2-3: Unneeded semicolon
drivers/infiniband/hw/mlx5/mr.c:167:2-3: Unneeded semicolon
drivers/net/ethernet/mellanox/mlx5/core/cmd.c:98:11-19: WARNING opportunity for simple_open, see also structure on line 938
drivers/net/ethernet/mellanox/mlx5/core/cmd.c:98:11-19: WARNING opportunity for simple_open, see also structure on line 718
drivers/net/ethernet/mellanox/mlx5/core/cmd.c:98:11-19: WARNING opportunity for simple_open, see also structure on line 1006
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:145:11-19: WARNING opportunity for simple_open, see also structure on line 470
drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:145:11-19: WARNING opportunity for simple_open, see also structure on line 203
drivers/infiniband/hw/mlx5/mr.c:52:11-20: WARNING opportunity for simple_open, see also structure on line 289
drivers/infiniband/hw/mlx5/mr.c:52:11-20: WARNING opportunity for simple_open, see also structure on line 227

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
