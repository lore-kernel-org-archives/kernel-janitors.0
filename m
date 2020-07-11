From: Joe Perches <joe@perches.com>
Date: Sat, 11 Jul 2020 21:20:58 +0000
Subject: Re: [PATCH] net: sky2: switch from 'pci_' to 'dma_' API
Message-Id: <2181026e68d2948c396cc7a7b6bfb7146c1cd5f6.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711204944.259152-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200711204944.259152-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mlindner@marvell.com, stephen@networkplumber.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2020-07-11 at 22:49 +0200, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.

why?
