From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:49:51 +0000
Subject: Re: [PATCH 31/43 v2] drivers/net/tokenring: fix sparse warning:
Message-Id: <20090217.194951.04719813.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0902150347o4e06683dy1c9c02dc2564ea4f@mail.gmail.com>
	<20090215121201.26072.42971.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090215121201.26072.42971.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, jjschlst@gmail.com, viro@zeniv.linux.org.uk

From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 15 Feb 2009 13:13:01 +0100

> Impact: Remove the write-only field 'current_ring_status' completely.
> 
> Fix this sparse warnings:
>   drivers/net/tokenring/smctr.c:4410:52: warning: cast truncates bits from constant value (100 becomes 0)
>   drivers/net/tokenring/smctr.c:4415:52: warning: cast truncates bits from constant value (400 becomes 0)
>   drivers/net/tokenring/smctr.c:4420:52: warning: cast truncates bits from constant value (800 becomes 0)
>   drivers/net/tokenring/smctr.c:4425:52: warning: cast truncates bits from constant value (1000 becomes 0)
>   drivers/net/tokenring/smctr.c:4430:52: warning: cast truncates bits from constant value (2000 becomes 0)
>   drivers/net/tokenring/smctr.c:4435:52: warning: cast truncates bits from constant value (4000 becomes 0)
>   drivers/net/tokenring/smctr.c:4440:52: warning: cast truncates bits from constant value (8000 becomes 0)
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
