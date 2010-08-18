From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 18 Aug 2010 08:33:35 +0000
Subject: Re: [PATCH v2] ether1: Use net_device_stats from struct net_device
Message-Id: <20100818083335.GH15670@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061719-19645-1-git-send-email-tklauser@distanz.ch>
	<1282115064-3701-1-git-send-email-tklauser@distanz.ch>
	<20100818081306.GA9149@n2100.arm.linux.org.uk>
	<1282120073.2194.40.camel@edumazet-laptop>
In-Reply-To: <1282120073.2194.40.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On 2010-08-18 at 10:27:53 +0200, Eric Dumazet <eric.dumazet@gmail.com> wrot=
e:
> Le mercredi 18 ao=FBt 2010 =E0 09:13 +0100, Russell King - ARM Linux a
> =E9crit :
> > On Wed, Aug 18, 2010 at 09:04:24AM +0200, Tobias Klauser wrote:
> > > @@ -965,7 +965,7 @@ ether1_close (struct net_device *dev)
> > >  static struct net_device_stats *
> > >  ether1_getstats (struct net_device *dev)
> > >  {
> > > -	return &priv(dev)->stats;
> > > +	return &dev->stats;
> > >  }
> >=20
> > Doesn't the core do this for you already if you omit this function?
> >=20
> > Same comment for ether3.c
>=20
> Yes, thats right, no need to declare ndo_get_stats() methods that only
> returns &dev->stats

Thanks. I'll send another updated patch, omitting the ether1_getstats
(same for ether3). Sorry for the mess.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
