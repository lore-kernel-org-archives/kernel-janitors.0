From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:53 +0000
Subject: [KJ] [PATCH][RESUBMIT][15/21] drivers/usb/image/* - compile warning
Message-Id: <42113C2D.15605.52C12E@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7804377193283023=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7804377193283023==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle error return from 
scsi_add_host

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/usb/image/microtek.c linux-2.6.11-rc3-mm2/drivers/usb/image/microtek.c
--- linux-2.6.11-rc3-mm2-original/drivers/usb/image/microtek.c	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/usb/image/microtek.c	2005-02-14 00:20:03.960653648 +0200
@@ -703,6 +703,7 @@ static int mts_usb_probe(struct usb_inte
 	int ep_in_set[3]; /* this will break if we have more than three endpoints
 			   which is why we check */
 	int *ep_in_current = ep_in_set;
+	int err_retval = -ENOMEM;
 
 	struct mts_desc * new_desc;
 	struct vendor_product const* p;
@@ -809,7 +810,10 @@ static int mts_usb_probe(struct usb_inte
 		goto out_free_urb;
 
 	new_desc->host->hostdata[0] = (unsigned long)new_desc;
-	scsi_add_host(new_desc->host, NULL); /* XXX handle failure */
+	if (scsi_add_host(new_desc->host, NULL)) {
+		err_retval = -EIO;
+		goto out_free_urb;
+	}
 	scsi_scan_host(new_desc->host);
 
 	usb_set_intfdata(intf, new_desc);
@@ -820,7 +824,7 @@ static int mts_usb_probe(struct usb_inte
  out_kfree:
 	kfree(new_desc);
  out:
-	return -ENOMEM;
+	return err_retval;
 }
 
 static void mts_usb_disconnect (struct usb_interface *intf)




--===============7804377193283023==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7804377193283023==--
