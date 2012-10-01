From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 01 Oct 2012 04:15:10 +0000
Subject: [infiniband:for-next 37/52] drivers/net/ethernet/mellanox/mlx4/mlx4.h:695:1: error: expected identif
Message-Id: <20121001041510.GA17304@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Roland,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/roland/infiniband.git for-next
head:   c99517cda3548a0e270d374fe97d589d38022b80
commit: 431ee27496b84effaaff9d21f0aae7c68015deeb [37/52] mlx4_core: Stash PCI ID driver_data in mlx4_priv structure
config: x86_64-allmodconfig

All error/warnings:

In file included from drivers/net/ethernet/mellanox/mlx4/alloc.c:42:0:
drivers/net/ethernet/mellanox/mlx4/mlx4.h:695:1: error: expected identifier or '(' before '<<' token
--
In file included from drivers/net/ethernet/mellanox/mlx4/mcg.c:40:0:
drivers/net/ethernet/mellanox/mlx4/mlx4.h:695:1: error: expected identifier or '(' before '<<' token
drivers/net/ethernet/mellanox/mlx4/mcg.c:654:14: warning: 'struct mlx4_net_trans_rule_hw_ctrl' declared inside parameter list [enabled by default]
drivers/net/ethernet/mellanox/mlx4/mcg.c:654:14: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/net/ethernet/mellanox/mlx4/mcg.c: In function 'trans_rule_ctrl_to_hw':
drivers/net/ethernet/mellanox/mlx4/mcg.c:671:4: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/mcg.c:672:4: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/mcg.c:673:4: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/mcg.c: In function 'mlx4_flow_attach':
drivers/net/ethernet/mellanox/mlx4/mcg.c:842:33: error: invalid application of 'sizeof' to incomplete type 'struct mlx4_net_trans_rule_hw_ctrl'
drivers/net/ethernet/mellanox/mlx4/mcg.c:845:17: error: invalid application of 'sizeof' to incomplete type 'struct mlx4_net_trans_rule_hw_ctrl'
--
In file included from drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:47:0:
drivers/net/ethernet/mellanox/mlx4/mlx4.h:695:1: error: expected identifier or '(' before '<<' token
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c: In function 'add_eth_header':
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:3029:9: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:3029:9: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:3029:9: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:3029:9: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:3029:9: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:3029:9: error: dereferencing pointer to incomplete type
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:3030:23: error: invalid use of undefined type 'struct mlx4_net_trans_rule_hw_ctrl'
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c: In function 'mlx4_QP_FLOW_STEERING_ATTACH_wrapper':
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:3091:24: error: invalid use of undefined type 'struct mlx4_net_trans_rule_hw_ctrl'

vim +695 drivers/net/ethernet/mellanox/mlx4/mlx4.h

0b7ca5a9 drivers/net/mlx4/mlx4.h                   (Yevgeny Petrilin 2011-03-22  689) 
b12d93d6 drivers/net/mlx4/mlx4.h                   (Yevgeny Petrilin 2011-03-22  690) struct mlx4_steer {
b12d93d6 drivers/net/mlx4/mlx4.h                   (Yevgeny Petrilin 2011-03-22  691) 	struct list_head promisc_qps[MLX4_NUM_STEERS];
b12d93d6 drivers/net/mlx4/mlx4.h                   (Yevgeny Petrilin 2011-03-22  692) 	struct list_head steer_entries[MLX4_NUM_STEERS];
b12d93d6 drivers/net/mlx4/mlx4.h                   (Yevgeny Petrilin 2011-03-22  693) };
b12d93d6 drivers/net/mlx4/mlx4.h                   (Yevgeny Petrilin 2011-03-22  694) 
431ee274 drivers/net/ethernet/mellanox/mlx4/mlx4.h (Roland Dreier    2012-09-27 @695) <<<<<<< HEAD
a8edc3bf drivers/net/ethernet/mellanox/mlx4/mlx4.h (Hadar Hen Zion   2012-09-05  696) struct mlx4_net_trans_rule_hw_ctrl {
a8edc3bf drivers/net/ethernet/mellanox/mlx4/mlx4.h (Hadar Hen Zion   2012-09-05  697) 	__be32 ctrl;
a8edc3bf drivers/net/ethernet/mellanox/mlx4/mlx4.h (Hadar Hen Zion   2012-09-05  698) 	__be32 vf_vep_port;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
