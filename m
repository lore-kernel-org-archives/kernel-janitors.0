From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Date: Thu, 26 Nov 2020 12:04:08 +0000
Subject: Re: [PATCH] crypto: qat - Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201126120408.GA21666@silpixa00400314>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121071359.1320167-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201121071359.1320167-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "Trahe, Fiona" <fiona.trahe@intel.com>, "Ziemba, Wojciech" <wojciech.ziemba@intel.com>, "Chiappero, Marco" <marco.chiappero@intel.com>, qat-linux <qat-linux@intel.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Christophe,

On Sat, Nov 21, 2020 at 07:13:59AM +0000, Christophe JAILLET wrote:
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
> 
> While at it, also remove some unless extra () in the 32 bits case.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Instead of returning -EFAULT, we could also propagate the error returned
> by dma_set_mask_and_coherent()
I'm going to re-submit implementing the comment above and also including
qat_4xxx.

Regards,

-- 
Giovanni
