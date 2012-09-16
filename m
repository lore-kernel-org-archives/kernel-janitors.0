From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 16 Sep 2012 02:41:13 +0000
Subject: [josef-btrfs:master 62/66] fs/btrfs/backref.c:1637:2: error: implicit declaration of function 'vfree
Message-Id: <20120916024113.GA8335@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josef Bacik <jbacik@fusionio.com>
Cc: kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org

Hi Josef,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git master
head:   df147c57b7b79624c977ffc4c763018a5426e6d8
commit: b17d706f8458bd6a0f42d5de2f3b7dca26ea8029 [62/66] Btrfs: use vfree instead of kfree
config: s390-allmodconfig

All related error/warning messages:

fs/btrfs/backref.c: In function 'init_data_container':
fs/btrfs/backref.c:1586:2: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
fs/btrfs/backref.c:1586:7: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/btrfs/backref.c: In function 'free_ipath':
fs/btrfs/backref.c:1637:2: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +1637 fs/btrfs/backref.c
  1632	
  1633	void free_ipath(struct inode_fs_paths *ipath)
  1634	{
  1635		if (!ipath)
  1636			return;
> 1637		vfree(ipath->fspath);
  1638		kfree(ipath);
  1639	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
