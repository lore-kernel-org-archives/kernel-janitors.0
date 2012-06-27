From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 10:36:58 +0000
Subject: Re: [patch -resend] 9p: fix min_t() casting in p9pdu_vwritef()
Message-Id: <20120627103658.GC3007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627090141.GF31212@elgon.mountain>
 <4FEADE2E.90005@bfs.de>
In-Reply-To: <4FEADE2E.90005@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 27, 2012 at 12:19:26PM +0200, walter harms wrote:
> 
> 
> Am 27.06.2012 11:01, schrieb Dan Carpenter:
> > I don't think we're actually likely to hit this limit but if we do
> > then the comparison should be done as size_t.  The original code
> > is equivalent to:
> >         len = strlen(sptr) % USHRT_MAX;
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > I was told this patch "has already made it upstream via the v9fs pull."
> > but it must have been dropped accidentally.  Originally sent on Sat,
> > Jan 15, 2011.
> > 
> > diff --git a/net/9p/protocol.c b/net/9p/protocol.c
> > index 9ee48cb..3d33ecf 100644
> > --- a/net/9p/protocol.c
> > +++ b/net/9p/protocol.c
> > @@ -368,7 +368,7 @@ p9pdu_vwritef(struct p9_fcall *pdu, int proto_version, const char *fmt,
> >  				const char *sptr = va_arg(ap, const char *);
> >  				uint16_t len = 0;
> >  				if (sptr)
> > -					len = min_t(uint16_t, strlen(sptr),
> > +					len = min_t(size_t, strlen(sptr),
> >  								USHRT_MAX);
> >  
> >  				errcode = p9pdu_writef(pdu, proto_version,
> 
> this will result in
> 	uint16_t = size_t
> i would expect compilers to complains since uint16 < size_t
> (most times). In this special case it seems more easy  write it.
> also ushort seems ambitious since  uint16_t  need not to be
> ushort.  so my idea would look like this:
> 
> 	len=strlen
> 	if (len>65535) lene535;
> 	p9pdu_writef(...,(unint16_t)len);
> 

No.  I'm sorry, what you're saying is complete nonsense.  The whole
point of min_t() is that you can cast to both sides to what you want
before you do the compare.

Obviously I wouldn't submit a patch that introduces a compile
warning.  :/

regards,
dan carpenter

