From: Scott Feldman <sfeldma@pobox.com>
Date: Sat, 18 Sep 2004 22:30:00 +0000
Subject: [Kernel-janitors] [PATCH] TODO: add MODULE_VERSION
Message-Id: <1095546600.3593.37.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40729153801515361=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40729153801515361==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

[New to kj - is this the correct way to add to the TODO?]

* Add Matt Domsch's note to add MODULE_VERSION to all modules
  to kj TODO list.

------------------------

--- TODO.orig	2004-09-18 15:23:20.813573216 -0700
+++ TODO	2004-09-18 15:26:28.069106048 -0700
@@ -636,4 +636,45 @@ altinstructions is a false positive, twe
 
 The rest of the warnings look real, apart from the strange eh_frame.
 
+----------------------------------------------------------------------
+From: Matt Domsch
+Sat Jul 24 10:51:04 PDT 2004
+
+Request for Patches
+
+The 2.6.x kernel includes a MODULE_VERSION() parameter for providing
+one convenient way for all modules to state what  *their* version is
+(as opposed to the version of the larger kernel they're included in).
+
+I've started submitting patches to the subsystem maintainers to add
+MODULE_VERSION() entries for drivers that I particularly care about,
+and would appreciate assistance handling the others.
+
+For modules which display their version as a string somewhere via
+printk, the preferred mechanism is:
+
+#define DRV_VERSION "1.0.0"
+MODULE_VERSION(DRV_VERSION);
+
+One aspect of MODULE_VERSION I haven't tackled is re-formatting
+existing versions into the preferred method as found in include/linux/module.h:
+
+/* Version of form [<epoch>:]<version>[-<extra-version>].
+   Or for CVS/RCS ID version, everything but the number is stripped.
+  <epoch>: A (small) unsigned integer which allows you to start
+   versions
+           anew. If not mentioned, it's zero.  eg. "2:1.0" is after
+           "1:2.0".
+  <version>: The <version> may contain only alphanumerics and the
+           character `.'.  Ordered by numeric sort for numeric parts,
+           ascii sort for ascii parts (as per RPM or DEB algorithm).
+  <extraversion>: Like <version>, but inserted for local
+           customizations, eg "rh3" or "rusty1".
+*/
+
+I leave such reformatting up to each driver author and/or patch
+submitter.
+
+Thanks,
+Matt
 --------------------------------end-----------------------------------



--===============40729153801515361==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40729153801515361==--
