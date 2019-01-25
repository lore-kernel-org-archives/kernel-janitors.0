From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 25 Jan 2019 07:54:39 +0000
Subject: Re: [PATCH] Bluetooth: make hw_err static, reduces object code size
Message-Id: <6F6742C3-1D20-44F9-9EF6-DF6085069DA0@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190124172254.13186-1-colin.king@canonical.com>
In-Reply-To: <20190124172254.13186-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> Don't populate the const array hw_err on the stack but instead make
> it static. Makes the object code smaller by 45 bytes:
> 
> Before:
>   text	   data	    bss	    dec	    hex	filename
> 100880	  21090	   1088	 123058	  1e0b2	linux/net/bluetooth/hci_core.o
> 
> After:
>   text	   data	    bss	    dec	    hex	filename
> 100739	  21186	   1088	 123013	  1e085	linux/net/bluetooth/hci_core.o
> 
> (gcc version 8.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> net/bluetooth/hci_core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
