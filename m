From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 07:33:55 +0000
Subject: [Kernel-janitors] [PATCH] Check returns of {copy_{from, to},
Message-Id: <20040104073355.GA21714@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch compiles, and tested. Please apply.

http://www.anomalistic.org/patches/sunrpc-check-ret-fixes-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/net/sunrpc/sysctl.c 2.6.1-rc1-mm1-fix/net/sunrpc/sysctl.c
--- 2.6.1-rc1-mm1/net/sunrpc/sysctl.c	2003-12-18 10:58:07.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/net/sunrpc/sysctl.c	2004-01-04 15:07:20.000000000 +0800
@@ -81,7 +81,8 @@
 
 		if (left > sizeof(tmpbuf) - 1)
 			return -EINVAL;
-		copy_from_user(tmpbuf, p, left);
+		if (copy_from_user(tmpbuf, p, left))
+			return -EFAULT;
 		tmpbuf[left] = '\0';
 
 		for (p = tmpbuf, value = 0; '0' <= *p && *p <= '9'; p++, left--)
@@ -101,9 +102,11 @@
 		len = sprintf(tmpbuf, "%d", *(unsigned int *) table->data);
 		if (len > left)
 			len = left;
-		__copy_to_user(buffer, tmpbuf, len);
+		if (__copy_to_user(buffer, tmpbuf, len))
+			return -EFAULT;
 		if ((left -= len) > 0) {
-			put_user('\n', (char *)buffer + len);
+			if (put_user('\n', (char *)buffer + len)) 
+				return -EFAULT;
 			left--;
 		}
 	}

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
