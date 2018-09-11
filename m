From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 11 Sep 2018 14:00:31 +0000
Subject: Re: [PATCH] mfd: arizona: make array mclk_name static, shrinks object size
Message-Id: <20180911140031.GT4185@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180904141553.28000-1-colin.king@canonical.com>
In-Reply-To: <20180904141553.28000-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 04 Sep 2018, Colin King wrote:

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
>  drivers/mfd/arizona-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
