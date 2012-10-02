From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 02:16:54 +0000
Subject: [nfs:testing 56/83] fs/nfs/netns.h:27:15: error: 'NFS4_MAX_MINOR_VERSION' undeclared here (not in a
Message-Id: <20121002021654.GA6691@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislav Kinsbursky <skinsbursky@parallels.com>
Cc: kernel-janitors@vger.kernel.org, Trond Myklebust <Trond.Myklebust@netapp.com>, linux-nfs@vger.kernel.org

Hi Stanislav,

FYI, kernel build failed on

tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
head:   2afdfa5a846246de50e1881f71ba5c0aac0b415f
commit: b3d19c51723be69fddb64723bebb5a30fb57a483 [56/83] NFS: callback per-net usage counting introduced
config: x86_64-allyesconfig

All error/warnings:

In file included from fs/nfs/dns_resolve.c:51:0:
fs/nfs/netns.h:27:15: error: 'NFS4_MAX_MINOR_VERSION' undeclared here (not in a function)

vim +27 fs/nfs/netns.h

cb9c1c4a (Stanislav Kinsbursky 2012-03-11  15) 
1b340d01 (Stanislav Kinsbursky 2011-11-25  16) struct nfs_net {
1b340d01 (Stanislav Kinsbursky 2011-11-25  17) 	struct cache_detail *nfs_dns_resolve;
9e2e74db (Stanislav Kinsbursky 2012-01-10  18) 	struct rpc_pipe *bl_device_pipe;
cb9c1c4a (Stanislav Kinsbursky 2012-03-11  19) 	struct bl_dev_msg bl_mount_reply;
5ffaf855 (Stanislav Kinsbursky 2012-03-11  20) 	wait_queue_head_t bl_wq;
6b13168b (Stanislav Kinsbursky 2012-01-23  21) 	struct list_head nfs_client_list;
c25d32b2 (Stanislav Kinsbursky 2012-01-23  22) 	struct list_head nfs_volume_list;
89d77c8f (Bryan Schumaker      2012-07-30  23) #if IS_ENABLED(CONFIG_NFS_V4)
28cd1b3f (Stanislav Kinsbursky 2012-01-23  24) 	struct idr cb_ident_idr; /* Protected by nfs_client_lock */
bbe0a3aa (Stanislav Kinsbursky 2012-08-20  25) 	unsigned short nfs_callback_tcpport;
29dcc16a (Stanislav Kinsbursky 2012-08-20  26) 	unsigned short nfs_callback_tcpport6;
b3d19c51 (Stanislav Kinsbursky 2012-08-20 @27) 	int cb_users[NFS4_MAX_MINOR_VERSION + 1];
28cd1b3f (Stanislav Kinsbursky 2012-01-23  28) #endif
dc030858 (Stanislav Kinsbursky 2012-01-23  29) 	spinlock_t nfs_client_lock;
f092075d (Chuck Lever          2012-05-21  30) 	struct timespec boot_time;
1b340d01 (Stanislav Kinsbursky 2011-11-25  31) };
1b340d01 (Stanislav Kinsbursky 2011-11-25  32) 
1b340d01 (Stanislav Kinsbursky 2011-11-25  33) extern int nfs_net_id;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
