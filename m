From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 05:49:04 +0000
Subject: [samsung:v4l-framedesc 168/235] drivers/media/usb/pwc/pwc-if.c:1003:16: warning: ignoring return val
Message-Id: <20120929054904.GA24004@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ezequiel,

FYI, there are new compile warnings show up in

tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l-framedesc
head:   fc4382b505966b2574c985588ac23825dd639e29
commit: 896f38f582730a19eb49677105b4fe4c0270b82e [168/235] [media] videobuf2-core: Replace BUG_ON and return an error at vb2_queue_init()
config: x86_64-allmodconfig

All warnings:

drivers/media/usb/pwc/pwc-if.c: In function 'usb_pwc_probe':
drivers/media/usb/pwc/pwc-if.c:1003:16: warning: ignoring return value of 'vb2_queue_init', declared with attribute warn_unused_result [-Wunused-result]
--
drivers/media/usb/uvc/uvc_queue.c: In function 'uvc_queue_init':
drivers/media/usb/uvc/uvc_queue.c:134:16: warning: ignoring return value of 'vb2_queue_init', declared with attribute warn_unused_result [-Wunused-result]

vim +1003 drivers/media/usb/pwc/pwc-if.c

885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06   996) 	/* Init videobuf2 queue structure */
885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06   997) 	pdev->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06   998) 	pdev->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06   999) 	pdev->vb_queue.drv_priv = pdev;
885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06  1000) 	pdev->vb_queue.buf_struct_size = sizeof(struct pwc_frame_buf);
885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06  1001) 	pdev->vb_queue.ops = &pwc_vb_queue_ops;
885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06  1002) 	pdev->vb_queue.mem_ops = &vb2_vmalloc_memops;
885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06 @1003) 	vb2_queue_init(&pdev->vb_queue);
885fe18f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06  1004) 
9a7b2d1f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06  1005) 	/* Init video_device structure */
9a7b2d1f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06  1006) 	memcpy(&pdev->vdev, &pwc_template, sizeof(pwc_template));
9a7b2d1f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06  1007) 	strcpy(pdev->vdev.name, name);
2e43dec0 drivers/media/video/pwc/pwc-if.c (Hans Verkuil   2012-07-02  1008) 	pdev->vdev.queue = &pdev->vb_queue;
2e43dec0 drivers/media/video/pwc/pwc-if.c (Hans Verkuil   2012-07-02  1009) 	pdev->vdev.queue->lock = &pdev->vb_queue_lock;
76ae8538 drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-07-19  1010) 	set_bit(V4L2_FL_USE_FH_PRIO, &pdev->vdev.flags);
9a7b2d1f drivers/media/video/pwc/pwc-if.c (Hans de Goede  2011-06-06  1011) 	video_set_drvdata(&pdev->vdev, pdev);

The code at line 1003 was first introduced by commit:
885fe18 [media] pwc: Replace private buffer management code with videobuf2

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
