From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Aug 2013 10:32:01 +0000
Subject: Re: [patch] usb: musb: unlock on error in cppi41_dma_callback()
Message-Id: <20130828103201.GQ6329@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821083821.GI5240@elgon.mountain>
In-Reply-To: <20130821083821.GI5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 27, 2013 at 03:05:27PM -0500, Felipe Balbi wrote:
> On Wed, Aug 21, 2013 at 11:38:21AM +0300, Dan Carpenter wrote:
> > We need to unlock and enable IRQs before returning on error.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> doesn't apply

Wei Yongjun already fixed the bug.

regards,
dan carpenter

