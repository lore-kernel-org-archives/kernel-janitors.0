From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 08 Nov 2019 14:26:57 +0000
Subject: Re: [PATCH][V2] ata: pata_artop: make arrays static const, makes object smaller
Message-Id: <5dae76cc-e71d-d295-7947-b7005a7f1af3@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191006142956.23360-1-colin.king@canonical.com>
In-Reply-To: <20191006142956.23360-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-ide@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/6/19 8:29 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const arrays on the stack but instead make them
> static. Makes the object code smaller by 292 bytes.
> 
> Before:
>     text	   data	    bss	    dec	    hex	filename
>     6988	   3132	    128	  10248	   2808	drivers/ata/pata_artop.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>     6536	   3292	    128	   9956	   26e4	drivers/ata/pata_artop.o
> 
> (gcc version 9.2.1, amd64)

Applied, thanks.

-- 
Jens Axboe
