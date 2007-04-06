From: Borislav Petkov <petkov@math.uni-muenster.de>
Date: Fri, 06 Apr 2007 07:44:28 +0000
Subject: [KJ] [PATCH 5/5] Fix warnings when building 'xmldocs' target:
Message-Id: <20070406074428.GA4884@gollum.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

This one fixes the case when a composite expression containing at least one=
 \s
is found in an array subscript braces (see include/linux/mtd/nand.h:303, for
example)

Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>

--- kernel.orig/20-rc5/scripts/kernel-doc	2007-04-05 10:22:27.000000000 +02=
00
+++ kernel/20-rc5/scripts/kernel-doc	2007-04-05 10:50:21.000000000 +0200
@@ -1451,6 +1451,8 @@
 	} elsif ($arg) {
 	    $arg =3D~ s/\s*:\s*/:/g;
 	    $arg =3D~ s/\s*\[/\[/g;
+	    # remove array subscript braces early
+	    # $arg =3D~ s/\[.*$//;
=20
 	    my @args =3D split('\s*,\s*', $arg);
 	    if ($args[0] =3D~ m/\*/) {

--=20
Regards/Gru=DF,
    Boris.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
