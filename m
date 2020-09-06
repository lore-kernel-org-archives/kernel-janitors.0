From: Jakub Kicinski <kuba@kernel.org>
Date: Sun, 06 Sep 2020 19:53:58 +0000
Subject: Re: [PATCH] enic: switch from 'pci_' to 'dma_' API
Message-Id: <20200906125358.04be09a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200906124541.309003-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200906124541.309003-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: benve@cisco.com, govind@gmx.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun,  6 Sep 2020 14:45:41 +0200 Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'vnic_dev_classifier()', 'vnic_dev_fw_info()',
> 'vnic_dev_notify_set()' and 'vnic_dev_stats_dump()' (vnic_dev.c) GFP_ATOMIC
> must be used because its callers take a spinlock before calling these
> functions.

Applied, thank you!
