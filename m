From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
Date: Sun, 25 Mar 2007 21:56:21 +0000
Subject: Re: [KJ] [PATCH] dvb: remove coding style comments on indentation
Message-Id: <20070325215621.GA10366@tux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4606E766.3090100@linuxtv.org>
In-Reply-To: <4606E766.3090100@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Mar 25, 2007 at 05:19:34PM -0400, Michael Krufky wrote:
> Charles Cl=E9ment wrote:
> > Remove comments on setting indentation for emacs in bt8xx driver.
>=20
> What do we gain by this patch?  The "c-basic-offset: 8" helps us
> to enforce tabbing style.  Why would anybody want this removed?
>=20
> Regards,
>=20
> Mike Krufky

I agree that there is no benefit from the patch itself, but the
Documentation/CodingStyle file already specifies the tabbing style.
I do not think it should be included in multiple source files.

> > Signed-off-by: Charles Cl=E9ment <caratorn@gmail.com>
> >=20
> > ---
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bt832.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bt832.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bt832.c
> > @@ -255,11 +255,3 @@ static void __exit bt832_cleanup_module(
> > =20
> >  module_init(bt832_init_module);
> >  module_exit(bt832_cleanup_module);
> > -
> > -/*
> > - * Overrides for Emacs so that we follow Linus's tabbing style.
> > - * -------------------------------------------------------------------=
--------
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-cards.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv-cards.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-cards.c
> > @@ -5044,10 +5044,3 @@ int __devinit bttv_handle_chipset(struct
> >  		pci_write_config_byte(btv->c.pci, PCI_LATENCY_TIMER, latency);
> >  	return 0;
> >  }
> > -
> > -
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-driver.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv-driver.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-driver.c
> > @@ -4981,9 +4981,3 @@ static void bttv_cleanup_module(void)
> > =20
> >  module_init(bttv_init_module);
> >  module_exit(bttv_cleanup_module);
> > -
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-gpio.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv-gpio.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-gpio.c
> > @@ -186,9 +186,3 @@ void bttv_gpio_bits(struct bttv_core *co
> >  	spin_unlock_irqrestore(&btv->gpio_lock,flags);
> >  }
> >  EXPORT_SYMBOL(bttv_gpio_bits);
> > -
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv.h
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv.h
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv.h
> > @@ -355,8 +355,3 @@ extern void bttv_input_fini(struct bttv=20
> >  extern void bttv_input_irq(struct bttv *dev);
> > =20
> >  #endif /* _BTTV_H_ */
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-i2c.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv-i2c.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-i2c.c
> > @@ -481,9 +481,3 @@ int __devexit fini_bttv_i2c(struct bttv=20
> > =20
> >  	return i2c_del_adapter(&btv->c.i2c_adap);
> >  }
> > -
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-if.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv-if.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-if.c
> > @@ -151,9 +151,3 @@ void bttv_i2c_call(unsigned int card, un
> >  		return;
> >  	bttv_call_i2c_clients(&bttvs[card], cmd, arg);
> >  }
> > -
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-input.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv-input.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-input.c
> > @@ -348,10 +348,3 @@ void bttv_input_fini(struct bttv *btv)
> >  	kfree(btv->remote);
> >  	btv->remote =3D NULL;
> >  }
> > -
> > -
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttvp.h
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttvp.h
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttvp.h
> > @@ -469,9 +469,3 @@ extern struct bttv bttvs[BTTV_MAX];
> >  #define btaor(dat,mask,adr) btwrite((dat) | ((mask) & btread(adr)), ad=
r)
> > =20
> >  #endif /* _BTTVP_H_ */
> > -
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-risc.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv-risc.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-risc.c
> > @@ -894,9 +894,3 @@ bttv_overlay_risc(struct bttv *btv,
> >  	buf->vb.field =3D ov->field;
> >  	return 0;
> >  }
> > -
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> > Index: linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-vbi.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> > --- linux-2.6.21-rc4.orig/drivers/media/v=
ideo/bt8xx/bttv-vbi.c
> > +++ linux-2.6.21-rc4/drivers/media/video/bt8xx/bttv-vbi.c
> > @@ -446,10 +446,3 @@ bttv_vbi_fmt_reset	(struct bttv_vbi_fmt=20
> >  	/* See bttv_vbi_fmt_set(). */
> >  	f->end                  =3D tvnorm->vbistart[0] * 2 + 2;
> >  }
> > -
> > -/* -------------------------------------------------------------------=
---- */
> > -/*
> > - * Local variables:
> > - * c-basic-offset: 8
> > - * End:
> > - */
> >=20
>=20
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--=20
Charles Cl=E9ment.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
