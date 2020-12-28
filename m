From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 28 Dec 2020 05:49:38 +0000
Subject: Re: [PATCH] cpufreq: brcmstb-avs-cpufreq: Fix some resource leaks in the error handling path of the 
Message-Id: <20201228053738.6b6uaz2ipzjpwzet@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201219101751.181783-1-christophe.jaillet@wanadoo.fr>
 <20201222043505.rq3cmajc3mxv3p2z@vireshk-i7>
 <a7e1f78c-b4c9-4ef5-7ca4-94a65fefd299@wanadoo.fr>
In-Reply-To: <a7e1f78c-b4c9-4ef5-7ca4-94a65fefd299@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: f.fainelli@gmail.com, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, mmayer@broadcom.com, linux-arm-kernel@lists.infradead.org

On 27-12-20, 18:22, Christophe JAILLET wrote:
> Le 22/12/2020 =E0 05:35, Viresh Kumar a =E9crit=A0:
> > On 19-12-20, 11:17, Christophe JAILLET wrote:
> > > If 'cpufreq_register_driver()' fails, we must release the resources
> > > allocated in 'brcm_avs_prepare_init()' as already done in the remove
> > > function.
> > >=20
> > > To do that, introduce a new function 'brcm_avs_prepare_uninit()' in o=
rder
> > > to avoid code duplication. This also makes the code more readable (IM=
HO).
> > >=20
> > > Fixes: de322e085995 ("cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq drive=
r for Broadcom STB SoCs")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > > I'm not sure that the existing error handling in the remove function =
is
> > > correct and/or needed.
> > > ---
> > >   drivers/cpufreq/brcmstb-avs-cpufreq.c | 25 ++++++++++++++++++++-----
> > >   1 file changed, 20 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/=
brcmstb-avs-cpufreq.c
> > > index 3e31e5d28b79..750ca7cfccb0 100644
> > > --- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
> > > +++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> > > @@ -597,6 +597,16 @@ static int brcm_avs_prepare_init(struct platform=
_device *pdev)
> > >   	return ret;
> > >   }
> > > +static void brcm_avs_prepare_uninit(struct platform_device *pdev)
> > > +{
> > > +	struct private_data *priv;
> > > +
> > > +	priv =3D platform_get_drvdata(pdev);
> > > +
> > > +	iounmap(priv->avs_intr_base);
> > > +	iounmap(priv->base);
> > > +}
> > > +
> > >   static int brcm_avs_cpufreq_init(struct cpufreq_policy *policy)
> > >   {
> > >   	struct cpufreq_frequency_table *freq_table;
> > > @@ -732,21 +742,26 @@ static int brcm_avs_cpufreq_probe(struct platfo=
rm_device *pdev)
> > >   	brcm_avs_driver.driver_data =3D pdev;
> > > -	return cpufreq_register_driver(&brcm_avs_driver);
> > > +	ret =3D cpufreq_register_driver(&brcm_avs_driver);
> > > +	if (ret)
> > > +		goto err_uninit;
> > > +
> > > +	return 0;
> > > +
> > > +err_uninit:
> > > +	brcm_avs_prepare_uninit(pdev);
> > > +	return ret;
> >=20
> > Maybe rewrite as:
> >=20
> > 	ret =3D cpufreq_register_driver(&brcm_avs_driver);
> > 	if (ret)
> >                  brcm_avs_prepare_uninit(pdev);
> > 	return ret;
> >=20
>=20
> Personlaly, I prefer what I have proposed. Having a clear and dedicated
> error handling path is more future proff, IMHO.

I would have agreed to that if there were other things we were handling in =
the
error path, but right now we are adding an extra label, goto, etc without a=
ny
need. If in future this needs a change, we can always come back to it and u=
pdate
with a label. But right now I would suggest to keep it simple.

> > >   }
> > >   static int brcm_avs_cpufreq_remove(struct platform_device *pdev)
> > >   {
> > > -	struct private_data *priv;
> > >   	int ret;
> > >   	ret =3D cpufreq_unregister_driver(&brcm_avs_driver);
> > >   	if (ret)
> > >   		return ret;
> >=20
> > Instead of returning here, it can be just WARN_ON(ret); and then go on =
and free
> > the resources and this needs to be done in a separate patch.
>=20
> Ok, I agree (see my comment below the --- in my patch).
> I'll send a patch for it when the first patch will be applied, unless you
> prefer if I resend as a serie.

Based on the above comment from me, I am expecting another version from you=
 for
this patch. So you can fix both the issues in the same patchset.

--=20
viresh
