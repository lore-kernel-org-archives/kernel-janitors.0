From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 18:46:30 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 28/38] net/pcnet32: replace
Message-Id: <20040924184630.GK1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81645540843534858=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040924180825.GH1757@us.ibm.com>
In-Reply-To: <20040924180825.GH1757@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============81645540843534858==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 07:21:13PM +0100, Matthew Wilcox wrote:
> On Fri, Sep 24, 2004 at 11:08:25AM -0700, Nishanth Aravamudan wrote:
> > Any comments would be appreciated.
> > +++ 2.6.9-rc1-mm4/drivers/net/pcnet32.c	2004-09-13 14:38:47.000000000 -0700
> > @@ -847,7 +847,7 @@ static int pcnet32_phys_id(struct net_de
> >      if ((!data) || (data > (u32)(MAX_SCHEDULE_TIMEOUT / HZ)))
> >      data = (u32)(MAX_SCHEDULE_TIMEOUT / HZ);
> >  
> > -    schedule_timeout(data * HZ);
> > +    msleep_interruptible(data * 1000);
> >      del_timer_sync(&lp->blink_timer);
> 
> Surely that needs to be:
> 
> 	if ((!data) || (data > (u32)(MAX_SCHEDULE_TIMEOUT / 1000))
> 		data = (u32)(MAX_SCHEDULE_TIMEOUT / 1000)
> 	msleep_interruptible(data * 1000);

Beyond the tabbing issue I already replied to (which I now realize
wasn't really what you were referring to :) ), there is this problem:

I seems data is in terms of seconds. MAX_SCHEDULE_TIMEOUT is in terms
of jiffies, so dividing it by 1000 to determine if the requested timeout
is longer than the longest possible timeout would not work, I don't
think.

The code should work as is, because the if checks to see if
either data is 0 or greater than the maximum allowed number of seconds
to sleep. In either case, data gets set to the maximum number of seconds
to sleep. Then msleep_interruptible will sleep for the corresponding
number of msecs :)

I think it all works itself out...

-Nish

--===============81645540843534858==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81645540843534858==--
