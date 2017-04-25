From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Tue, 25 Apr 2017 09:31:45 +0000
Subject: Re: [bug report] esp4: Reorganize esp_output
Message-Id: <20170425093145.GR2649@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421204932.kuy6c2ivmqn7dk65@mwanda>
In-Reply-To: <20170421204932.kuy6c2ivmqn7dk65@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 24, 2017 at 09:48:12AM +0200, Steffen Klassert wrote:
> On Fri, Apr 21, 2017 at 11:49:32PM +0300, Dan Carpenter wrote:
> > Hello Steffen Klassert,
> 
> I plan to fix this with the patch below:
> 
> Subject: [PATCH] esp: Fix misplaced spin_unlock_bh.
> 
> A recent commit moved esp_alloc_tmp() out of a lock
> protected region, but forgot to remove the unlock from
> the error path. This patch removes the forgotten unlock.
> While at it, remove some unneeded error assignments too.
> 
> Fixes: fca11ebde3f0 ("esp4: Reorganize esp_output")
> Fixes: 383d0350f2cc ("esp6: Reorganize esp_output")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>

I've applied this to ipsec-next now, thanks for the report!
