From: David Miller <davem@davemloft.net>
Date: Sat, 07 Sep 2019 16:02:43 +0000
Subject: Re: [PATCH] be2net: make two arrays static const, makes object smaller
Message-Id: <20190907.180243.1465656624015319439.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906111943.5285-1-colin.king@canonical.com>
In-Reply-To: <20190906111943.5285-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: sathya.perla@broadcom.com, ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com, somnath.kotur@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  6 Sep 2019 12:19:43 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the arrays on the stack but instead make them
> static const. Makes the object code smaller by 281 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   87553	   5672	      0	  93225	  16c29	benet/be_cmds.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   87112	   5832	      0	  92944	  16b10	benet/be_cmds.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
