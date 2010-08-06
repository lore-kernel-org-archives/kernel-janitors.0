From: Dan Carpenter <error27@gmail.com>
Date: Fri, 06 Aug 2010 07:40:49 +0000
Subject: Re: [patch] input: cy8ctmg100_ts: signedness bug
Message-Id: <20100806074049.GQ9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806063006.GM9031@bicker> <20100806064609.GA27764@core.coreip.homeip.net>
In-Reply-To: <20100806064609.GA27764@core.coreip.homeip.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alan Cox <alan@linux.intel.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 05, 2010 at 11:46:09PM -0700, Dmitry Torokhov wrote:
> 
> Thanks Dan. It looks like cy8ctmg110_write_regs has siilar issue. Do you
> thiks the following will work?
> 
> Thanks.
> 

Ah right.  That should be signed as well.  Thanks.

regards,
dan carpenter


