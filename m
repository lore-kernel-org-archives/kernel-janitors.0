From: Alexander Nyberg <alexn@telia.com>
Date: Wed, 16 Jun 2004 00:14:07 +0000
Subject: [Kernel-janitors] Sparse checks #11
Message-Id: <1087344846.676.143.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87243912539705892=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87243912539705892==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checks for drivers/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== include/linux/ipmi.h 1.3 vs edited =====
--- 1.3/include/linux/ipmi.h    2004-04-12 19:54:18 +02:00
+++ edited/include/linux/ipmi.h 2004-06-15 23:59:31 +02:00
@@ -159,7 +159,7 @@
        unsigned char  netfn;
        unsigned char  cmd;
        unsigned short data_len;
-       unsigned char  *data;
+       unsigned char  __user *data;
 };

 /*
@@ -539,7 +539,7 @@
        int     recv_type; /* Is this a command, response or an
                              asyncronous event. */

-       unsigned char *addr;    /* Address the message was from is put
+       unsigned char __user *addr;/* Address the message was from is put
                                   here.  The caller must supply the
                                   memory. */
        unsigned int  addr_len; /* The size of the address buffer.



--===============87243912539705892==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87243912539705892==--
