From: David Miller <davem@davemloft.net>
Date: Fri, 16 Jul 2010 03:28:23 +0000
Subject: Re: [PATCH 3/8] drivers: irda: fix sign bug
Message-Id: <20100715.202823.200354925.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279219494-12408-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279219494-12408-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, samuel@sortiz.org, kuninori.morimoto.gx@renesas.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 15 Jul 2010 22:44:54 +0400

> platform_get_irq_byname() can return negative results, it is not seen to
> unsigned irq. Make it signed.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
