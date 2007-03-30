From: "Cong WANG" <xiyou.wangcong@gmail.com>
Date: Fri, 30 Mar 2007 01:55:22 +0000
Subject: Re: [KJ] Patch:replace with time_after in drivers/net/eexpress.c
Message-Id: <2375c9f90703291855n5b6e47ecua55b74b4b495d777@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1175058871.11584.33.camel@shani-win>
In-Reply-To: <1175058871.11584.33.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

2007/3/30, Marcin =A6lusarz :> 2007/3/28, Shani :> > @@ -1650,7 +1651,7 @@ =
eexp_set_multicast(struct net_device *dev)> >  #endif> >                  o=
j =3D jiffies;> >                  while ((SCB_CUstat(scb_status(dev)) =3D =
2) &&> > -                       ((jiffies-oj) < 2000));> > +              =
         (time_after(jiffies, oj + 2000)));> >                 if (SCB_CUst=
at(scb_status(dev)) =3D 2)> >                         printk("%s: warning, =
CU didn't stop\n", dev->name);> >                  lp->started &=3D ~(START=
ED_CU);> >> it should be time_before, not time_after...
ACK.

-- So Dark The Con Of Man.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
