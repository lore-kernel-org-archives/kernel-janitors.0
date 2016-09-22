From: Joe Perches <joe@perches.com>
Date: Thu, 22 Sep 2016 10:42:10 +0000
Subject: Re: "CodingStyle: Clarify and complete chapter 7" in docs-next
Message-Id: <1474540930.8253.9.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOi1vP8Y6V3mWs1bv=-CCVRfGi59P+3F85n6rzMn0=K6FqQkcw@mail.gmail.com>
         <20160920001159.GM2356@ZenIV.linux.org.uk>
         <1474339566.1954.25.camel@perches.com>
         <alpine.DEB.2.10.1609200751110.3346@hadrien>
         <1474353123.1954.28.camel@perches.com> <20160922112407.47da9393@endymion>
In-Reply-To: <20160922112407.47da9393@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jean Delvare <jdelvare@suse.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Al Viro <viro@ZenIV.linux.org.uk>, Ilya Dryomov <idryomov@gmail.com>, Andy Whitcroft <apw@canonical.com>, Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Ceph Development <ceph-devel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Sage Weil <sage@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org

On Thu, 2016-09-22 at 11:24 +0200, Jean Delvare wrote:
[]
> > The seriousness with which some beginners take these message
> > types though is troublesome,
[]
> You need to think in terms of actual use cases. Who uses checkpatch and
> why? I think there are 3 groups of users:
> * Beginners. They won't run the script by themselves, instead they will
> =A0 submit a patch which infringes a lot of coding style rules, and the
> =A0 maintainer will point them to checkpatch and ask for a resubmission
> =A0 which makes checkpatch happy. Being beginners, they can only rely on
> =A0 the script itself to only report things which need to be fixed, by
> =A0 default.
> * Experienced developers. Who simply want to make sure they did not
> =A0 overlook anything before they post their work for review. They have
> =A0 the knowledge to decide if they want to ignore some of the warnings.
> * People with too much spare time, looking for anything they could
> =A0 "contribute" to the kernel. They will use --subjective and piss off
> =A0 every maintainer they can find.

I think you overlook the category of a beginner submitting
"my first kernel patch" which is a "coding style" defect of
some type.  The Eudyptula and Outreachy programs seem to
encourage these sorts of patches.

This is where "scripts/checkpatch.pl -f <file>" is most used.

I believe adding the --force option might be useful to
restrict cleanup-style-only patches outside of staging.

There's nothing wrong with cleanup style patches, it can be
good introduction to compiler/config tool & kernel setup.
=20
> I would rather suggest:
>=20
> ERROR -> MUST_FIX
> WARNING -> SHOULD_FIX
> CHECK -> MAY_FIX

MUST is much stronger language than I would prefer.

There are still about a quarter million ERRORs just for
spacing issues in the kernel tree.

Here are the top 10 ERROR checkpatch messages treewide as of
a few days ago,

$ grep ERROR checkpatch.short_sorted_20160917
 268308  ERROR:SPACING
  37340  ERROR:CODE_INDENT
  27678  ERROR:TRAILING_WHITESPACE
  21024  ERROR:COMPLEX_MACRO
  14048  ERROR:POINTER_LOCATION
  12207  ERROR:TRAILING_STATEMENTS
  11079  ERROR:OPEN_BRACE
   6802  ERROR:ASSIGN_IN_IF
   3940  ERROR:RETURN_PARENTHESES
   2322  ERROR:NON_OCTAL_PERMISSIONS

Maybe there could be some better classifications of the various
messages.

But there are about two million checkpatch messages overall in
the kernel tree.

That's a lot.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
