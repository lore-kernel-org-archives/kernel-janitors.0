From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:52 +0000
Subject: [KJ] [PATCH][RESUBMIT][6/21] drivers/isdn/i4l/* - compile warning
Message-Id: <42113C2C.20128.52BC5B@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7497861872295295=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7497861872295295==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns, initialize return value to reasonable number in case used before 
initialized.

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/isdn/i4l/isdn_common.c linux-2.6.11-rc3-mm2/drivers/isdn/i4l/isdn_common.c
--- linux-2.6.11-rc3-mm2-original/drivers/isdn/i4l/isdn_common.c	2004-12-24 23:34:31.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/isdn/i4l/isdn_common.c	2005-02-12 17:01:02.000000000 +0200
@@ -1842,8 +1842,12 @@ isdn_writebuf_stub(int drvidx, int chan,
 	if (!skb)
 		return 0;
 	skb_reserve(skb, hl);
-	copy_from_user(skb_put(skb, len), buf, len);
+	if (copy_from_user(skb_put(skb, len), buf, len)) {
+		ret = -EFAULT;
+		goto after_writebuf_skb;
+	}
 	ret = dev->drv[drvidx]->interface->writebuf_skb(drvidx, chan, 1, skb);
+after_writebuf_skb:
 	if (ret <= 0)
 		dev_kfree_skb(skb);
 	if (ret > 0)
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/isdn/i4l/isdn_ppp.c linux-2.6.11-rc3-mm2/drivers/isdn/i4l/isdn_ppp.c
--- linux-2.6.11-rc3-mm2-original/drivers/isdn/i4l/isdn_ppp.c	2004-12-24 23:35:01.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/isdn/i4l/isdn_ppp.c	2005-02-12 17:01:02.000000000 +0200
@@ -789,7 +789,8 @@ isdn_ppp_read(int min, struct file *file
 	is->first = b;
 
 	spin_unlock_irqrestore(&is->buflock, flags);
-	copy_to_user(buf, save_buf, count);
+	if (copy_to_user(buf, save_buf, count))
+		count = -EFAULT; /* make sure we free the save_buf */
 	kfree(save_buf);
 
 	return count;
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/isdn/i4l/isdn_v110.c linux-2.6.11-rc3-mm2/drivers/isdn/i4l/isdn_v110.c
--- linux-2.6.11-rc3-mm2-original/drivers/isdn/i4l/isdn_v110.c	2004-12-24 23:35:49.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/isdn/i4l/isdn_v110.c	2005-02-12 17:01:02.000000000 +0200
@@ -520,7 +520,7 @@ isdn_v110_stat_callback(int idx, isdn_ct
 {
 	isdn_v110_stream *v = NULL;
 	int i;
-	int ret;
+	int ret = 0;
 
 	if (idx < 0)
 		return 0;




--===============7497861872295295==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7497861872295295==--
