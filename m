From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 07:56:25 +0000
Subject: Re: [PATCH 03/27] drivers/net: fix sparse warning: returning
Message-Id: <20081225.235625.171202833.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191517.11807.20718.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191517.11807.20718.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:15:17 +0100

> Fix this sparse warning:
> 
>   drivers/net/niu.c:8850:2: warning: returning void-valued expression
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Whilst, as stated, I disagree with this warning, I've
applied your patch.

Thanks.
