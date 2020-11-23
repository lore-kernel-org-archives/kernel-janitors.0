From: Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
Date: Mon, 23 Nov 2020 15:17:56 +0000
Subject: Re: [PATCH] IB/qib: Use dma_set_mask_and_coherent to simplify code
Message-Id: <eb1144c2-f54b-621f-0d7e-d6b8e3d47462@cornelisnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121095127.1335228-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201121095127.1335228-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dennis.dalessandro@cornelisnetworks.com, dledford@redhat.com, jgg@ziepe.ca
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 11/21/2020 4:51 AM, Christophe JAILLET wrote:
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks for the patch.

Looks ok to me.

Acked-by: Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
