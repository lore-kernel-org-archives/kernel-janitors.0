From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Thu, 13 Dec 2012 18:28:17 +0000
Subject: Re: [PATCH 1/2] drivers/w1/masters/mxc_w1.c: use devm_ functions
Message-Id: <20121213182817.GB30828@ioremap.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354835724-26945-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1354835724-26945-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, GregKH <greg@kroah.com>

On Fri, Dec 07, 2012 at 12:15:24AM +0100, Julia Lawall (Julia.Lawall@lip6.fr) wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The various devm_ functions allocate memory that is released when a driver
> detaches.  This patch uses these functions for data that is allocated in
> the probe function of a platform device and is only freed in the remove
> function.
> 
> At the same time, this fixes two faults.  First, mdev, the result of
> kzalloc, was never freed.  Second, on failure of ioremap, 0 was returned.
> This has been replaced by -EBUSY, which was the failure value for the call
> to request_mem_region, with which the call to ioremap has been combined.
> 
> The warning message on failure of ioremap is dropped, because
> devm_request_and_ioremap already gives such messages on failure.
> 
> Finally, the initial call to platform_get_resource is moved closer to the
> call to devm_request_and_ioremap, which takes care of checking whether its
> result is NULL, implying that a test on the result of this call to
> platform_get_resource is not needed.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Looks good. Greg, please pull both patches into your tree.
Thank you.

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

-- 
	Evgeniy Polyakov
