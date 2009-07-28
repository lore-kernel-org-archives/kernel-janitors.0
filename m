From: Paulo Marques <pmarques@grupopie.com>
Date: Tue, 28 Jul 2009 17:52:42 +0000
Subject: Re: [PATCH 6/12] drivers/platform/x86: Correct redundant test
Message-Id: <4A6F3AEA.7090102@grupopie.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907271813490.2682@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907271813490.2682@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jwoithe@physics.adelaide.edu.au, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> [...]
> ---
>  drivers/platform/x86/fujitsu-laptop.c          |    3 ---
>  1 files changed, 0 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 218b9a1..5306901 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -745,9 +745,6 @@ static int acpi_fujitsu_remove(struct acpi_device *device, int type)
>  
>  	fujitsu = acpi_driver_data(device);
>  
> -	if (!device || !acpi_driver_data(device))
> -		return -EINVAL;
> -

Shouldn't this still do a:

   if (!fujitsu)
     return -EINVAL;

to avoid dereferencing a NULL pointer below?

>  	fujitsu->acpi_handle = NULL;
>  
>  	return 0;

-- 
Paulo Marques - www.grupopie.com

"All I ask is a chance to prove that money can't make me happy."
