From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 17 Aug 2012 03:18:54 +0000
Subject: [samsung:v4l-exynos-gsc 77/299] drivers/media/video/em28xx/em28xx-video.c:2269:17-20: ERROR: referen
Message-Id: <20120817031854.GB26261@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hans.verkuil@cisco.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, linux-media@vger.kernel.org

Hi Hans,

FYI, there are new coccinelle warnings show up in

tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l-exynos-gsc
head:   8ac9447881f291e7b473d946bde20ec952621a23
commit: 876cb14db3bec19960751bb02f03f72ee024a46f [77/299] [media] em28xx: remove V4L2_FL_LOCK_ALL_FOPS

All coccinelle warnings:

+ drivers/media/video/em28xx/em28xx-video.c:2269:17-20: ERROR: reference preceded by free on line 2267

vim +2269 drivers/media/video/em28xx/em28xx-video.c
  2266				kfree(dev->alt_max_pkt_size);
  2267				kfree(dev);
  2268				kfree(fh);
> 2269				mutex_unlock(&dev->lock);
  2270				return 0;
  2271			}
  2272	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
