From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 19 Aug 2011 12:08:00 +0000
Subject: Re: [PATCH v3] drivers/mtd/nand/bcm_umi_nand.c: clean up error
Message-Id: <1313755685.6607.53.camel@sauron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312964054-25266-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312964054-25266-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Scott Branden <sbranden@broadcom.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Jiandong Zheng <jdzheng@broadcom.com>, David Woodhouse <dwmw2@infradead.org>

On Wed, 2011-08-10 at 10:14 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Convert error handling code to use gotos.  At the same time, this adds
> calls to kfree and iounmap in a few cases where they were overlooked.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk> 

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy

