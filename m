From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 19 Aug 2010 06:14:31 +0000
Subject: Re: [PATCH v2] ether1: Use net_device_stats from struct net_device
Message-Id: <20100819061431.GA20793@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061719-19645-1-git-send-email-tklauser@distanz.ch>
	<1282115064-3701-1-git-send-email-tklauser@distanz.ch>
	<20100818083304.2ef2eea4@nehalam>
	<20100818.131043.226780154.davem@davemloft.net>
In-Reply-To: <20100818.131043.226780154.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 2010-08-18 at 22:10:43 +0200, David Miller <davem@davemloft.net> wrote:
> From: Stephen Hemminger <shemminger@vyatta.com>
> Date: Wed, 18 Aug 2010 08:33:04 -0700
> 
> > On Wed, 18 Aug 2010 09:04:24 +0200
> > Tobias Klauser <tklauser@distanz.ch> wrote:
> > 
> >>  
> >> -	memset (&priv(dev)->stats, 0, sizeof (struct net_device_stats));
> >> +	memset(&dev->stats, 0, sizeof(struct net_device_stats));
> > 
> > This is incorrect, just remove the memset.  The stats are initialized
> > when device is created.  The Linux device driver convention is to
> > keep stats when device is set down and brought back up; that is what
> > the majority of other drivers do.
> 
> Yep, both the ether1 and ether3 patch have this problem.  Looks
> like we'll see v4 coming some :-)

Thanks a lot. I'll send another updated patch. Hope I get it right this
time :-)

AFAICS there are a few other network drivers having the same problem,
I'll send patches for those too.
