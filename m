From: wfg@linux.intel.com
Date: Wed, 11 Jul 2012 05:14:16 +0000
Subject: [ceph:wip-rbd-new 32/33] drivers/block/rbd.c:2547:6: warning: cast from pointer to integer of differ
Message-Id: <20120711051416.GA10639@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Alex,

There are new compile warnings show up in

tree:   git://github.com/ceph/ceph-client.git wip-rbd-new
head:   a2f737c12499200a71077524ad70e7c2b1272c96
commit: 01eb9011a3db646d9d7b661a89fc609407edb273 [32/33] rbd: flesh out header version 2 support

All warnings:

drivers/block/rbd.c: In function 'rbd_dev_header_v2':
drivers/block/rbd.c:2547:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

vim +2547 drivers/block/rbd.c
  2544		*image_size = ceph_decode_64(&p);
  2545	
  2546		printk("order %d image_size %lld\n", rbd_dev->header.obj_order,
> 2547						(long long) image_size);
  2548		kfree(reply_buf);
  2549	
  2550		return 0;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
