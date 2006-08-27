From: Jim Nelson <james4765@gmail.com>
Date: Sun, 27 Aug 2006 19:12:34 +0000
Subject: [KJ] Item to remove from TODO list
Message-Id: <44F1EEA2.3090602@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Just finished checking the MOD_INC/DEC_USE_COUNT item in the TODO list - there
are no more code paths that use it, and only a couple of commented-out
references, comments and changelogs.

It probably should be removed from the TODO list.

Jim

- --
GPG key available
gpg --keyserver pgp.mit.edu --recv-keys 06B386612

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFE8e6hXxNjpms4ZhIRAkYzAJ4tgtehQs8tHAn42dLx4uoci5UY5gCeLMwB
fGmCwsKkJyzFOAGH18ZXhR8=Np5J
-----END PGP SIGNATURE-----
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
