From: Doug Thompson <norsk5@yahoo.com>
Date: Mon, 27 Sep 2010 18:00:27 +0000
Subject: Re: [PATCH] edac: i7300_edac: call pci_disable_device
Message-Id: <217418.77835.qm@web50101.mail.re2.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1285491581-32622-1-git-send-email-segooon@gmail.com>
References: <1285491581-32622-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285491581-32622-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, Vasiliy Kulikov <segooon@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org

Can you submit your Signed-of-by:  line to properly sign off on this submis=
sion?

And a bit more description would be appreciated.

thanks

doug thompson

--- On Sun, 9/26/10, Vasiliy Kulikov <segooon@gmail.com> wrote:

> From: Vasiliy Kulikov <segooon@gmail.com>
> Subject: [PATCH] edac: i7300_edac: call pci_disable_device
> To: kernel-janitors@vger.kernel.org
> Cc: "Mauro Carvalho Chehab" <mchehab@redhat.com>, linux-edac@vger.kernel.=
org, linux-kernel@vger.kernel.org
> Date: Sunday, September 26, 2010, 2:59 AM
> Neither i7300_init_one() nor
> i7300_remove_one() calls pci_disable_device()
> after enabling it.
> ---
>  Compile tested.
>=20
>  drivers/edac/i7300_edac.c |=A0=A0=A035
> +++++++++++++++++++++--------------
>  1 files changed, 21 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/edac/i7300_edac.c
> b/drivers/edac/i7300_edac.c
> index 38920c0..749fa75 100644
> --- a/drivers/edac/i7300_edac.c
> +++ b/drivers/edac/i7300_edac.c
> @@ -1046,7 +1046,7 @@ static int __devinit
> i7300_init_one(struct pci_dev *pdev,
> =20
>  =A0=A0=A0 /* wake up device */
>  =A0=A0=A0 rc =3D pci_enable_device(pdev);
> -=A0=A0=A0 if (rc =3D -EIO)
> +=A0=A0=A0 if (rc)
>  =A0=A0=A0 =A0=A0=A0 return rc;
> =20
>  =A0=A0=A0 debugf0("MC: " __FILE__ ": %s(), pdev
> bus %u dev=3D0x%x fn=3D0x%x\n",
> @@ -1055,8 +1055,9 @@ static int __devinit
> i7300_init_one(struct pci_dev *pdev,
>  =A0=A0=A0 =A0=A0=A0
> PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> =20
>  =A0=A0=A0 /* We only are looking for func 0 of
> the set */
> +=A0=A0=A0 rc =3D -ENODEV;
>  =A0=A0=A0 if (PCI_FUNC(pdev->devfn) !=3D 0)
> -=A0=A0=A0 =A0=A0=A0 return -ENODEV;
> +=A0=A0=A0 =A0=A0=A0 goto fail_disable;
> =20
>  =A0=A0=A0 /* As we don't have a motherboard
> identification routine to determine
>  =A0=A0=A0=A0=A0* actual number of
> slots/dimms per channel, we thus utilize the
> @@ -1073,10 +1074,10 @@ static int __devinit
> i7300_init_one(struct pci_dev *pdev,
>  =A0=A0=A0 =A0=A0=A0 __func__,
> num_channels, num_dimms_per_channel, num_csrows);
> =20
>  =A0=A0=A0 /* allocate a new MC control structure
> */
> +=A0=A0=A0 rc =3D -ENOMEM;
>  =A0=A0=A0 mci =3D edac_mc_alloc(sizeof(*pvt),
> num_csrows, num_channels, 0);
> -
>  =A0=A0=A0 if (mci =3D NULL)
> -=A0=A0=A0 =A0=A0=A0 return -ENOMEM;
> +=A0=A0=A0 =A0=A0=A0 goto fail_disable;
> =20
>  =A0=A0=A0 debugf0("MC: " __FILE__ ": %s(): mci > %p\n", __func__, mci);
> =20
> @@ -1085,15 +1086,15 @@ static int __devinit
> i7300_init_one(struct pci_dev *pdev,
>  =A0=A0=A0 pvt =3D mci->pvt_info;
>  =A0=A0=A0 pvt->pci_dev_16_0_fsb_ctlr > pdev;=A0=A0=A0 /* Record this dev=
ice in our private
> */
> =20
> +=A0=A0=A0 rc =3D -ENOMEM;
>  =A0=A0=A0 pvt->tmp_prt_buffer > kmalloc(PAGE_SIZE, GFP_KERNEL);
> -=A0=A0=A0 if (!pvt->tmp_prt_buffer) {
> -=A0=A0=A0 =A0=A0=A0 edac_mc_free(mci);
> -=A0=A0=A0 =A0=A0=A0 return -ENOMEM;
> -=A0=A0=A0 }
> +=A0=A0=A0 if (!pvt->tmp_prt_buffer)
> +=A0=A0=A0 =A0=A0=A0 goto fail_free;
> =20
>  =A0=A0=A0 /* 'get' the pci devices we want to
> reserve for our use */
> +=A0=A0=A0 rc =3D -ENODEV;
>  =A0=A0=A0 if (i7300_get_devices(mci))
> -=A0=A0=A0 =A0=A0=A0 goto fail0;
> +=A0=A0=A0 =A0=A0=A0 goto
> fail_buffer_free;
> =20
>  =A0=A0=A0 mci->mc_idx =3D 0;
>  =A0=A0=A0 mci->mtype_cap =3D MEM_FLAG_FB_DDR2;
> @@ -1121,13 +1122,14 @@ static int __devinit
> i7300_init_one(struct pci_dev *pdev,
>  =A0=A0=A0 }
> =20
>  =A0=A0=A0 /* add this new MC control structure to
> EDAC's list of MCs */
> +=A0=A0=A0 rc =3D -ENODEV;
>  =A0=A0=A0 if (edac_mc_add_mc(mci)) {
>  =A0=A0=A0 =A0=A0=A0 debugf0("MC: "
> __FILE__
>  =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> ": %s(): failed edac_mc_add_mc()\n", __func__);
>  =A0=A0=A0 =A0=A0=A0 /* FIXME: perhaps
> some code should go here that disables error
>  =A0=A0=A0 =A0=A0=A0=A0=A0*
> reporting if we just enabled it
>  =A0=A0=A0 =A0=A0=A0=A0=A0*/
> -=A0=A0=A0 =A0=A0=A0 goto fail1;
> +=A0=A0=A0 =A0=A0=A0 goto fail_put;
>  =A0=A0=A0 }
> =20
>  =A0=A0=A0 i7300_clear_error(mci);
> @@ -1146,14 +1148,18 @@ static int __devinit
> i7300_init_one(struct pci_dev *pdev,
>  =A0=A0=A0 return 0;
> =20
>  =A0=A0=A0 /* Error exit unwinding stack */
> -fail1:
> -
> +fail_put:
>  =A0=A0=A0 i7300_put_devices(mci);
> =20
> -fail0:
> +fail_buffer_free:
>  =A0=A0=A0 kfree(pvt->tmp_prt_buffer);
> +
> +fail_free:
>  =A0=A0=A0 edac_mc_free(mci);
> -=A0=A0=A0 return -ENODEV;
> +
> +fail_disable:
> +=A0=A0=A0 pci_disable_device(pdev);
> +=A0=A0=A0 return rc;
>  }
> =20
>  /**
> @@ -1181,6 +1187,7 @@ static void __devexit
> i7300_remove_one(struct pci_dev *pdev)
> =20
>  =A0=A0=A0 kfree(tmp);
>  =A0=A0=A0 edac_mc_free(mci);
> +=A0=A0=A0 pci_disable_device(pdev);
>  }
> =20
>  /*
> --=20
> 1.7.0.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at=A0 http://www.tux.org/lkml/
>=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
