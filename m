From: Lennert Buytenhek <buytenh@wantstofly.org>
Date: Sun, 25 Jul 2010 15:54:12 +0000
Subject: Re: [patch -next v2] mv643xx_eth: potential null dereference
Message-Id: <20100725155412.GF21121@mail.wantstofly.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723101528.GF26313@bicker> <1279881177.24768.1623.camel@Joe-Laptop.home> <20100723110504.GG26313@bicker> <4C49C39E.8020502@bfs.de> <20100723221514.GJ26313@bicker> <4C4AAB5B.2050901@bfs.de> <20100724190036.GA21121@mail.wantstofly.org> <4C4C4E75.4080603@bfs.de>
In-Reply-To: <4C4C4E75.4080603@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Dan Carpenter <error27@gmail.com>, Joe Perches <joe@perches.com>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Denis Kirjanov <kirjanov@gmail.com>, Saeed Bishara <saeed@marvell.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jul 25, 2010 at 04:47:17PM +0200, walter harms wrote:

> >> IMHO it would be better to make sure that pd->t_clk,pd->tx_csum_limit
> >> have usefull values than adding a check but this is up to the maintainer.
> > 
> > I don't see the point of that at all.  We check against zero to see
> > whether the caller bothered to fill in the field at all, but if the
> > caller wants to pass in bogus values, that's up to the caller.
> 
> at first i have to admit i looked only at the patch.
> for me the situation looks this way:
> 
> You check the values for 0 (and uses default) or take what ever in pd is.
> The current code is setup like:
> 
>   1. check if pd is set
>   2. check if pd->value is non zero and use it
> 
> the whole "check X" can be avoided if you could create a pd with all values
> set to default and just take what comes from the user.

Why would you want to avoid "check X"?


> my objection agains this kind of code is that it is not obvious
> what some one is trying to archive
> (pd != NULL && pd->t_clk != 0) ? pd->t_clk : 133000000;
> 
> the pd check means: do i have a configuration  ?

Yep.


> the pd->t_clk != 0 means: should i use then or default ?

Yep.


> This is mixing two very different questions.

And?

You're arguing against the use of 'if (a && b)' in general?


> therefore my idea in the last posting to have a default init if (!pd)
> and then use the else to make clear that additional checks for
> pd->value are expected.

Again, I don't see the point of this, and I think we're just splitting
hairs here and wasting everyone's time.


> this this is the init code readability and simplicity should be king.

'if (foo != NULL && foo->value <op> <value>)' is a fairly common C
construct, in my opinion, and I don't see how expanding it into a
multi-line nested if construct will make it either more readable or
simpler.


> hope that helps,

Not really.


thanks,
Lennert
