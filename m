From: walter harms <wharms@bfs.de>
Date: Tue, 29 Mar 2005 07:34:00 +0000
Subject: [KJ] string.linux-2.6.10/lib/c: documentation strncpy()
Message-Id: <424904E8.1040308@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7338356143149114=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7338356143149114==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi list,
this clarifys the documentation on the behavier of strncpy().

re,
	walter



--- string.linux-2.6.10/lib/c.bak	2005-03-29 09:14:31.000000000 +0200
+++ linux-2.6.10/lib/string.c	2005-03-29 09:27:01.000000000 +0200
@@ -87,6 +87,10 @@
   *
   * The result is not %NUL-terminated if the source exceeds
   * @count bytes.
+ *
+ * In the case where the length of @src is less than  that  of
+ * count, the remainder of @dest will be padded with %NUL.
+ *	
   */
  char * strncpy(char * dest,const char *src,size_t count)
  {


--===============7338356143149114==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7338356143149114==--
