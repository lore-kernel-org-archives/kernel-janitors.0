From: Jes Sorensen <jes.sorensen@gmail.com>
Date: Tue, 08 Oct 2019 16:26:15 +0000
Subject: Re: [PATCH] rtl8xxxu: make arrays static, makes object smaller
Message-Id: <87e99b3b-6b1d-4eeb-f08f-00cfff5e3b2b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007135313.8443-1-colin.king@canonical.com>
In-Reply-To: <20191007135313.8443-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/7/19 9:53 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const arrays on the stack but instead make them
> static. Makes the object code smaller by 60 bytes.
> 
> Before:
>     text	   data	    bss	    dec	    hex	filename
>    15133	   8768	      0	  23901	   5d5d	realtek/rtl8xxxu/rtl8xxxu_8192e.o
>    15209	   6392	      0	  21601	   5461	realtek/rtl8xxxu/rtl8xxxu_8723b.o
>   103254	  31202	    576	 135032	  20f78	realtek/rtl8xxxu/rtl8xxxu_core.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>    14861	   9024	      0	  23885	   5d4d	realtek/rtl8xxxu/rtl8xxxu_8192e.o
>    14953	   6616	      0	  21569	   5441	realtek/rtl8xxxu/rtl8xxxu_8723b.o
>   102986	  31458	    576	 135020	  20f6c	realtek/rtl8xxxu/rtl8xxxu_core.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks fine to me!

Assume you mean x86_64 since there's no such thing as an amd64 
architecture :)

Cheers,
Jes
