From: Dan Carpenter <error27@gmail.com>
Date: Wed, 20 Jul 2011 08:01:09 +0000
Subject: Re: [patch] skbuff: use kfree_skb() instead of kfree()
Message-Id: <20110720080109.GH6445@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110720072343.GF6445@shale.localdomain>
 <20110720072549.GG6445@shale.localdomain>
 <1311147723.3113.116.camel@edumazet-laptop>
In-Reply-To: <1311147723.3113.116.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Shirley Ma <xma@us.ibm.com>, "David S. Miller" <davem@davemloft.net>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jul 20, 2011 at 09:42:03AM +0200, Eric Dumazet wrote:
> Le mercredi 20 juillet 2011 =E0 10:25 +0300, Dan Carpenter a =E9crit :
> > Crap.  Sorry, I shouldn't have sent that.  We shouldn't return the
> > freed "n" here.  I'll send a v2 shortly.
>=20
> Also, dont forget to say its a patch for net-next-2.6

If you're using linux-next, is there a way to tell which tree a
patch came from?  Obviously in this case it's core networking, but
in other cases how does that work?

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
