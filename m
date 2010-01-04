From: David Miller <davem@davemloft.net>
Date: Mon, 04 Jan 2010 05:22:49 +0000
Subject: Re: [PATCH 3/7] drivers/net/cxgb3: Use kzalloc for allocating only
Message-Id: <20100103.212249.91319016.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912190816340.30546@ask.diku.dk>
	<4B3005D5.9070608@chelsio.com>
In-Reply-To: <4B3005D5.9070608@chelsio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: divy@chelsio.com
Cc: julia@diku.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Divy Le Ray <divy@chelsio.com>
Date: Mon, 21 Dec 2009 15:33:41 -0800

> Julia Lawall wrote:
>>
>> From: Julia Lawall <julia@diku.dk>
>>
>> Use kzalloc rather than kcalloc(1,...)
 ...
>> Signed-off-by: Julia Lawall <julia@diku.dk>
>>
> 
> Acked-by: Divy Le Ray <divy@chelsio.com>

Applied to net-next-2.6, thanks.
