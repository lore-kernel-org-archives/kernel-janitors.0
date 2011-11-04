From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 11:07:13 +0000
Subject: Re: [PATCH 3/4] drivers/staging/vt6656/iocmd.h: Removed ttype.h and
Message-Id: <20111104110713.GN4682@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iwjEIfU64POCkTAH"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAGkUK2tYVKSawyp47bs2d8U1D=EKzBk216RLP-OC5P0e=VcNjw@mail.gmail.com>
In-Reply-To: <CAGkUK2tYVKSawyp47bs2d8U1D=EKzBk216RLP-OC5P0e=VcNjw@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--iwjEIfU64POCkTAH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch was mangled by your mail client.  Read
Documentation/email-clients.txt, send the patch to yourself.  Verify
that it applies and then resend.

On Fri, Nov 04, 2011 at 07:10:56AM -0300, Marcos Souza wrote:
> I forgot to sent these patches, so I'm sending now
>=20
> Removed comments about functions/veriables static and stuff like these.
                                   variables
Normally, we don't comment too much on changelog spelling but since
you're going to resend this anyway, could you fix the typo there?



> @@ -123,18 +115,16 @@ typedef struct tagSCmdBSSJoin {
>      u16     wBBPType;
>      u8	    ssid[SSID_MAXLEN + 2];
>      u32	    uChannel;
> -    BOOL    bPSEnable;
> -    BOOL    bShareKeyAuth;
> +    int    bPSEnable;
> +    int    bShareKeyAuth;

These should be bool.  Obviously in the original code, BOOL was
defined as int and changing it has the potential to break things so
it needs care.  You would need to look at all the places where
bPSEnable is used and verify that it works for type "bool".  Use grep
or cscope.  If you don't feel comfortable doing that, then I would
leave it as is for now.

> - BOOL       bWrite;
> + int       bWrite;

Same thing for all the other places as well.

Some people might complain that this patch does too many things in
a single patch.  Maybe break out the white space changes from the
other changes.

regards,
dan carpenter

--iwjEIfU64POCkTAH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOs8dgAAoJEOnZkXI/YHqRhlwQAKWeZnRoAG/cCbv2ROnz287E
L9xHPoT7w0Y1JIjK+LBRItPuxq1ckRn37KVz2oJNP/NzkHUW5DNhC7UH8oZTfVVf
pD9dLK+BpiwfzS5MhfZ42BWMHzPnkK8z5aOB2ETdGvCPw9qIYLRcKuxrTtEYjLy4
pUjzfxspNkhJUbN0SqBQSOBf7GZnlt1OQSIc4uEZgAk4ox15kLPxXU7Oj+DPFgDs
CYr5oLfSLAGDCwNkF6cuF5VBn5Hs5SGkdcLsvE+j5z15+miGMaubbI4Sgz9tpRKk
JEI2Qjxhzlz3xOmx1iENHWgEIKBvzt1ZjYtedJwr/bqPn/TgqBBr0gNZuC20L722
t51BwoEcYrUPb4iKTfh8C+Pb41kGOXSIogFBYLZCWpBeR3da2FdTjCPhyEKhizi3
sSFdJTMzG5jqyepj+CSJyFUb93bKzs6zrfkCy3BTDoRxr/SlUrdGyKb+R6/EPqZe
AgWSuyhucYCfhCtn0sAGCSWJfzHw/AlNqt4ef//Pt0XecMdN2DKF3sgC7j2TKmKB
C5Gp6vjj5w9wF/i1H3O4sH8ngIZH08HpjW0oZnC7HMYjnfMZXjszkyOla6eD4lSh
wISlmj3llOAv6XWlZXPjyPYxiilAJsfGUpIlNFS6WSpehHVSrdz6YTPAeKoLPl36
cd4IOT05rkYQYn122VE/
=rFj9
-----END PGP SIGNATURE-----

--iwjEIfU64POCkTAH--
