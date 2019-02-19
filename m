From: David Miller <davem@davemloft.net>
Date: Tue, 19 Feb 2019 22:15:57 +0000
Subject: Re: [PATCH][next] ptp_qoriq: don't pass a large struct by value but instead pass it by reference
Message-Id: <20190219.141557.284906726764572414.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219142120.11347-1-colin.king@canonical.com>
In-Reply-To: <20190219142120.11347-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, claudiu.manoil@nxp.com, yangbo.lu@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 14:21:20 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Passing the struct ptp_clock_info caps by parameter is passing over 130 bytes
> of data by value on the stack. Optimize this by passing it by reference instead.
> Also shinks the object code size:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   12596	   2160	     64	  14820	   39e4	drivers/ptp/ptp_qoriq.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   12567	   2160	     64	  14791	   39c7	drivers/ptp/ptp_qoriq.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good, applied, thanks.
