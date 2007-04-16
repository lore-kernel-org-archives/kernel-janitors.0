From: "Chris Miller" <lordsauronthegreat@gmail.com>
Date: Mon, 16 Apr 2007 20:13:13 +0000
Subject: Re: [KJ] [PATCH]sch_atm.c-kzalloc
Message-Id: <e5a3e9ac0704161313l17a21225x82139760f2809608@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1176703544.13066.13.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1176703544.13066.13.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 4/16/07, Marcin =C5=9Alusarz <marcin.slusarz@gmail.com> wrote:> 2007/4/1=
6, Alexey Dobriyan <adobriyan@gmail.com>:> > On 4/16/07, vignesh.babu@wipro=
.com <vignesh.babu@wipro.com> wrote:> > > Replacing kmalloc/memset combinat=
ion with kzalloc.> >> > > --- a/net/sched/sch_atm.c> > > +++ b/net/sched/sc=
h_atm.c> > > @@ -308,13 +308,12 @@ static int atm_tc_change(struct Qdisc *s=
ch, u32> > > classid, u32 parent,> > >               }> > >       }> > >   =
    DPRINTK("atm_tc_change: new id %x\n",classid);> > > -     flow =3D kmal=
loc(sizeof(struct atm_flow_data)+hdr_len,GFP_KERNEL);> > > +     flow =3D k=
zalloc(sizeof(struct atm_flow_data)+hdr_len,GFP_KERNEL);
=3D=3D Newbie Question =3D=3DWhat's the difference between the two kmalloc =
and the kzalloc calls?
-- It's not much, but it's what I call 127.0.0.1
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
