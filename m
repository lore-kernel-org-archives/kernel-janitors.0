From: Sven Eckelmann <sven@narfation.org>
Date: Thu, 10 Mar 2016 19:30:13 +0000
Subject: Re: [B.A.T.M.A.N.] [PATCH 3/3] batman-adv: Less function calls in batadv_is_ap_isolated() after erro
Message-Id: <1655341.WCvHHx7pqD@bentobox>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart6025988.xOaW2VZJs2"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--nextPart6025988.xOaW2VZJs2
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 20 November 2015 11:56:39 SF Markus Elfring wrote:
> > On top of that, by going through the batman-adv code you might agree
> > that the current style is actually not a bad idea.
> 
> I got the impression that the current Linux coding style convention
> disagrees around the affected jump label selection to some degree,
> doesn't it?

Yes, see "Chapter 7: Centralized exiting of functions". But your patch
doesn't seem to apply anymore. Can you please resent it or mark it
correctly in patchwork [1].

There was also another suggestion in the past:

 * https://patchwork.open-mesh.org/patch/4081/ [2]

I have prepared a overview of functions and their goto's [3] to make
it easier to spot interesting places.

Kind regards,
	Sven

[1] https://patchwork.open-mesh.org/patch/4724/
    You can find an updated version at
    https://git.open-mesh.org/batman-adv.git/patch/1b79cb12821da928b4cf2d116469dfdcbe66d8cd
[2] Update version:
    https://git.open-mesh.org/batman-adv.git/commit/28578c9dd0e592f1c69c44ab7723021b1e8c5b28
[3] https://git.open-mesh.org/batman-adv.git/blob/783c827d01b3644ac09a0f32fe4a9dfa8d6debd3:/TODO

--nextPart6025988.xOaW2VZJs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW4ctGAAoJEF2HCgfBJntG5SEP/3HWwvv8rg4/TZNQbl+e0cOZ
DtWBU0ASuQrvM9D6F4zG0e8Dm17I8EWv/2iLSKlL1hCXjBItWeEmAhfDYwjyCP8o
FECxh35HdDC2s8vIu91mTwv97Bj5yNQr0ukMsEZrF5fF6PbWFiH/iI2yCTTOCF36
JvT9GvTCU2yWnXIk0nuOzr7TF6BUmBmyd0TygU7nS8fELuhD908WalGr3OVSj9Vl
PTOkI0nTN3QFKPE7wNox21+ErJ7gdQZMtUVJkouiFn78lX/69PwUta1c8+z9iQ/A
VymjidKPuJOUyvgAu2RtSHi2VjeTyNg2lXZIvpfvCJ+ccMr4BPRlkX67kFoQ8rHv
QJLGN6BwiPrNY65YgcKYQ4mWpprEZMgfxB8ZGvGlJd+NKigvcf8w20S+9TdpaMl2
z+9a+A8KdjTbAEfb+q7GdyUfZI+52kYm0NltYsUfF4w8GEyug3UOam3nohtg48Ye
axaZsfEfxsCi4a8Q4S6CgF4iKX8hkMlkeokeVeLhk/uRrSqkgl9BjrB6PI8noyg/
piluzaPKWpDXMTn25nhxDdwT1jtLIXZyZgODy7V+acWCaKsYnvnx5lfxf0hMPEcH
I6tF0Ob9H6OQMvczOhCpyNomMBqseqLBGYnxaXXiPocFp3lFzo1aMPPhRWL5OTnX
xzgDoaAwu461oDZFIET8
=DCHt
-----END PGP SIGNATURE-----

--nextPart6025988.xOaW2VZJs2--

