From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 06 Sep 2019 17:50:39 +0000
Subject: Re: [PATCH] staging: rtl8188eu: make two arrays static const, makes object smaller
Message-Id: <9f1e1550-2a75-abc3-4d87-a0c1d1ae1ccb@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906173949.21860-1-colin.king@canonical.com>
In-Reply-To: <20190906173949.21860-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/6/19 12:39 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate two arrays on the stack but instead make them
> static const. Makes the object code smaller by 49 bytes.
> 
> Before:
>     text	   data	    bss	    dec	    hex	filename
>    26821	   5616	      0	  32437	   7eb5	rtl8188eu/core/rtw_ieee80211.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>    26612	   5776	      0	  32388	   7e84	rtl8188eu/core/rtw_ieee80211.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry
