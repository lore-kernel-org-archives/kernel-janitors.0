From: Michael Ellerman <michael@ellerman.id.au>
Date: Thu, 21 May 2009 05:09:52 +0000
Subject: Re: [PATCH] include KERN_* constant in printk calls
Message-Id: <1242882592.4784.44.camel@concordia>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-MfIMBwRLTGQ78GlccD77"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090518233121.GC3109@chrisubuntu-laptop>
	 <20090519090049.GB9388@elte.hu> <20090520043215.GA3077@chrisubuntu-laptop>
	 <20090520083719.GG6736@elte.hu>  <20090521024635.GA4030@chrisubuntu-laptop>
In-Reply-To: <20090521024635.GA4030@chrisubuntu-laptop>
To: Chris Sanford <crsanford@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, peterz@infradead.org


--=-MfIMBwRLTGQ78GlccD77
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-05-20 at 19:46 -0700, Chris Sanford wrote:
> Here is the updated patch for sched.c. It replaces all the printk calls w=
ith their
> corresponding pr_* call. The five KERN_DEBUG calls have been changed to
> pr_info.

Switching from KERN_DEBUG to KERN_INFO means the messages will now
appear for most people, whereas previously they didn't. I'm not sure
that's a great idea.

If you really want to convert them, then I think we need a macro for
KERN_DEBUG but not conditionally compiled like pr_debug.

I sent a patch for that once, but I don't think anyone liked it, and
I've lost it now :D

cheers

--=-MfIMBwRLTGQ78GlccD77
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkoU4iAACgkQdSjSd0sB4dLcGwCgv+kunIxTBw+wggS2he6Au+B/
Ix8An1Rtxj57bgtMm/R0WkABm9Kr2R1Q
=0sUu
-----END PGP SIGNATURE-----

--=-MfIMBwRLTGQ78GlccD77--

