From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:36 +0000
Subject: [KJ] [PATCH] [RESEND] [4/29] dvb_ca_en50221.c - vfree() checking
Message-Id: <auto-000001227475@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87307592091490793=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87307592091490793==

dvb_ca_en50221.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 dvb_ca_en50221.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/drivers/media/dvb/dvb-core/dvb_ca_en50221.c	2004-12-24 13:34:31.000000000 -0800
+++ linux-2.6.10/drivers/media/dvb/dvb-core/dvb_ca_en50221.c	2005-01-04 11:36:06.000000000 -0800
@@ -805,8 +805,7 @@
         down_write(&ca->slot_info[slot].sem);
         ca->pub->slot_shutdown(ca->pub, slot);
         ca->slot_info[slot].slot_state = DVB_CA_SLOTSTATE_NONE;
-	if (ca->slot_info[slot].rx_buffer.data)
-		vfree(ca->slot_info[slot].rx_buffer.data);
+	vfree(ca->slot_info[slot].rx_buffer.data);
         ca->slot_info[slot].rx_buffer.data = NULL;
         up_write(&ca->slot_info[slot].sem);
 


--===============87307592091490793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87307592091490793==--
