From: David Miller <davem@davemloft.net>
Date: Tue, 19 Jul 2016 18:31:02 +0000
Subject: Re: [PATCH] drivers: atm: nicstar: Use the correct function to free some resources
Message-Id: <20160719.113102.423760723208563634.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1468739004-3471-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1468739004-3471-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Jul 2016 09:03:24 +0200

> In 'get_scq', 'dma_alloc_coherent' has been used to allocate some
> resources, so we need to free them using 'dma_free_coherent' instead
> of 'kfree'.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
