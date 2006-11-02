From: David KOENIG <karhudever@gmail.com>
Date: Thu, 02 Nov 2006 20:05:29 +0000
Subject: [KJ] [PATCH] Fixed some errors in User Mode Linux documentation
Message-Id: <454A4F89.3000006@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I made a few fixes in the User Mode Linux documentation, but these can't
be fixed because git doesn't detect some of the problems.  (For example,
it doesn't realise that there are some stray backspaces that got
injected into the file somehow.)  You can use the following commands to
reformat everything correctly:

sed -i -e 's/\n{3,}/\n\n/g' Documentation/uml/UserModeLinux-HOWTO.txt
sed -i -e 's/.\b//g' Documentation/uml/UserModeLinux-HOWTO.txt
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFSk+JmhCgVPlWJY8RAuY0AJ92YDOANZKYqjxRgJIwSxlT9Q82WQCgsyUJ
SgLSA7/r1TWH0jm93z52498=Jr0R
-----END PGP SIGNATURE-----
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
