From: Suman Anna <s-anna@ti.com>
Date: Mon, 11 Nov 2013 23:07:59 +0000
Subject: Re: [patch] mailbox/omap: make mbox->irq signed for error handling
Message-Id: <5281634F.2050607@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107074918.GG21844@elgon.mountain>
In-Reply-To: <20131107074918.GG21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Omar Ramirez Luna <omar.ramirez@copitl.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, tony@atomide.com


On 11/07/2013 01:49 AM, Dan Carpenter wrote:
> There is a bug in omap2_mbox_probe() where we try do:
>
> 		mbox->irq = platform_get_irq(pdev, info->irq_id);
> 		if (mbox->irq < 0) {
>
> The problem is that mbox->irq is unsigned so the error handling doesn't
> work.  I've changed it to a signed integer.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

LGTM, thanks for the fix.

regards
Suman
