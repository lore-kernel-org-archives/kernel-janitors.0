From: David Miller <davem@davemloft.net>
Date: Wed, 25 Apr 2007 08:19:38 +0000
Subject: [KJ] Re: [PATCH]:Replace with time_before in net/ipv4/ipip.c
Message-Id: <20070425.011938.74750660.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1177480813.27118.17.camel@shani-win>
In-Reply-To: <1177480813.27118.17.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shani.moideen@wipro.com
Cc: kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@coreworks.de, netdev@vger.kernel.org, kernel-janitors@lists.osdl.org

From: Shani Moideen <shani.moideen@wipro.com>
Date: Wed, 25 Apr 2007 11:30:13 +0530

> Replacing (jiffies - errtime < TIMEOUT) with time_before in net/ipv4/ipip.c
> 
> thanks.
> 
> Signed-off-by: Shani Moideen <shani.moideen@wipro.com>

The test you are replacing actually gives a larger window
of acceptance than time_before() does.

It's been a long standing issue whether we should give up
this semantic advantage for the sake of code cleanliness
in the networking code.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
