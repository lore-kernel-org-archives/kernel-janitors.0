From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 27 Sep 2018 10:27:17 +0000
Subject: Re: [PATCH] Bluetooth: btrtl: Make array extension_sig static, shrinks object size
Message-Id: <B3D4C07F-E8A1-44B1-A221-FEE87F69C485@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180926083208.13632-1-colin.king@canonical.com>
In-Reply-To: <20180926083208.13632-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> Don't populate the array extension_sig on the stack but instead make it
> static. Makes the object code smaller by 75 bytes:
> 
> Before:
>   text	   data	    bss	    dec	    hex	filename
>  14325	   4920	      0	  19245	   4b2d	drivers/bluetooth/btrtl.o
> 
> After:
>   text	   data	    bss	    dec	    hex	filename
>  14186	   4984	      0	  19170	   4ae2	drivers/bluetooth/btrtl.o
> 
> (gcc version 8.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/bluetooth/btrtl.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
