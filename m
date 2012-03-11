From: David Miller <davem@davemloft.net>
Date: Sun, 11 Mar 2012 22:42:26 +0000
Subject: Re: [PATCH 3/7] drivers/net/irda/{ali-ircc,via-ircc,w83977af-ir}.c: ensure arguments to
Message-Id: <20120311.154226.1278106806584648233.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331502542-18094-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331502542-18094-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: samuel@sortiz.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Mar 2012 22:49:02 +0100

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Convert calls to free_irq so that the second argument is the same as the
> last argument of the corresponding call to request_irq.  Without this
> property, free_irq does nothing.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
