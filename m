From: Darren Hart <dvhart@infradead.org>
Date: Tue, 12 Dec 2017 00:35:39 +0000
Subject: Re: [PATCH] platform/x86: dell-wmi: check for kmalloc() errors
Message-Id: <20171212003539.GE27831@fury>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171211105427.ed6wmdsz2s4xxfht@mwanda>
 <ed9fa3c8c5bc45f58ff6844e628791a2@ausx13mpc120.AMER.DELL.COM>
In-Reply-To: <ed9fa3c8c5bc45f58ff6844e628791a2@ausx13mpc120.AMER.DELL.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mario.Limonciello@dell.com
Cc: dan.carpenter@oracle.com, mjg59@srcf.ucam.org, pali.rohar@gmail.com, andy@infradead.org, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 11, 2017 at 02:58:28PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > Sent: Monday, December 11, 2017 4:54 AM
> > To: Matthew Garrett <mjg59@srcf.ucam.org>; Limonciello, Mario
> > <Mario_Limonciello@Dell.com>
> > Cc: Pali Roh=E1r <pali.rohar@gmail.com>; Darren Hart <dvhart@infradead.=
org>;
> > Andy Shevchenko <andy@infradead.org>; platform-driver-x86@vger.kernel.o=
rg;
> > kernel-janitors@vger.kernel.org
> > Subject: [PATCH] platform/x86: dell-wmi: check for kmalloc() errors
> >=20
> > This allocation won't fail in the current kernel because it's small but
> > not checking for kmalloc() failures introduces static checker warnings
> > so let's fix it.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
> > index 39d2f4518483..fb25b20df316 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -639,6 +639,8 @@ static int dell_wmi_events_set_enabled(bool enable)
> >  	int ret;
> >=20
> >  	buffer =3D kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNE=
L);
> > +	if (!buffer)
> > +		return -ENOMEM;
> >  	buffer->cmd_class =3D CLASS_INFO;
> >  	buffer->cmd_select =3D SELECT_APP_REGISTRATION;
> >  	buffer->input[0] =3D 0x10000;
>=20
> Thanks for that.
>=20
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>

Queued for testing, and I'll pull it back to fixes for rc3/4 as well.

--=20
Darren Hart
VMware Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
