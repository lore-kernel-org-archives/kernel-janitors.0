From: David Miller <davem@davemloft.net>
Date: Thu, 03 Sep 2020 23:54:20 +0000
Subject: Re: [PATCH RESEND] epic100: switch from 'pci_' to 'dma_' API
Message-Id: <20200903.165420.1235227173707691043.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200903200509.296149-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200903200509.296149-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, mst@redhat.com, mkubecek@suse.cz, snelson@pensando.io, vaibhavgupta40@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu,  3 Sep 2020 22:05:09 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'epic_init_one()', GFP_KERNEL can be used
> because it is a probe function and no lock is acquired.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
