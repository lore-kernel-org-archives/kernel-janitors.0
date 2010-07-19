From: Herbert Xu <herbert@gondor.hengli.com.au>
Date: Mon, 19 Jul 2010 06:05:59 +0000
Subject: Re: [PATCH 16/25] crypto: Convert pci_table entries to PCI_VDEVICE
Message-Id: <20100719060559.GA19793@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152100.42276.PeterHuewe@gmx.de>
In-Reply-To: <201007152100.42276.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Roel Kluin <roel.kluin@gmail.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Chihau Chau <chihau@gmail.com>, linux-geode@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 15, 2010 at 09:00:41PM +0200, Peter Huewe wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
> 
> This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
> .subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
> PCI_VDEVICE macro, and thus improves readability.
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
