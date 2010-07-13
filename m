From: David Miller <davem@davemloft.net>
Date: Tue, 13 Jul 2010 03:33:42 +0000
Subject: Re: [PATCH 2/3 v2] macsonic: free irqs if sonic_open() fails
Message-Id: <20100712.203342.25143931.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100710112229.GX19184@bicker>
	<20100710113057.GA6967@albatros>
	<20100710113906.GB6967@albatros>
In-Reply-To: <20100710113906.GB6967@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: error27@gmail.com, kernel-janitors@vger.kernel.org, fthain@telegraphics.com.au, u.kleine-koenig@pengutronix.de, tj@kernel.org, geert@linux-m68k.org, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 15:39:06 +0400

> macsonic_open() doesn't check sonic_open() return code. If it is error
> we must free requested IRQs.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
