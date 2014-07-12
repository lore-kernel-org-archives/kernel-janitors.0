From: Joe Perches <joe@perches.com>
Date: Sat, 12 Jul 2014 01:46:52 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <1405129612.6751.24.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013927.GA30781@kroah.com>
In-Reply-To: <20140712013927.GA30781@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernelnewbies@lists.kernelnewbies.org

On Fri, 2014-07-11 at 18:39 -0700, Greg KH wrote:
> On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> > A simple script to run checkpatch --fix for various types of
> > of cleanups.
]
> drivers/staging/lustre/include/linux/lnet/api.h has no obvious style prob=
lems and is ready for submission.
> file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <upd=
ate c90 comment style> types:<c99_comments>
> Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/=
(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
[]
> drivers/staging/lustre/include/linux/lnet/api.h has no obvious style prob=
lems and is ready for submission.
[]
> Is that expected?

No, I haven't seen that.

Can you tell me what git tree you're working on?
Also, can you use the scripts/checkpatch from -next
tag next-20140711

My system has:

$ perl --version=20

This is perl 5, version 18, subversion 2 (v5.18.2) built for i686-linux-gnu=
-thread-multi-64int
(with 41 registered patches, see perl -V for more detail)

Copyright 1987-2013, Larry Wall

Perl may be copied only under the terms of either the Artistic License or t=
he
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

and using that:

$ ./scripts/checkpatch.pl -f --strict drivers/staging/lustre/include/linux/=
lnet/api.h --types=C99_comments
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: C99_COMMENTS

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style proble=
ms and is ready for submission.


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
