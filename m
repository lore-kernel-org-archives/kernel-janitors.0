From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 07:53:03 +0000
Subject: Re: [PATCH 01/27] drivers/net: fix sparse warning: use ANSI-style
Message-Id: <20081225.235303.188557355.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191458.11807.57800.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191458.11807.57800.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:14:58 +0100

> Fix this sparse warning:
> 
>   drivers/net/ne.c:932:24: warning: non-ANSI function declaration of function 'init_module'
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
