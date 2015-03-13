From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Mar 2015 09:11:42 +0000
Subject: [patch 2/2] usb: gadget: printer: use after free in gprinter_alloc_inst()
Message-Id: <20150313091142.GC18923@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There was a missing goto so we free "opts" and then dereference it.

Fixes: ee1cd515e889 ('usb: gadget: printer: add configfs support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index caa56de..48882ec 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1307,6 +1307,7 @@ static struct usb_function_instance *gprinter_alloc_inst(void)
 		kfree(opts);
 		if (idr_is_empty(&printer_ida.idr))
 			gprinter_cleanup();
+		goto unlock;
 	}
 	config_group_init_type_name(&opts->func_inst.group, "",
 				    &printer_func_type);
