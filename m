From: Joe Perches <joe@perches.com>
Date: Wed, 07 Aug 2013 04:00:13 +0000
Subject: Re: [PATCH] checkpatch: Better --fix of SPACING errors.
Message-Id: <1375848013.2424.71.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55837ac7d8f48eb8dc9060f1b705c9c8b01bea59.1375843905.git.joe@perches.com>
In-Reply-To: <55837ac7d8f48eb8dc9060f1b705c9c8b01bea59.1375843905.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Phil Carmody <phil.carmody@partner.samsung.com>, Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, devel <devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Tue, 2013-08-06 at 19:55 -0700, Joe Perches wrote:
> Previous attempt at fixing SPACING errors could
> make a hash of several defects.

I have run this against drivers/staging/...

It works rather better than the older version.

It does have an issue with c99 style comments
when it needs to rewrite spacing as well.

If you use this with -f, please convert the
c99 // comments to /* ... */ first using the
--types c99_comments option,

Maybe use:

$ ./scripts/checkpatch.pl -f --fix --types=C99_comments <file>
$ mv <file>.EXPERIMENTAL-checkpatch-fixes <file>
$ ./scripts/checkpatch.pl -f --fix --types=3Dspacing <file>
$ mv <file>.EXPERIMENTAL-checkpatch-fixes <file>
$ git diff <file>


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
