From: Thomas Petazzoni <thomas.petazzoni@enix.org>
Date: Thu, 21 Sep 2006 07:35:55 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/block [sane version]
Message-Id: <20060921093555.5cf624ea@thomas.toulouse>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171753m1836aaf3y52788c84a52d5e6a@mail.gmail.com>
In-Reply-To: <6b4e42d10609171753m1836aaf3y52788c84a52d5e6a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

Le Thu, 21 Sep 2006 00:20:17 -0700,
Nishanth Aravamudan <nacc@us.ibm.com> a =E9crit :

> > +	id_log_drv_t *id_ldrive =3D NULL;
> > +	id_ctlr_t *id_ctlr_buf =3D NULL;
> > +	sense_log_drv_stat_t *id_lstatus_buf =3D NULL;
> > +	config_t *sense_config_buf =3D NULL;
>=20
> Why initialize if you're going to immediately assign the return of
> kzalloc()?

I wanted to say the same, but just before sending my mail, I understood
that it was for the "goto end;" thing to work. The code at the "end:"
label kfree()s all variables, regardless of whether they have been
allocated. It works correctly if all pointers are initially set to NULL
('cause kfree(NULL) works), but not if pointers contain garbage.

However, as you said, this is another logical change, which must be
done in another patch.

Sincerly,

Thomas
--=20
Thomas Petazzoni - thomas.petazzoni@enix.org
http://{thomas,sos,kos}.enix.org - http://www.toulibre.org
http://www.{livret,agenda}dulibre.org
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
