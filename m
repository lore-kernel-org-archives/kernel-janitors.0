From: Joe Perches <joe@perches.com>
Date: Thu, 29 Sep 2016 10:02:56 +0000
Subject: Re: [PATCH 01/10] dm snapshot: Use kmalloc_array() in init_origin_hash()
Message-Id: <1475143376.1946.2.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <080668d9-1e1e-e208-f9ea-ff718e8070e5@users.sourceforge.net>
         <3861d349-48fd-162b-a749-83e007f70b41@users.sourceforge.net>
         <1475142864.31297.5.camel@tiscali.nl>
In-Reply-To: <1475142864.31297.5.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Paul Bolle <pebolle@tiscali.nl>, Andy Whitcroft <apw@canonical.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, dm-devel@redhat.com, linux-raid@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 2016-09-29 at 11:54 +0200, Paul Bolle wrote:
> Andy, Joe,
>=20
> On Thu, 2016-09-29 at 11:07 +0200, SF Markus Elfring wrote:
> > * Multiplications for the size determination of memory allocations
> > =A0 indicated that array data structures should be processed.
> > =A0 Thus use the corresponding function "kmalloc_array".
> >=20
> > =A0 This issue was detected by using the Coccinelle software.
>=20
>=20
> We have no hope of fixing Markus' homegrown coccinelle script. But we
> could try to fix the checkpatch false positive here.

What's the false positive?

I get:

$ ./scripts/checkpatch.pl -f drivers/md/dm-snap.c --show-types --types=3Dal=
loc_with_multiply
WARNING:ALLOC_WITH_MULTIPLY: Prefer kmalloc_array over kmalloc with multiply
#329: FILE: drivers/md/dm-snap.c:329:
+	_origins =3D kmalloc(ORIGIN_HASH_SIZE * sizeof(struct list_head),

WARNING:ALLOC_WITH_MULTIPLY: Prefer kmalloc_array over kmalloc with multiply
#338: FILE: drivers/md/dm-snap.c:338:
+	_dm_origins =3D kmalloc(ORIGIN_HASH_SIZE * sizeof(struct list_head),

total: 0 errors, 2 warnings, 2490 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
=A0=A0=A0=A0=A0=A0mechanically convert to the typical style using --fix or =
--fix-inplace.

drivers/md/dm-snap.c has style problems, please review.

NOTE: Used message types: ALLOC_WITH_MULTIPLY

NOTE: If any of the errors are false positives, please report
=A0=A0=A0=A0=A0=A0them to the maintainer, see CHECKPATCH in MAINTAINERS.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
