From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:54 +0000
Subject: [KJ] [PATCH][RESUBMIT][20/21] sound/oss/emu10k1/* - compile warning
Message-Id: <42113C2E.19681.52C41C@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42102606289770739=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42102606289770739==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/sound/oss/emu10k1/cardwi.c linux-2.6.11-rc3-mm2/sound/oss/emu10k1/cardwi.c
--- linux-2.6.11-rc3-mm2-original/sound/oss/emu10k1/cardwi.c	2005-02-12 12:06:28.000000000 +0200
+++ linux-2.6.11-rc3-mm2/sound/oss/emu10k1/cardwi.c	2005-02-12 19:17:48.000000000 +0200
@@ -306,8 +306,12 @@ void emu10k1_wavein_getxfersize(struct w
 
 static void copy_block(u8 __user *dst, u8 * src, u32 str, u32 len, u8 cov)
 {
-	if (cov == 1)
-		__copy_to_user(dst, src + str, len);
+	if (cov == 1) {
+		if (__copy_to_user(dst, src + str, len)) {
+			printk( KERN_ERR "emu10k1: %s: copy_to_user failed\n",__FUNCTION__);
+			return;
+		}
+	}
 	else {
 		u8 byte;
 		u32 i;
@@ -316,7 +320,10 @@ static void copy_block(u8 __user *dst, u
 
 		for (i = 0; i < len; i++) {
 			byte = src[2 * i] ^ 0x80;
-			__copy_to_user(dst + i, &byte, 1);
+			if (__copy_to_user(dst + i, &byte, 1)) {
+				printk( KERN_ERR "emu10k1: %s: copy_to_user failed\n",__FUNCTION__);
+				return;
+			}
 		}
 	}
 }
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/sound/oss/emu10k1/passthrough.c linux-2.6.11-rc3-mm2/sound/oss/emu10k1/passthrough.c
--- linux-2.6.11-rc3-mm2-original/sound/oss/emu10k1/passthrough.c	2004-12-24 23:34:44.000000000 +0200
+++ linux-2.6.11-rc3-mm2/sound/oss/emu10k1/passthrough.c	2005-02-12 19:17:48.000000000 +0200
@@ -162,12 +162,14 @@ ssize_t emu10k1_pt_write(struct file *fi
 
 		DPD(3, "prepend size %d, prepending %d bytes\n", pt->prepend_size, needed);
 		if (count < needed) {
-			copy_from_user(pt->buf + pt->prepend_size, buffer, count);
+			if (copy_from_user(pt->buf + pt->prepend_size, buffer, count))
+				return -EFAULT;
 			pt->prepend_size += count;
 			DPD(3, "prepend size now %d\n", pt->prepend_size);
 			return count;
 		}
-		copy_from_user(pt->buf + pt->prepend_size, buffer, needed);
+		if (copy_from_user(pt->buf + pt->prepend_size, buffer, needed))
+			return -EFAULT;
 		r = pt_putblock(wave_dev, (u16 *) pt->buf, nonblock);
 		if (r)
 			return r;
@@ -178,7 +180,8 @@ ssize_t emu10k1_pt_write(struct file *fi
 	blocks_copied = 0;
 	while (blocks > 0) {
 		u16 __user *bufptr = (u16 __user *) buffer + (bytes_copied/2);
-		copy_from_user(pt->buf, bufptr, PT_BLOCKSIZE);
+		if (copy_from_user(pt->buf, bufptr, PT_BLOCKSIZE))
+			return -EFAULT;
 		r = pt_putblock(wave_dev, (u16 *)pt->buf, nonblock);
 		if (r) {
 			if (bytes_copied)
@@ -193,7 +196,8 @@ ssize_t emu10k1_pt_write(struct file *fi
 	i = count - bytes_copied;
 	if (i) {
 		pt->prepend_size = i;
-		copy_from_user(pt->buf, buffer + bytes_copied, i);
+		if (copy_from_user(pt->buf, buffer + bytes_copied, i))
+			return -EFAULT;
 		bytes_copied += i;
 		DPD(3, "filling prepend buffer with %d bytes", i);
 	}




--===============42102606289770739==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42102606289770739==--
