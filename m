From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Feb 2012 06:36:40 +0000
Subject: re: staging: ozwpan: Added basic L2 protocol support
Message-Id: <20120228063640.GA20506@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Chris Kelly,

This is a semi-automatic email about new static checker warnings.

The patch 1619cb6f2dd9: "staging: ozwpan: Added basic L2 protocol 
support" from Feb 20, 2012, leads to the following Smatch complaint:

drivers/staging/ozwpan/ozproto.c:919 oz_protocol_init()
	 error: we previously assumed 'devs' could be null (see line 915)

drivers/staging/ozwpan/ozproto.c
   914		skb_queue_head_init(&g_rx_queue);
   915		if (devs && (devs[0] = '*')) {
                    ^^^^
Checked.

   916			oz_binding_add(0);
   917		} else {
   918			char d[32];
   919			while (*devs) {
                               ^^^^^
Dereferenced without checking.

   920				devs = oz_get_next_device_name(devs, d, sizeof(d));
   921				if (d[0])

Actually there are a bunch of Smatch warnings for this driver if someone
wanted something to cleanup.

drivers/staging/ozwpan/ozusbsvc.c:71 oz_usb_start() warn: returning -1 instead of -ENOMEM is sloppy
drivers/staging/ozwpan/ozhcd.c:283 oz_free_urb_link() info: redundant null check on urbl calling kfree()
drivers/staging/ozwpan/ozhcd.c:1733 oz_hcd_urb_enqueue() info: why not propagate 'port_ix' from oz_get_port_from_addr() instead of -32?
drivers/staging/ozwpan/ozpd.c:180 oz_pd_alloc() error: potential null derefence 'pd'.
drivers/staging/ozwpan/ozpd.c:392 oz_tx_frame_free() warn: 'f' was already freed.
drivers/staging/ozwpan/ozpd.c:393 oz_tx_frame_free() info: redundant null check on f calling kfree()
drivers/staging/ozwpan/ozpd.c:654 oz_isoc_stream_create() warn: returning -1 instead of -ENOMEM is sloppy
drivers/staging/ozwpan/ozpd.c:664 oz_isoc_stream_create() info: redundant null check on st calling kfree()
drivers/staging/ozwpan/ozproto.c:560 oz_protocol_timer() info: redundant null check on t calling kfree()
drivers/staging/ozwpan/ozproto.c:919 oz_protocol_init() error: we previously assumed 'devs' could be null (see line 915)
drivers/staging/ozwpan/ozcdev.c:406 oz_cdev_start() warn: returning -1 instead of -ENOMEM is sloppy
drivers/staging/ozwpan/ozeltbuf.c:138 oz_elt_stream_create() warn: returning -1 instead of -ENOMEM is sloppy

regards,
dan carpenter

