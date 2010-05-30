From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 30 May 2010 20:55:12 +0000
Subject: Re: Subject: [PATCH] net/ipv6: Use GFP_ATOMIC when a lock is held
Message-Id: <1275252912.2472.23.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005302147310.19253@ask.diku.dk>
	 <1275250288.2472.21.camel@edumazet-laptop>
	 <Pine.LNX.4.64.1005302248500.19253@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005302248500.19253@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le dimanche 30 mai 2010 à 22:50 +0200, Julia Lawall a écrit :

> I think the proposed patch does not work, because the for loop overwrites 
> p.  That use of p looks like it is completely local to the for loop, so 
> perhaps a new variable p1 could be added to be used there?

Please do so.

I just wanted to tell you changing GFP_KERNEL to GFP_ATOMIC is not an
appropriate way to solve this kind of problems. My patch was to get an
idea, not a full and tested patch :)




