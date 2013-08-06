From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Aug 2013 12:04:42 +0000
Subject: Re: [patch] net: remove an unneeded check
Message-Id: <20130806120442.GR5051@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130729191519.GA11874@elgon.mountain>
 <F3E01662-FC33-4FB8-AF30-47DF44252296@intel.com>
In-Reply-To: <F3E01662-FC33-4FB8-AF30-47DF44252296@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rustad, Mark D" <mark.d.rustad@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>

On Mon, Aug 05, 2013 at 06:18:01PM +0000, Rustad, Mark D wrote:
> On Jul 29, 2013, at 12:15 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > "ifa->ifa_label" is an array inside the in_ifaddr struct.  It can never
> > be NULL so we can remove this check.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/net/ipv4/devinet.c b/net/ipv4/devinet.c
> > index 8d48c39..1b7f7ae 100644
> > --- a/net/ipv4/devinet.c
> > +++ b/net/ipv4/devinet.c
> > @@ -1124,10 +1124,7 @@ static int inet_gifconf(struct net_device *dev, char __user *buf, int len)
> > 		if (len < (int) sizeof(ifr))
> > 			break;
> > 		memset(&ifr, 0, sizeof(struct ifreq));
> > -		if (ifa->ifa_label)
> 
> Is there any possibility that this was meant to check ifa->ifa_label[0]?

It has been this way for almost 16 years and no one has complained.
I should have put that into the changelog though, you are right.

regards,
dan carpenter

