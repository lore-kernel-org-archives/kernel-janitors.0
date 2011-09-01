From: Dan Carpenter <error27@gmail.com>
Date: Thu, 01 Sep 2011 15:04:25 +0000
Subject: Re: [patch 1/3 -next] 6LoWPAN: use kfree_skb() instead of kfree()
Message-Id: <20110901150425.GK3705@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110830134552.GH3705@shale.localdomain>
 <1314715248.2935.25.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
 <CAJmB2rBid27YYT4f6vMtBf9EMFWZQgT=xO85z4OBz326pUT+4A@mail.gmail.com>
In-Reply-To: <CAJmB2rBid27YYT4f6vMtBf9EMFWZQgT=xO85z4OBz326pUT+4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, "open list:IEEE 802.15.4 SUB..." <linux-zigbee-devel@lists.sourceforge.net>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Sep 01, 2011 at 01:26:02PM +0400, Alexander Smirnov wrote:
> Hi Dan, Eric,
> 
> thank you a lot for the finds, that were my faults.
> 

So uh...  You're going to send a patch to fix the things Eric
mentioned, right?

regards,
dan carpenter

