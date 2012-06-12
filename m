From: David Miller <davem@davemloft.net>
Date: Tue, 12 Jun 2012 22:52:18 +0000
Subject: Re: [PATCH 1/7] drivers/ide/ide-cs.c: adjust suspicious bit operation
Message-Id: <20120612.155218.1712141231523216893.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1206080712510.1793@hadrien>
	<20120611.164316.2252454788889367611.davem@davemloft.net>
	<alpine.DEB.2.02.1206121016090.1795@hadrien>
In-Reply-To: <alpine.DEB.2.02.1206121016090.1795@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 12 Jun 2012 10:17:25 -0400 (EDT)

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> IO_DATA_PATH_WIDTH_8 is 0, so a bit-and with it is always false.  The
> value IO_DATA_PATH_WIDTH covers the bits of the IO_DATA_PATH constants, so
> first pick those bits and then make the test using !=.
> 
> This problem was found using Coccinelle (http://coccinelle.lip6.fr/).
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.
