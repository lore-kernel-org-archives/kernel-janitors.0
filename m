From: Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 18 Sep 2017 16:04:34 +0000
Subject: Re: [PATCH 0/2] rapidio: Two fixes for 'rio_dma_transfer()'
Message-Id: <37c07c2e-e6ed-96fa-8cdd-68bfe598eda3@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1505687047.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1505687047.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mporter@kernel.crashing.org, alexandre.bounine@idt.com, lstoakes@gmail.com, akpm@linux-foundation.org, jesper.nilsson@axis.com, christian.koenig@amd.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hey,

I don't have any relation to the rapidio code short of making a small 
change to an API it used. But I reviewed both patches and they look 
correct to me.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Logan

On 17/09/17 04:33 PM, Christophe JAILLET wrote:
> These 2 patches are really close and are both related to error handling
> in 'rio_dma_transfer()'.
> The first one fixes some resources leak in case of error.
> The 2nd one fixes a test so that the corresponding error can be handled
> correctly.
> 
> I've splitted this into 2 paches because the first one looks trivial to me.
> But the 2nd one should require more attention, IMO. The existing error
> handling was dead code because 'dma_map_sg()' can not return -EFAULT. So
> this error handling code has never been executed/tested and I can't test it
> myself.
> 
> Christophe JAILLET (2):
>    rapidio: Fix resources leak in error handling path in
>      'rio_dma_transfer()'
>    rapidio: Fix an error handling in 'rio_dma_transfer()'
> 
>   drivers/rapidio/devices/rio_mport_cdev.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
