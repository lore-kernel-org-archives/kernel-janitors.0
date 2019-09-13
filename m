From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 13 Sep 2019 13:45:05 +0000
Subject: Re: [PATCH] bcma: make arrays pwr_info_offset and sprom_sizes static const, shrinks object size
Message-Id: <20190913134505.E0AC7601C3@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905162049.14333-1-colin.king@canonical.com>
In-Reply-To: <20190905162049.14333-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Arrays pwr_info_offset and sprom_sizes can be make static const rather
> than populating them on the stack. Shrinks object size by 236 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   11300	   1320	     64	  12684	   318c	drivers/bcma/sprom.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   10904	   1480	     64	  12448	   30a0	drivers/bcma/sprom.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

c57391f41572 bcma: make arrays pwr_info_offset and sprom_sizes static const, shrinks object size

-- 
https://patchwork.kernel.org/patch/11133647/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
