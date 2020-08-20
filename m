From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
Date: Thu, 20 Aug 2020 09:11:16 +0000
Subject: Re: [PATCH 5/6] staging: wfx/hif_rx.c: Fix spelling mistake "negociation" => "negotiation"
Message-Id: <2117465.u6biEVJElo@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com> <eab6bcb570dcd1407efc8163ff8ff976f623ae9c.1597913333.git.usuraj35@gmail.com>
In-Reply-To: <eab6bcb570dcd1407efc8163ff8ff976f623ae9c.1597913333.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gregkh@linuxfoundation.org, Suraj Upadhyay <usuraj35@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Suraj,

Thank you for your contribution.

On Thursday 20 August 2020 10:51:27 CEST Suraj Upadhyay wrote:
>=20
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>

Even for a small change, you have to fill the commit log body.

> ---
>  drivers/staging/wfx/hif_rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/wfx/hif_rx.c b/drivers/staging/wfx/hif_rx.c
> index cc7c0cf226ba..1d32973d8ec1 100644
> --- a/drivers/staging/wfx/hif_rx.c
> +++ b/drivers/staging/wfx/hif_rx.c
> @@ -118,7 +118,7 @@ static int hif_keys_indication(struct wfx_dev *wdev,
>=20
>         // SL_PUB_KEY_EXCHANGE_STATUS_SUCCESS is used by legacy secure li=
nk
>         if (body->status && body->status !=3D HIF_STATUS_SLK_NEGO_SUCCESS)
> -               dev_warn(wdev->dev, "secure link negociation error\n");
> +               dev_warn(wdev->dev, "secure link negotiation error\n");

This change is already in the staging tree. See commit c9638363f02d
("staging: wfx: fix a handful of spelling mistakes").

Globally, if you post changes for drivers/staging you should rebase your
work on the staging tree before to send it. You can use the script
get_maintainer.pl to get this information:

    $ ./scripts/get_maintainer.pl --scm drivers/staging/wfx
    [...]
    git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git

--=20
J=E9r=F4me Pouiller
