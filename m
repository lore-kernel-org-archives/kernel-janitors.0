From: Joe Perches <joe@perches.com>
Date: Sat, 06 Feb 2016 05:26:31 +0000
Subject: Re: [PATCH] checkpatch.pl: fix naked sscanf false positives
Message-Id: <1454736391.3263.19.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160205082952.GA18361@kwern-VirtualBox>
In-Reply-To: <20160205082952.GA18361@kwern-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, 2016-02-05 at 00:29 -0800, Kevin Wern wrote:
> There is a section of checkpatch.pl that intends to ensure the return
> value of sscanf is always checked.=A0=A0However, in certain cases, like in
> drivers/staging/dgnc/dgnc.mod.c, the symbol for sscanf is used without
> calling the function:
>=20
> static const struct modversion_info ____versions[]
> __used
> __attribute__((section("__versions"))) =3D {
> ...
> { 0x20c55ae0, __VMLINUX_SYMBOL_STR(sscanf) },
> ...
> };
>=20
> This currently results in a warning, which is undesirable. We should
> adjust the script's first regex condition to match *calls* to sscanf,
> not just the symbol itself.
>=20
> Signed-off-by: Kevin Wern <kevin.m.wern@gmail.com>
> ---
> =A0scripts/checkpatch.pl | 2 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0147c91..199247d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5452,7 +5452,7 @@ sub process {
> =A0# check for naked sscanf
> =A0		if ($^V && $^V ge 5.10.0 &&
> =A0		=A0=A0=A0=A0defined $stat &&
> -		=A0=A0=A0=A0$line =3D~ /\bsscanf\b/ &&
> +		=A0=A0=A0=A0$line =3D~ /\bsscanf\b\s*$balanced_parens/ &&

No, that won't work. =A0That's what the $stat line is for

I suppose it could be /\bsscanf\s*\(/ though
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
