From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Date: Mon, 10 Nov 2014 20:59:40 +0000
Subject: Re: [patch -mainline] netfilter: ipset: small potential read beyond the end of buffer
Message-Id: <alpine.DEB.2.10.1411102158430.8333@blackhole.kfki.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141107062140.GA10905@mwanda> <20141110142446.GA29586@salvia> <alpine.DEB.2.10.1411101526480.2913@blackhole.kfki.hu> <20141110161121.GA7398@salvia>
In-Reply-To: <20141110161121.GA7398@salvia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Sergey Popovich <popovich_sergei@mail.ru>, Masanari Iida <standby24x7@gmail.com>, Anton Danilov <littlesmilingcloud@gmail.com>, stephen hemminger <stephen@networkplumber.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernddel.org, kernel-janitors@vger.kernel.org

On Mon, 10 Nov 2014, Pablo Neira Ayuso wrote:

> On Mon, Nov 10, 2014 at 03:27:51PM +0100, Jozsef Kadlecsik wrote:
> > On Mon, 10 Nov 2014, Pablo Neira Ayuso wrote:
> > > >From other similar code in that location, I can see Jozsef is using
> > > this pattern:
> > > 
> > >                 if (*len != sizeof(struct ip_set_req_version)) {
> > >                         ret = -EINVAL;
> > >                         goto done;
> > >                 }
> > > 
> > > I think it would be good to stick to that for consistency. Thanks.
> > 
> > Absolutely, yes.
> > 
> > Acked-by: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> 
> OK, then does this look fine to you? I took over Dan's patch and gave
> it another spin. See it attached, thanks.

Yes, it's better this way, thanks!

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
