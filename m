From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:30 +0000
Subject: [KJ] [PATCH][5/26] drivers/ide/* - compile warning cleanup
Message-Id: <420BEF86.29010.587AA2@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============028542628662836744=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============028542628662836744==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/ide/ide-tape.c linux-2.6.11-rc3-mm/drivers/ide/ide-tape.c
--- linux-2.6.11-rc3-mm-original/drivers/ide/ide-tape.c	2005-02-07 16:32:20.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/ide/ide-tape.c	2005-02-07 18:10:25.000000000 +0200
@@ -2644,7 +2644,12 @@ static void idetape_copy_stage_from_user
 		}
 #endif /* IDETAPE_DEBUG_BUGS */
 		count = min((unsigned int)(bh->b_size - atomic_read(&bh->b_count)), (unsigned int)n);
-		copy_from_user(bh->b_data + atomic_read(&bh->b_count), buf, count);
+		if(copy_from_user(bh->b_data + atomic_read(&bh->b_count), buf, count)) {
+#if IDETAPE_DEBUG_BUGS
+			printk(KERN_ERR "ide-tape/%s: copy_from_user failed!\n",__FUNCTION__);
+#endif /* IDETAPE_DEBUG_BUGS */
+			return;
+		}
 		n -= count;
 		atomic_add(count, &bh->b_count);
 		buf += count;
@@ -2671,7 +2676,12 @@ static void idetape_copy_stage_to_user (
 		}
 #endif /* IDETAPE_DEBUG_BUGS */
 		count = min(tape->b_count, n);
-		copy_to_user(buf, tape->b_data, count);
+		if(copy_to_user(buf, tape->b_data, count)) {
+#if IDETAPE_DEBUG_BUGS
+			printk(KERN_ERR "ide-tape/%s: copy_to_user failed!\n",__FUNCTION__);
+#endif /* IDETAPE_DEBUG_BUGS */
+			return;
+		}
 		n -= count;
 		tape->b_data += count;
 		tape->b_count -= count;




--===============028542628662836744==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============028542628662836744==--
