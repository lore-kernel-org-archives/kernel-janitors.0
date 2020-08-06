From: David Miller <davem@davemloft.net>
Date: Thu, 06 Aug 2020 21:23:11 +0000
Subject: Re: [PATCH] epic100: switch from 'pci_' to 'dma_' API
Message-Id: <20200806.142311.94169513118353100.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200806201935.733641-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200806201935.733641-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, snelson@pensando.io, mhabets@solarflare.com, vaibhavgupta40@gmail.com, mst@redhat.com, mkubecek@suse.cz, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu,  6 Aug 2020 22:19:35 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.

Christophe, the net-next tree is closed so I'd like to ask that you
defer submitting these conversion patches until the net-next
tree opens back up again.

Thank you.
