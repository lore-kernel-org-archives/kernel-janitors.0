From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 05 Jan 2010 10:28:57 +0000
Subject: Re: [PATCH 09/10] w1: add __init/__exit macros to drivers/w1/w1.c
Message-Id: <alpine.LNX.2.00.1001051128080.2277@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261471082-24233-1-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1261471082-24233-1-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <peterhuewe@gmx.de>
Cc: kernel-janitors@vger.kernel.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Kay Sievers <kay.sievers@vrfy.org>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org

On Tue, 22 Dec 2009, peterhuewe@gmx.de wrote:

> From: Peter Huewe <peterhuewe@gmx.de>
> 
> Trivial patch which adds the __init/__exit macros to the module_init/
> module_exit functions of
> 
> drivers/w1/w1.c
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
>  drivers/w1/w1.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index acc7e3b..ad5897d 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -986,7 +986,7 @@ int w1_process(void *data)
>  	return 0;
>  }
>  
> -static int w1_init(void)
> +static int __init w1_init(void)
>  {
>  	int retval;
>  
> @@ -1034,7 +1034,7 @@ err_out_exit_init:
>  	return retval;
>  }
>  
> -static void w1_fini(void)
> +static void __exit w1_fini(void)
>  {
>  	struct w1_master *dev;
>  

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
