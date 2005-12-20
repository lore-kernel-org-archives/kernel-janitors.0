From: "Jaco Kroon" <jaco@kroon.co.za>
Date: Tue, 20 Dec 2005 06:46:43 +0000
Subject: [KJ] [PATCH] Remove unneeded initialisation
Message-Id: <15054.192.96.150.57.1135061203.squirrel@mail.interexcel.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Initialising global variables causes them to be placed in .data, thus
variables that are initialised to 0 should rather not be initialised at
all, causing them to be placed in .bss.

The is as per the KJ TODO list which can be found at
http://janitor.kernelnewbies.org/TODO:

--- linux-2.6.15-rc5.orig/fs/cifs/cifsfs.c      2005-12-14
10:14:58.000000000 +0200
+++ linux-2.6.15-rc5/fs/cifs/cifsfs.c   2005-12-20 08:33:23.000000000 +0200
@@ -47,9 +47,9 @@
 static struct quotactl_ops cifs_quotactl_ops;
 #endif

-int cifsFYI = 0;
+int cifsFYI;
 int cifsERROR = 1;
-int traceSMB = 0;
+int traceSMB;
 unsigned int oplockEnabled = 1;
 unsigned int experimEnabled = 0;
 unsigned int linuxExtEnabled = 1;


-- 
There are 10 kinds of people in the world, those who understand binary,
and those who don't.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
