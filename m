From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 12 Jul 2004 16:42:16 +0000
Subject: Re: [Kernel-janitors] [PATCH] remove check_region specialix
Message-Id: <20040712164216.GE1821@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48177549062939828=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
In-Reply-To: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============48177549062939828==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 12 Jul 2004, Kristen Carlson wrote:

> Thanks!  For my benefit, what's the easiest way to check for trailing spaces?
> I thought I had gotten all of them by just looking at the patch and noting
> which lines shouldn't have needed modifications but I obviously missed some,
> especially on the lines that I was modifying anyway.  Do you have a more 
> foolproof method?
> Kristen

Domen posted that one on kj (bonus detects also spaces instead of tabs):
egrep -n "^\+(.* $|        )"

in vim you may want to :set list for viewing those spaces
and afterwards :set nolist.

another possibility is to use the patch-scripts from Andrew Morton,
they warn you when trailing space is introduced.
that's the place, where i see most of them ;)
-> http://developer.osdl.org/rddunlap/patch-scripts/
or latest http://www.zip.com.au/~akpm/linux/patches/patch-scripts-0.18/

a++ maks


--===============48177549062939828==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48177549062939828==--
