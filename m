From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Nov 2011 20:21:16 +0000
Subject: Re: Doubt about some kernel definitions..
Message-Id: <20111105202116.GS4682@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="K5roPakIqCb4O6y8"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--K5roPakIqCb4O6y8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marcos,

I've added the kernel-janitors and driver-devel to the CC list.  Btw,
in particular for patches, you should always CC at least one email
list.

The stuff in ttypes.h is messed up in a couple ways.

typedef int             BOOL;

BOOL should be bool, but int is 32 bits and bool is 1 bit so this is
not a white space change.  You need to check every place that uses
BOOL to make sure changing it does not introduce a bug.

typedef unsigned char   BYTE;           //  8-bit

This one is simple.  Change all these places to u8.

typedef unsigned short  WORD;           // 16-bit

This is weird because you'd normally think of a word as an int.
Changing all of these to u16 won't introduce any bugs, but you should
check all the places to make sure there isn't a bug already there.

typedef unsigned long   DWORD;          // 32-bit

unsigned long is 32bit on 32 bit systems and 64 bit on 64 bit systems
so you'd need to look at each place this is used and see what is
correct.  It could be u32, int, unsigned long, etc.

typedef unsigned long   ULONG_PTR;      // 32-bit

I looked at how ULONG_PTR was used and it's normally something like
this:

        unsigned int uLen = pRSNWPA->len + 2;

        if (uLen <= (uIELength -
                     (unsigned int) (ULONG_PTR) ((PBYTE) pRSNWPA - pbyIEs))) {
                pBSSList->wWPALen = uLen;
                memcpy(pBSSList->byWPAIE, pRSNWPA, uLen);
                WPA_ParseRSN(pBSSList, pRSNWPA);
        }

This looks wrong to me.
1) It's doing pointer math and pointers are 64 bit on x86_64 systems.
Then it's truncating the upper bits away.  Not a big deal in this
case, but it's ugly.

2) uIELength is unsigned so a negative value for the subtraction gets
turned into a large positive value and the test becomes meaningless.
Possibly leading to memory corruption.  This particular code is
parsing data from over the network so it could be a remote security
problem.

Basically when you're doing this kind of work keep your eyes open for
any other bugs you can spot.  It's not just a matter of running sed
over the driver.

regards,
dan carpenter

--K5roPakIqCb4O6y8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOtZq8AAoJEOnZkXI/YHqRIdsQAJD0/CqIHuvWvZTYu9hJTmBy
T9Ajk3c45iDVEAd8QCCiQ/svETHIfgUPNaAF21ywDa5vWMJ2+IqR9siP3QPRRMP+
eeocNIaSqJuuQAkGFvWWEoT8l2QjuZ2hoRv76VkvGXeSxiJfHmyq2NelgG6Jx/kl
pgEh30T8SHOFelbaedXU+187YT0jqqwtUVH7JW42yhEtUU+gJnHmR1p0Qg8EmYZd
xoH+GJj2Olv/L6kZ+YcAbjYxbqEJ56/YFXJ2V1h3TYIEzUFWNj1L1v4mIMdnDaH1
pQ98CJf2+TwHv3JNpbMrjPlublC8zWiR48IW4oxVK83fId09zewRrP366CeGDt4t
RVohrtbGROHeZcedVATd7PyD4v1zcYuSAXWDButULOCqjXaSTMA0OQLWHLaUuslt
3b7u7+JNUNVYjGno9y7Pwz6yRRaJMxAXSPBSCNu1lDVoAFxKRnjWhuXX2qWeEFSA
9HbHaP/nnirrZLGp+ZbO1/SZcWAbv1DiFM0RrYrdk00W1J5kS9SVetUB29B9B2lo
VKYUX/I0UHgndmk7NJYcDGuin+T8jqCM32b9Ru08CQUiGFwYqI8fDsK8WlbNNTVd
Vrl3LnZSCpJL0kUleEQXsco4ri6ZN3IyEU4x7vOZPVlAXVXTfmI2T0be4mibui2g
iuQ64QqvTgadXVSfCNr8
=bGH3
-----END PGP SIGNATURE-----

--K5roPakIqCb4O6y8--
