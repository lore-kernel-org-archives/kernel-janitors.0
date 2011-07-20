From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 20 Jul 2011 08:21:24 +0000
Subject: Re: [patch] skbuff: use kfree_skb() instead of kfree()
Message-Id: <1311150084.2338.3.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110720072343.GF6445@shale.localdomain>
	 <20110720072549.GG6445@shale.localdomain>
	 <1311147723.3113.116.camel@edumazet-laptop>
	 <20110720080109.GH6445@shale.localdomain>
In-Reply-To: <20110720080109.GH6445@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Shirley Ma <xma@us.ibm.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Le mercredi 20 juillet 2011 à 11:01 +0300, Dan Carpenter a écrit :
> On Wed, Jul 20, 2011 at 09:42:03AM +0200, Eric Dumazet wrote:
> > Le mercredi 20 juillet 2011 à 10:25 +0300, Dan Carpenter a écrit :
> > > Crap.  Sorry, I shouldn't have sent that.  We shouldn't return the
> > > freed "n" here.  I'll send a v2 shortly.
> > 
> > Also, dont forget to say its a patch for net-next-2.6
> 
> If you're using linux-next, is there a way to tell which tree a
> patch came from?  Obviously in this case it's core networking, but
> in other cases how does that work?

In this particular case, David will know for sure since patch is very
recent, but I wanted to make a general advice.

Keep in mind David has to review dozens of patches _per_ day, so netdev
related patches need some extra cooperation from submitters to help the
maintainer.

This extra cooperation means to test the patch on either net-next-2.6 or
net-2.6 tree ;)



