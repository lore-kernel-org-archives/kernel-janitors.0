From: Jim Nelson <james4765@gmail.com>
Date: Sun, 27 Aug 2006 21:26:40 +0000
Subject: [KJ] Another item to remove from the TODO list
Message-Id: <44F20E10.4000606@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

MODULE_PARM is not included in any live code - the last few patches I submitted
removed stuff that was #ifdef'd or #if 0'd out.

I think that could go on the "completed" pile.

Jim

- --
GPG key available
gpg --keyserver pgp.mit.edu --recv-keys 06B386612

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFE8g4QXxNjpms4ZhIRAvBOAJ9ntM67WLWZ1Jpd/Norsm27GlZVIgCfQ87N
O6oMGhhaB5qeUump4GZvDIg=Jlsk
-----END PGP SIGNATURE-----
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
