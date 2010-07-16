From: David Miller <davem@davemloft.net>
Date: Fri, 16 Jul 2010 03:28:53 +0000
Subject: Re: [PATCH 7/8] net: bridge: fix sign bug
Message-Id: <20100715.202853.233710023.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279219653-12791-1-git-send-email-segooon@gmail.com>
	<20100715122144.0f2cf5cf@nehalam>
In-Reply-To: <20100715122144.0f2cf5cf@nehalam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shemminger@linux-foundation.org
Cc: segooon@gmail.com, kernel-janitors@vger.kernel.org, herbert@gondor.hengli.com.au, yoshfuji@linux-ipv6.org, eric.dumazet@gmail.com, bridge@lists.linux-foundation.org, netdev@vger.kernel.org

From: Stephen Hemminger <shemminger@linux-foundation.org>
Date: Thu, 15 Jul 2010 12:21:44 -0700

> On Thu, 15 Jul 2010 22:47:33 +0400
> Kulikov Vasiliy <segooon@gmail.com> wrote:
> 
>> ipv6_skip_exthdr() can return error code that is below zero.
>> 'offset' is unsigned, so it makes no sense.
>> ipv6_skip_exthdr() returns 'int' so we can painlessly change type of
>> offset to int.
>> 
>> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
...
> Acked-by: Stephen Hemminger <shemminger@vyatta.com>

Applied.
