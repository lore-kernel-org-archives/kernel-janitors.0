From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:03:31 +0000
Subject: Re: [PATCH 07/16] panasonic-laptop: fix sparse warning: Using plain
Message-Id: <154e089b0902261703r76f23065vaf1e683a4f8f4bb2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000228.17557.1852.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000228.17557.1852.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Len Brown <len.brown@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:02 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warning:
> =A0drivers/platform/x86/panasonic-laptop.c:273:70: warning: Using plain i=
nteger as NULL pointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/platform/x86/panasonic-laptop.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x=
86/panasonic-laptop.c
> index c47a44d..e178cde 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -270,7 +270,7 @@ static int acpi_pcc_retrieve_biosdata(struct pcc_acpi=
 *pcc, u32 *sinf)
> =A0 =A0 =A0 =A0union acpi_object *hkey =3D NULL;
> =A0 =A0 =A0 =A0int i;
>
> - =A0 =A0 =A0 status =3D acpi_evaluate_object(pcc->handle, METHOD_HKEY_SI=
NF, 0,
> + =A0 =A0 =A0 status =3D acpi_evaluate_object(pcc->handle, METHOD_HKEY_SI=
NF, NULL,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0&buffer);
> =A0 =A0 =A0 =A0if (ACPI_FAILURE(status)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
