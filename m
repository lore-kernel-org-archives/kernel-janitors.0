From: Jesse Millan <jessem@cs.pdx.edu>
Date: Tue, 24 May 2005 04:56:21 +0000
Subject: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <4292B3F5.3000501@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020801040100060002040908"
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3224.8030307@cs.pdx.edu>
In-Reply-To: <428E3224.8030307@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020801040100060002040908
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


This patch eliminates the warning that is generated when passing a
reference of an uninitialized variable to a function where it possible
that the function will return without initializing that variable.

Might help I attach the patch.

--------------020801040100060002040908
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc4/fs/eventpoll.c~	2005-05-23 21:25:57.666594235 -0700
+++ linux-2.6.12-rc4/fs/eventpoll.c	2005-05-23 21:29:13.398503871 -0700
@@ -748,6 +748,9 @@ eexit_3:
 eexit_2:
 	put_filp(file);
 eexit_1:
+	/* Reference went uninitialized. */
+	*efd = 0;
+	*efile = NULL;
 	return error;
 }

--------------020801040100060002040908
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020801040100060002040908--
