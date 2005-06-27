From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Jun 2005 16:50:50 +0000
Subject: [KJ] [PATCH] update faq
Message-Id: <20050627165050.GF28435@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============094876246891460347=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============094876246891460347==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi KJ-ers,

One cleanup reqarding ketchup usage & one additional feature (make O=)
for the FAQ.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- faq	2005-05-29 17:05:59.000000000 -0700
+++ faq.dev	2005-06-27 09:48:57.000000000 -0700
@@ -63,11 +63,22 @@ When diffing more files (especially in d
 that is should break hardlinks; vim can be taught by setting
 "set backupcopy=auto,breakhardlink" in your ~/.vimrc .
 Example usage:
-  ketchup 2.6.12
+  ketchup 2.6 (currently 2.6.12)
   cp -al linux-2.6.12 mytree
   # change some random files in mytree/
   diff -pruNX Documentation/dontdiff linux-2.6.12 mytree > my_new_patch
 
+Another useful feature is the kbuild O= feature. This allows you to save
+output files in a separate directory. Thus, one could, in parallel to
+the linked source trees, create separate build trees, e.g. linux/views/
+and linux/build/. Example usage, presuming you followed the ketchup
+steps above in a directory called views:
+
+  cd ../build/
+  mkdir linux-2.6.12
+  cp backup_config_from_somewhere_else linux-2.6.12/.
+  cd ../views/linux-2.6.12/
+  make O=$(pwd | sed s/views/build/) -j4 oldconfig bzImage
 
 Since typing Signed-off-by gets boring, here's a ~/.vimrc sample:
  map <F1> ^iSigned-off-by: Random C Developer <rcd@example.com><CR><ESC>^

--===============094876246891460347==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============094876246891460347==--
