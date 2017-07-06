From: Christoph Hellwig <hch@lst.de>
Date: Thu, 06 Jul 2017 15:28:34 +0000
Subject: Re: [PATCH] nvme-pci: compile warnings in nvme_alloc_host_mem()
Message-Id: <20170706152834.GA2160@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170706092651.dshe5uxn665icxma@mwanda>
In-Reply-To: <20170706092651.dshe5uxn665icxma@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 06, 2017 at 12:26:52PM +0300, Dan Carpenter wrote:
> "i" should be signed or it could cause a forever loop on the cleanup
> path. "size" can be used uninitialized.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
