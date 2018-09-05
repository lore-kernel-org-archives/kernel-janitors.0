From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Wed, 05 Sep 2018 09:15:04 +0000
Subject: Re: [PATCH] mfd: arizona: make array mclk_name static, shrinks object size
Message-Id: <20180905091504.GB1653@imbe.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180904141553.28000-1-colin.king@canonical.com>
In-Reply-To: <20180904141553.28000-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Lee Jones <lee.jones@linaro.org>, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 04, 2018 at 03:15:53PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array mclk_name on the stack but instead make it
> static. Makes the object code smaller by 23 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   38050	  11604	     64	  49718	   c236	linux/drivers/mfd/arizona-core.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   38027	  11604	     64	  49695	   c21f	linux/drivers/mfd/arizona-core.o
> 
> (gcc version 8.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
