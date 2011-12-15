From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Dec 2011 13:45:24 +0000
Subject: Re: [patch -next] x86: dubious one-bit signed bitfields
Message-Id: <20111215134524.GA17353@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="XsQoSWH+UP9D9v3l"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111207063848.GA14507@elgon.mountain>
In-Reply-To: <20111207063848.GA14507@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Andy, this is your code from:

commit 4fc3490114bb159bd4fff1b3c96f4320fe6fb08f
Author: Andy Lutomirski <luto@amacapital.net>
Date:   Mon Nov 7 16:33:40 2011 -0800

    x86-64: Set siginfo and context on vsyscall emulation faults

Would you like to comment on what we should do here?  These warnings
are spamming my build.

regards,
dan carpenter

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO6fn0AAoJEOnZkXI/YHqRHr0P/3q6yRn1iy7RgQeO7KRD72wp
3L/aSZVlP1n5JdGp2E/dp0Q3BvD44iCNiIsF8GY83QlB6YIbA2MTsdP4FnvdopcT
BV1VgFuF3nQwPLSJNkwluan/i84KZreCXcN4pYWsAKOsaX6r7Gew2BrpfVwY3xRV
k9uv39xHlPRBR+jlKdH19WXS+vOf68bANdUB3pEozwifDaJoUelhc2tX6UYnK0LY
kby6sRImSB7Sf4SGQECpS83pxC00URYkXYQ45mG8MdVkofOm6d5viZWRB7FsHaOl
vCXaEcbfx/7BqhlmiQZyTANjW2yvWHB5WvKvGyh1l4jC4jIlrbVl4YoAGSMxdV6a
9fUs/OHTLialXO/9pYgQlB/vfLJffExRyos0r3Heq08QVBhIsa3n5AZbY+ANDe7S
Wjd0K2i58ZzpoEFnQwah3B9FJQ5504QK7PTpe0bIwC/IzCo94cUcKSvz2ybiEIJN
4nls7icSImazOyB1dPQhOES7HB7nlZkovFpM3pKVTrt44WMSNMLmy6YSMFf1XwLx
BTyN0ke6KFx1mCfboaxgpR5b5W92joukcelL9pd+q/gw6N88RjlZM9jKftGZ+f9x
o2ihZrAXs2rmb96gHKskXJ3O+rCXp3VRMg1jUPHYX/SUN3Yz0bs1RKIIEufYVHiv
kSaIJ9t+c3K+wJqR8bu0
=a7/Z
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
