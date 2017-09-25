From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 25 Sep 2017 08:29:49 +0000
Subject: Re: iwlegacy: make const array static to shink object code size
Message-Id: <20170925082949.EF68E60719@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921225630.21916-1-colin.king@canonical.com>
In-Reply-To: <20170921225630.21916-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const array ac_to_fifo on the stack in an inlined
> function, instead make it static.  Makes the object code smaller
> by over 800 bytes:
> 
>    text	   data	    bss	    dec	    hex	filename
>  159029	  33154	   1216	 193399	  2f377	4965-mac.o
> 
>    text	   data	    bss	    dec	    hex	filename
>  158122	  33250	   1216	 192588	  2f04c	4965-mac.o
> 
> (gcc version 7.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>

Patch applied to wireless-drivers-next.git, thanks.

9b029e178ea1 iwlegacy: make const array static to shink object code size

-- 
https://patchwork.kernel.org/patch/9964889/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

