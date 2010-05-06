From: David Miller <davem@davemloft.net>
Date: Thu, 06 May 2010 08:23:06 +0000
Subject: Re: [PATCH] net: emaclite: Use resource_size
Message-Id: <20100506.012306.184837812.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273133540-6894-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1273133540-6894-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tklauser@distanz.ch
Cc: netdev@vger.kernel.org, john.linn@xilinx.com, kernel-janitors@vger.kernel.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu,  6 May 2010 10:12:20 +0200

> Use the resource_size function instead of manually calculating the
> resource size.  This reduces the chance of introducing off-by-one
> errors.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied, thanks.
