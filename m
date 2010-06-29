From: Tilman Schmidt <tilman@imap.cc>
Date: Tue, 29 Jun 2010 22:18:15 +0000
Subject: Re: [patch] isdn/gigaset: add a kfree() to error path
Message-Id: <4C2A7127.3040609@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig62F8A007A1BF7B890011DBAD"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100628212046.GM19184@bicker>
In-Reply-To: <20100628212046.GM19184@bicker>
To: Dan Carpenter <error27@gmail.com>
Cc: Hansjoerg Lipp <hjlipp@web.de>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig62F8A007A1BF7B890011DBAD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dan,

thanks for your patch. It is quite correct as it stands.
There is however another problem with that error path, in
that it also doesn't free the previously allocated channel.
I prefer not to carry two separate patches for that, so I'm
replacing your patch with the following augmented patch,
which I'll submit together with my other pending patches
for 2.6.36 soon:

Subject: [PATCH] isdn/gigaset: fix leaks in error path

Take care to free all previously allocated ressources in the
"out of memory" error path of the ISDN_CMD_DIAL branch.
Based on an original patch by Dan Carpenter.

Impact: bugfix
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Tilman Schmidt <tilman@imap.cc>
---
 drivers/isdn/gigaset/i4l.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/isdn/gigaset/i4l.c b/drivers/isdn/gigaset/i4l.c
index 1d084bb..34bca37 100644
--- a/drivers/isdn/gigaset/i4l.c
+++ b/drivers/isdn/gigaset/i4l.c
@@ -419,6 +419,8 @@ oom:
 	dev_err(bcs->cs->dev, "out of memory\n");
 	for (i =3D 0; i < AT_NUM; ++i)
 		kfree(commands[i]);
+	kfree(commands);
+	gigaset_free_channel(bcs);
 	return -ENOMEM;
 }
=20
--=20
1.6.5.3.298.g39add

--=20
Tilman Schmidt                    E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enig62F8A007A1BF7B890011DBAD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkwqcTEACgkQQ3+did9BuFsbTgCeNu8L+lJFZ4cW+sL1pxGL2Tkp
Y/sAnj/WTf4RhJUyJmUO9PpeW1o9rv4H
=HstG
-----END PGP SIGNATURE-----

--------------enig62F8A007A1BF7B890011DBAD--
