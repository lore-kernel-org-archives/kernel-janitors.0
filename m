From: David Miller <davem@davemloft.net>
Date: Sun, 19 Feb 2012 23:58:11 +0000
Subject: Re: [PATCH] b44: remove __exit from b44_pci_exit()
Message-Id: <20120219.185811.1602965172431248468.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <74eccdc061524ad9ab6aae1ca0dd7a020921b1fe.1329684207.git.n.pajkovsky@gmail.com>
In-Reply-To: <74eccdc061524ad9ab6aae1ca0dd7a020921b1fe.1329684207.git.n.pajkovsky@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: n.pajkovsky@gmail.com
Cc: zambrano@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
Date: Sun, 19 Feb 2012 21:47:43 +0100

> WARNING: drivers/net/ethernet/broadcom/built-in.o(.init.text+0x5d): Section mismatch in reference from the function b44_init() to the function .exit.text:b44_pci_exit()
> 
> module exits with b44_cleanup()
> 
> Signed-off-by: Nikola Pajkovsky <n.pajkovsky@gmail.com>

Applied.
