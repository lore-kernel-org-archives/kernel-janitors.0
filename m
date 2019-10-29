From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Oct 2019 10:07:54 +0000
Subject: Re: [EXT] [bug report] net: aquantia: add basic ptp_clock callbacks
Message-Id: <20191029100754.GG1922@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2c9b7262-d259-5fb1-0f4e-6634ed687284@marvell.com>
In-Reply-To: <2c9b7262-d259-5fb1-0f4e-6634ed687284@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2019 at 09:14:33AM +0000, Igor Russkikh wrote:
>=20
> On 28.10.2019 18:25, Egor Pomozov wrote:
> > Hello Dan,
> > +Igor
> >=20
> > Thank you for pointing the issue. We=E2=80=99ll fixed soon.
>=20
>=20
> >>  1207          clock =3D ptp_clock_register(&aq_ptp->ptp_info, &aq_nic=
->ndev->dev);
> >>  1208          if (!clock || IS_ERR(clock)) {
> >>  1209                  netdev_err(aq_nic->ndev, "ptp_clock_register fa=
iled\n");
> >>  1210                  err =3D PTR_ERR(clock);
> >>  1211                  goto err_exit;
> >>
> >> This is a false positive in Smatch but the code is still problematic.
> >>
> >> The issue is that ptp_clock_register() returns error pointers if there
> >> is an error and it returns NULL if the clock is disabled in the config.
> >> If "clock" is NULL then this code returns PTR_ERR(NULL) which is
> >> success but so that's a bug.
> >>
> >> The question is, is it really realistic for people to run this hardware
> >> without a ptp clock?  If so then we should allow it instead of erroring
> >> out here when clock is NULL.  If not then we should enforce that in the
> >> Kconfig instead of waiting until runtime.
>=20
> Hi Dan, I'd say thats a false positive.
> There exist HW configuration where PTP is disabled or not available.
>=20
> PTR_ERR(NULL) is 0, so eventually driver now functions correctly, allowin=
g to
> proceed but marking ptp functionality as disabled.
>=20
> I agree that's a bit counterintuitive but correct.

I have looked at it again and the "!clock" check should be removed
because it is dead code.  It's not possible for it to be NULL there
because aq_ptp_init() is a dummy function if the PTP clock is not
enabled.

regards,
dan carpenter
