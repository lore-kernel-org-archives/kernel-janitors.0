From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sun, 25 Aug 2019 19:59:01 +0000
Subject: Re: [PATCH] bcma: fix incorrect update of BCMA_CORE_PCI_MDIO_DATA
Message-Id: <CACna6ryAmfhUENTWR33Xfngh_6zJe0EF_JKAxDUXXZPHYevkzA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822133524.6274-1-colin.king@canonical.com>
 <d3c16158-ef89-f5ee-2f67-4357c70e8fe9@lwfinger.net> <31258833-174f-080b-489e-85d3556bd1de@canonical.com>
In-Reply-To: <31258833-174f-080b-489e-85d3556bd1de@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin Ian King <colin.king@canonical.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Hauke Mehrtens <hauke@hauke-m.de>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 22 Aug 2019 at 18:11, Colin Ian King <colin.king@canonical.com> wro=
te:
> On 22/08/2019 17:03, Larry Finger wrote:
> > On 8/22/19 8:35 AM, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> An earlier commit re-worked the setting of the bitmask and is now
> >> assigning v with some bit flags rather than bitwise or-ing them
> >> into v, consequently the earlier bit-settings of v are being lost.
> >> Fix this by replacing an assignment with the bitwise or instead.
> >>
> >> Addresses-Coverity: ("Unused value")
> >> Fixes: 2be25cac8402 ("bcma: add constants for PCI and use them")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>   drivers/bcma/driver_pci.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/bcma/driver_pci.c b/drivers/bcma/driver_pci.c
> >> index f499a469e66d..d219ee947c07 100644
> >> --- a/drivers/bcma/driver_pci.c
> >> +++ b/drivers/bcma/driver_pci.c
> >> @@ -78,7 +78,7 @@ static u16 bcma_pcie_mdio_read(struct bcma_drv_pci
> >> *pc, u16 device, u8 address)
> >>           v |=3D (address << BCMA_CORE_PCI_MDIODATA_REGADDR_SHF_OLD);
> >>       }
> >>   -    v =3D BCMA_CORE_PCI_MDIODATA_START;
> >> +    v |=3D BCMA_CORE_PCI_MDIODATA_START;
> >>       v |=3D BCMA_CORE_PCI_MDIODATA_READ;
> >>       v |=3D BCMA_CORE_PCI_MDIODATA_TA;
> >
> > I'm not sure the "Fixes" attribute is correct.
> >
> > The changes for this section in commit 2be25cac8402 are
> >
> > -       v =3D (1 << 30); /* Start of Transaction */
> > -       v |=3D (1 << 28); /* Write Transaction */
> > -       v |=3D (1 << 17); /* Turnaround */
> > -       v |=3D (0x1F << 18);
> > +       v =3D BCMA_CORE_PCI_MDIODATA_START;
> > +       v |=3D BCMA_CORE_PCI_MDIODATA_WRITE;
> > +       v |=3D (BCMA_CORE_PCI_MDIODATA_DEV_ADDR <<
> > +             BCMA_CORE_PCI_MDIODATA_DEVADDR_SHF);
> > +       v |=3D (BCMA_CORE_PCI_MDIODATA_BLK_ADDR <<
> > +             BCMA_CORE_PCI_MDIODATA_REGADDR_SHF);
> > +       v |=3D BCMA_CORE_PCI_MDIODATA_TA;
> >
> > Because the code has done quite a bit of work on v just above this
> > section, I agree that this is likely an error, but that error happened
> > in an earlier commit. Thus 2be25cac8402 did not introduce the error,
> > merely copied it.
>
> Ugh, this goes back further. I didn't spot that. I'm less confident of
> what the correct settings should be now.
>
> >
> > Has this change been tested?
>
> Afraid not, I don't have the H/W.

Please send V2 with updated commit message (Fixes tag) +
bcma_pcie_mdio_write fixed. I'll try to test it.

--=20
Rafa=C5=82
