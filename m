From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Nov 2014 06:19:47 +0000
Subject: [patch 1/2 -next] usb: gadget: f_hid: use after free in hidg_alloc_inst()
Message-Id: <20141113061947.GB1280@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We free "opts" on the error path and then dereference it.

Fixes: 21a9476a7ba8 ('usb: gadget: hid: add configfs support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 56ca3fc..220035f 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -875,6 +875,7 @@ static struct usb_function_instance *hidg_alloc_inst(void)
 		kfree(opts);
 		if (idr_is_empty(&hidg_ida.idr))
 			ghid_cleanup();
+		goto unlock;
 	}
 	config_group_init_type_name(&opts->func_inst.group, "", &hid_func_type);
 
