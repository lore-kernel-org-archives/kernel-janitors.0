From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 01 Aug 2012 08:53:07 +0000
Subject: Re: [thermal:thermal 5/13] drivers/power/power_supply_core.c:204:6: error: too many arguments to fun
Message-Id: <20120801085307.GA15699@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120801073612.GA11970@localhost>
In-Reply-To: <20120801073612.GA11970@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Aug 01, 2012 at 04:35:56PM +0800, Zhang, Rui wrote:
> in this case, should I create an incremental patch to fix the problem,
> or should I refresh my patch to cover that?

It's your tree, so all up to you :)

Thanks,
Fengguang

> =E4=B8=89, 2012-08-01 at 15:36 +0800, Fengguang Wu wrote:
> > Hi Zhang,
> >=20
> > Kernel build failed on
> >=20
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git =
thermal
> > head:   77fd40968a98055d5e910461be9a8c7a8be63251
> > commit: 230c4d13a49b0faed79f1273d0f43121fa993ff5 [5/13] Thermal: Remove=
 tc1/tc2 in generic thermal layer.
> > config: x86_64-randconfig-h021 (attached as .config)
> >=20
> > All related error/warning messages:
> >=20
> > drivers/power/power_supply_core.c: In function 'psy_register_thermal':
> > drivers/power/power_supply_core.c:204:6: error: too many arguments to f=
unction 'thermal_zone_device_register'
> > In file included from drivers/power/power_supply_core.c:20:0:
> > include/linux/thermal.h:163:29: note: declared here
> >=20
> > vim +204 drivers/power/power_supply_core.c
> >    201		for (i =3D 0; i < psy->num_properties; i++) {
> >    202			if (psy->properties[i] =3D POWER_SUPPLY_PROP_TEMP) {
> >    203				psy->tzd =3D thermal_zone_device_register(psy->name, 0, 0,
> >  > 204						psy, &psy_tzd_ops, 0, 0, 0, 0);
> >    205				if (IS_ERR(psy->tzd))
> >    206					return PTR_ERR(psy->tzd);
> >    207				break;
> >=20
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centre
> > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
>=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
