From: Jens Axboe <axboe@kernel.dk>
Date: Sat, 11 Jul 2020 15:27:45 +0000
Subject: Re: [PATCH] rsxx: switch from 'pci_free_consistent()' to 'dma_free_coherent()'
Message-Id: <c885edac-8de8-ba4c-c8bc-98654417ce20@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711064647.247564-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200711064647.247564-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, hch@infradead.org
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/11/20 12:46 AM, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script bellow.
> It has been compile tested.
> 
> This also aligns code with what is in use in '/rsxx/dma.c'

Applied, thanks.

-- 
Jens Axboe
