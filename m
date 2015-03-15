From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Sun, 15 Mar 2015 11:01:54 +0000
Subject: Re: [patch] rtc: at91rm9200: double locking bug in at91_rtc_interrupt()
Message-Id: <20150315120154.30855516@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150315104837.GC20691@mwanda>
In-Reply-To: <20150315104837.GC20691@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Sun, 15 Mar 2015 13:48:37 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a typo here so we deadlock.
> 
> Fixes: dd1f1f391dd7 ('rtc: at91rm9200: rework wakeup and interrupt handling')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks for fixing this bug.

Alessandro, Nicolas, could you agree on who is taking this fix for
the next -rc cycle ?

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
