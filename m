From: Joe Perches <joe@perches.com>
Date: Sat, 17 Oct 2020 00:11:44 +0000
Subject: Re: [PATCH] staging: wfx: make a const array static, makes object smaller
Message-Id: <09cd7e609324d460afdf14829baf3c2f1a9cb9cd.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201016223303.687278-1-colin.king@canonical.com>
In-Reply-To: <20201016223303.687278-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2020-10-16 at 23:33 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const array filter_ies on the stack but instead
> make it static. Makes the object code smaller by 261 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   21674	   3166	    448	  25288	   62c8	drivers/staging/wfx/sta.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   21349	   3230	    448	  25027	   61c3	drivers/staging/wfx/sta.o

Thanks.

It's odd to me it's so large a change as it's only
24 bytes of initialization. (3 entries, each 8 bytes)

This line in the same function:

		hif_set_beacon_filter_table(wvif, 3, filter_ies);

might as well use ARRAY_SIZE(filter_ies) instead of 3
