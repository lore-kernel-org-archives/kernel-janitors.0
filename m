From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Wed, 29 Oct 2014 18:38:53 +0000
Subject: Re: [patch] mfd: wm8350: fix a printk
Message-Id: <20141029183853.GK23178@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141029161118.GG5290@mwanda>
In-Reply-To: <20141029161118.GG5290@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 29, 2014 at 07:11:18PM +0300, Dan Carpenter wrote:
> There is a precedence bug here because >> has higher precedence than &
> so we end up printing the wrong mode.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Looks like Joe already been you to the punch on this one:

https://lkml.org/lkml/2014/10/27/36

Although I don't really mind which one Lee applies :-) so:

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
