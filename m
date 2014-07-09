From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jul 2014 09:38:08 +0000
Subject: Re: [PATCH 1/2] staging: silicom: checkpatch fixes
Message-Id: <20140709093808.GU25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1972083.WZLDx2N35Z@mayhem>
In-Reply-To: <1972083.WZLDx2N35Z@mayhem>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davide Gianforte <davide@gengisdave.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

The patch does too many things, break it up into one type of fix per
patch.

On Tue, Jul 01, 2014 at 02:24:36PM +0200, Davide Gianforte wrote:
> Chechpatch.pl cleanup
> 
> There are still some warnings, most of them are lines over 80 chars
> (mainly a semicolon or closing parenthesis).
> 
> Where not specified, I defaulted printk with no log level into pr_debug

No.  You can't just use pr_debug for everything.  Also some of them are
not whole line prints so the pr_debug() will put extra info in the
middle of the lines.

Write a hello_world.ko kernel module and play with the printk until you
understand what I mean.

regards,
dan carpenter

