From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:07:29 +0000
Subject: Re: [PATCH 10/16] viafb: fix sparse warning: Using plain integer as
Message-Id: <154e089b0902261707j4e22787boecedaa097b2777b2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000441.17557.22989.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000441.17557.22989.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Krzysztof Helt <krzysztof.h1@poczta.fm>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev-devel@lists.sourceforge.net

[Added To, Cc]

On Sun, Feb 22, 2009 at 1:04 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warning:
> =A0drivers/video/via/hw.c:2020:46: warning: Using plain integer as NULL p=
ointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/video/via/hw.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/video/via/hw.c b/drivers/video/via/hw.c
> index fcd53ce..70d6b6c 100644
> --- a/drivers/video/via/hw.c
> +++ b/drivers/video/via/hw.c
> @@ -2017,7 +2017,7 @@ static void init_gfx_chip_info(void)
> =A0 =A0 =A0 =A0/* Indentify GFX Chip Name */
> =A0 =A0 =A0 =A0for (i =3D 0; pciidlist[i].vendor !=3D 0; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdev =3D pci_get_device(pciidlist[i].vendo=
r,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pciidlist[i].device, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pciidlist[i].device, NULL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0}
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
