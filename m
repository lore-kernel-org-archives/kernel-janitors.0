From: James Lamanna <jlamanna@gmail.com>
Date: Tue, 04 Jan 2005 21:56:20 +0000
Subject: [KJ] [PATCH] [0/29] vfree() checking cleanups
Message-Id: <aa4c40ff05010413564cdc7ef5@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36003773107462012=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36003773107462012==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The following patches against 2.6.10 clean up the case of:
if (var)
    vfree(var);

This check is redundant since it occurs in vfree()

There is a similar cleanup for kfree(), but I haven't gotten to that
one yet since there are many many many more of those.

-- James Lamanna

--===============36003773107462012==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36003773107462012==--
