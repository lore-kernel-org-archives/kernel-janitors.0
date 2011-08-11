From: David Miller <davem@davemloft.net>
Date: Thu, 11 Aug 2011 12:53:40 +0000
Subject: Re: [PATCH] net/netlabel/netlabel_kapi.c: add missing cleanup code
Message-Id: <20110811.055340.41728083700098314.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110811094407.GG3777@shale.localdomain>
	<Pine.LNX.4.64.1108111152130.18938@ask.diku.dk>
	<Pine.LNX.4.64.1108111205450.18938@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1108111205450.18938@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: error27@gmail.com, paul@paul-moore.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Thu, 11 Aug 2011 12:06:04 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> Call cipso_v4_doi_putdef in the case of the failure of the allocation of
> entry.  Reverse the order of the error handling code at the end of the
> function and insert more labels in order to reduce the number of
> unnecessary calls to kfree.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
