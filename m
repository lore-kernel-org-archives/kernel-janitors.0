From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 08 Mar 2004 22:26:34 +0000
Subject: Re: [Kernel-janitors] [PATCH] - Audit for drivers/block/floppy.c.
Message-Id: <1078784794.20166.2.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078342465.14557.44.camel@telecentrolivre>
In-Reply-To: <1078342465.14557.44.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Francois,

Em Seg, 2004-03-08 =E0s 17:30, Francois Romieu escreveu:
> Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> :
> [...]
> > +out5:
> > +	for (i =3D 0; i < N_DRIVE; i++)
> > +		del_timer(&motor_off_timer[i]);
> > +out4:
> > +	flush_scheduled_work();
> > +	if (usage_count)
> > +		floppy_release_irq_and_dma();
> > +out3:
> >  	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
> >  	blk_cleanup_queue(floppy_queue);
> > -fail_queue:
> > +out2:
> >  	unregister_blkdev(FLOPPY_MAJOR,"fd");
> > -out:
> > -	for (i=3D0; i<N_DRIVE; i++)
> > -		put_disk(disks[i]);
> > +out1:
> >  	devfs_remove("floppy");
> > +out:
> > +	while (dr--)
> > +		put_disk(disks[dr]);
>=20
> What about renaming "out" to "out_put_disk", "out1" to "out_devfs_remove"=
, etc.
> so that it is possible to verify that the code behind a label actually do=
es
> what it is supposed to do ?

Hummm.... Good point, I will rediff.

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
