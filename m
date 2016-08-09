From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Aug 2016 17:58:59 +0000
Subject: Re: [bug report] x86/sfi: Enable enumeration of SD devices
Message-Id: <20160809175859.GF4186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715192348.GA6521@mwanda>
In-Reply-To: <20160715192348.GA6521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Aug 09, 2016 at 06:32:55PM +0300, Andy Shevchenko wrote:
> On Fri, 2016-07-15 at 22:23 +0300, Dan Carpenter wrote:
> > Hello Andy Shevchenko,
> >=20
> > The patch 05f310e26fe9: "x86/sfi: Enable enumeration of SD devices"
> > from Jul 12, 2016, leads to the following static checker warning:
> >=20
> > 	arch/x86/platform/intel-mid/sfi.c:427 sfi_handle_sd_dev()
> > 	warn: 'pdata' isn't an ERR_PTR
> >=20
> > arch/x86/platform/intel-mid/sfi.c
> > =A0=A0=A0416=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0memset(&sd_info, 0, sizeof(sd=
_info));
> > =A0=A0=A0417=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0strncpy(sd_info.name, pentry-=
>name, SFI_NAME_LEN);
> > =A0=A0=A0418=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sd_info.bus_num =3D pentry->h=
ost_num;
> > =A0=A0=A0419=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sd_info.max_clk =3D pentry->m=
ax_freq;
> > =A0=A0=A0420=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sd_info.addr =3D pentry->addr;
> > =A0=A0=A0421=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_debug("SD bus =3D %d, name=
 =3D %16.16s, max_clk =3D %d,
> > addr =3D 0x%x\n",
> > =A0=A0=A0422=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sd=
_info.bus_num,
> > =A0=A0=A0423=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sd=
_info.name,
> > =A0=A0=A0424=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sd=
_info.max_clk,
> > =A0=A0=A0425=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sd=
_info.addr);
> > =A0=A0=A0426=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pdata =3D intel_mid_sfi_get_p=
data(dev, &sd_info);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > This is a macro calling a function pointer.=A0=A0None of the functions
> > return error pointers.=A0=A0Some return NULL on error but some return N=
ULL
> > on success.
> >=20
> > =A0=A0=A0427=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(pdata))
> > =A0=A0=A0428=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0retur=
n;
> > =A0=A0=A0429=A0=A0
> > =A0=A0=A0430=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* Nothing we can do with thi=
s for now */
> > =A0=A0=A0431=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sd_info.platform_data =3D pda=
ta;
> > =A0=A0=A0432=A0=A0
>=20
> Thanks for catching up this. At some point in the future I will re-check =

> all those so called "device lib" files to be aligned to one standard. Of
> course you may propose a patch if you feel you can do it.

I'm a temporary haitus from work but what's the standard supposed
to be?

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
