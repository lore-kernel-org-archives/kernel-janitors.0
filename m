From: Tomas Cech <sleep_walker@suse.cz>
Date: Tue, 13 Aug 2013 00:34:07 +0000
Subject: Re: [PATCH 11/16] arch/arm/mach-pxa/palmtreo.c: Avoid using ARRAY_AND_SIZE(e) as a function argument
Message-Id: <20130813003407.GA1390@venom>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Q68bSM7Ycu6FN28Q"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376239917-15594-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376239917-15594-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376239917-15594-12-git-send-email-Julia.Lawall@lip6.fr>
To: linux-arm-kernel@lists.infradead.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sun, Aug 11, 2013 at 06:51:52PM +0200, Julia Lawall wrote:
>From: Julia Lawall <Julia.Lawall@lip6.fr>
>
>Replace ARRAY_AND_SIZE(e) in function argument position to avoid hiding the
>arity of the called function.
>
>The semantic match that makes this change is as follows:
>(http://coccinelle.lip6.fr/)
>
>// <smpl>
>@@
>expression e,f;
>@@
>
>f(...,
>- ARRAY_AND_SIZE(e)
>+ e,ARRAY_SIZE(e)
>  ,...)
>// </smpl>
>
>Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

I used to be happy with this macro as it improves readability.

but ack.


Tomas Cech

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlIJfv8ACgkQ37XrCapiVCNnDwCdH/BQKaGsNRAAJxlrGDlAcBXT
qrMAn1fQhF0dntxwrHzlJj4VpaQOdCRB
=ZwEo
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
