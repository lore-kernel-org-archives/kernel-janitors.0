From: Daniel Smertnig <daniel.smertnig@gmail.com>
Date: Sat, 18 Jun 2005 15:55:51 +0000
Subject: [KJ] [PATCH] isdn: check copy_to/from_user() return values
Message-Id: <20050618155550.GA14655@dansme-mobile.smertnig>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67399151996993445=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67399151996993445==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix a few instances in drivers/isdn/ where the copy_(to|from)_user
return value is not checked for.

(I hope that's the right way to handle it)

Signed-off-by: Daniel Smertnig <daniel.smertnig@gmail.com>

diff --git a/drivers/isdn/hisax/config.c b/drivers/isdn/hisax/config.c
--- a/drivers/isdn/hisax/config.c
+++ b/drivers/isdn/hisax/config.c
@@ -631,7 +631,9 @@ int HiSax_readstatus(u_char __user *buf,
 		count = cs->status_end - cs->status_read + 1;
 		if (count >= len)
 			count = len;
-		copy_to_user(p, cs->status_read, count);
+		if (copy_to_user(p, cs->status_read, count)) {
+			return -EFAULT;
+		}
 		cs->status_read += count;
 		if (cs->status_read > cs->status_end)
 			cs->status_read = cs->status_buf;
@@ -642,7 +644,9 @@ int HiSax_readstatus(u_char __user *buf,
 				cnt = HISAX_STATUS_BUFSIZE;
 			else
 				cnt = count;
-			copy_to_user(p, cs->status_read, cnt);
+			if (copy_to_user(p, cs->status_read, cnt)) {
+				return -EFAULT;
+			}
 			p += cnt;
 			cs->status_read += cnt % HISAX_STATUS_BUFSIZE;
 			count -= cnt;
diff --git a/drivers/isdn/i4l/isdn_common.c b/drivers/isdn/i4l/isdn_common.c
--- a/drivers/isdn/i4l/isdn_common.c
+++ b/drivers/isdn/i4l/isdn_common.c
@@ -1842,7 +1842,10 @@ isdn_writebuf_stub(int drvidx, int chan,
 	if (!skb)
 		return 0;
 	skb_reserve(skb, hl);
-	copy_from_user(skb_put(skb, len), buf, len);
+	if (copy_from_user(skb_put(skb, len), buf, len)) {
+		dev_kfree_skb(skb);
+		return -EFAULT;
+	}
 	ret = dev->drv[drvidx]->interface->writebuf_skb(drvidx, chan, 1, skb);
 	if (ret <= 0)
 		dev_kfree_skb(skb);
diff --git a/drivers/isdn/i4l/isdn_ppp.c b/drivers/isdn/i4l/isdn_ppp.c
--- a/drivers/isdn/i4l/isdn_ppp.c
+++ b/drivers/isdn/i4l/isdn_ppp.c
@@ -788,7 +788,9 @@ isdn_ppp_read(int min, struct file *file
 	is->first = b;
 
 	spin_unlock_irqrestore(&is->buflock, flags);
-	copy_to_user(buf, save_buf, count);
+	if (copy_to_user(buf, save_buf, count)) {
+		count = -EFAULT;
+	}
 	kfree(save_buf);
 
 	return count;

--===============67399151996993445==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67399151996993445==--
