From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:28 +0000
Subject: [KJ] [PATCH][18/26] drivers/usb/image/* - compile warning cleanup
Message-Id: <420BEF84.5020.58734F@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10476673046613172=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10476673046613172==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: handle error return from scsi_add_host

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/usb/image/microtek.c linux-2.6.11-rc3-mm/drivers/usb/image/microtek.c
--- linux-2.6.11-rc3-mm-original/drivers/usb/image/microtek.c	2005-02-03 03:57:04.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/usb/image/microtek.c	2005-02-09 23:07:41.000000000 +0200
@@ -809,7 +809,11 @@ static int mts_usb_probe(struct usb_inte
 		goto out_free_urb;
 
 	new_desc->host->hostdata[0] = (unsigned long)new_desc;
-	scsi_add_host(new_desc->host, NULL); /* XXX handle failure */
+	if(scsi_add_host(new_desc->host, NULL)) {
+		usb_free_urb(new_desc->urb);
+		kfree(new_desc);
+		return -EIO;
+	}
 	scsi_scan_host(new_desc->host);
 
 	usb_set_intfdata(intf, new_desc);




--===============10476673046613172==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10476673046613172==--
