From: Steven French <sfrench@us.ibm.com>
Date: Tue, 21 Feb 2006 22:37:39 +0000
Subject: [KJ] Re: [Patch] kzalloc conversion in fs/cifs
Message-Id: <OF57A8F0B2.D5D6B63C-ON8725711C.007A85A0-8625711C.007C195A@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38638911982177837=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============38638911982177837==
Content-Type: multipart/alternative;
    boundary="----------=_1140561303-8422-532"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1140561303-8422-532
Content-type: text/plain; charset=US-ASCII
Content-Disposition: inline





> this converts fs/cifs to kzalloc() usage.
Makes sense.  Now checked into cifs development tree on kernel.org
(cifs-2.6.git)
I was not planning to sync up with the mainline tree until after 2.6.16
so it may be a few weeks before it makes it into mainline.

Thanks.


Steve French
Senior Software Engineer
Linux Technology Center - IBM Austin
phone: 512-838-2294
email: sfrench at-sign us dot ibm dot com
------------=_1140561303-8422-532
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body>
<p><tt>&gt; this converts fs/cifs to kzalloc() usage.</tt><br>
<tt>Makes sense. &nbsp;Now checked into cifs development tree on kernel.org</tt><br>
<tt>(cifs-2.6.git)</tt><br>
<tt>I was not planning to sync up with the mainline tree until after 2.6.16</tt><br>
<tt>so it may be a few weeks before it makes it into mainline.</tt><br>
<br>
<tt>Thanks.</tt><br>
<br>
<br>
Steve French<br>
Senior Software Engineer<br>
Linux Technology Center - IBM Austin<br>
phone: 512-838-2294<br>
email: sfrench at-sign us dot ibm dot com</body></html>
------------=_1140561303-8422-532--

--===============38638911982177837==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38638911982177837==--
