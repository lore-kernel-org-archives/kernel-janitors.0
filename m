From: Marcel Holtmann <marcel@holtmann.org>
Date: Sat, 06 Jan 2018 16:43:52 +0000
Subject: Re: [PATCH] Bluetooth: btintel: make array 'param' static, shrinks object size
Message-Id: <1B85A899-6FB7-4BDB-B123-848C14BDFE54@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180106162328.18625-1-colin.king@canonical.com>
In-Reply-To: <20180106162328.18625-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> Don't populate the const read-only array 'param' on the stack but instead
> make it static. Makes the object code smaller by nearly 20 bytes:
> 
> Before:
>   text	   data	    bss	    dec	    hex	filename
>  11605	   2629	     64	  14298	   37da	linux/drivers/bluetooth/btintel.o
> 
> After:
>   text	   data	    bss	    dec	    hex	filename
>  11531	   2685	     64	  14280	   37c8	linux/drivers/bluetooth/btintel.o
> 
> (gcc version 7.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/bluetooth/btintel.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

