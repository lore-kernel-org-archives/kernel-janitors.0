From: Harvey Harrison <harvey.harrison@gmail.com>
Date: Wed, 05 Mar 2008 06:28:18 +0000
Subject: Re: [PATCH 3/11] /drivers/char/ip2/ip2main.c replaced
Message-Id: <1204698498.17484.4.camel@brick>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47CE3466.5050306@watson.wustl.edu>
In-Reply-To: <47CE3466.5050306@watson.wustl.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Schindler <jkschind@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, 2008-03-04 at 23:49 -0600, Jon Schindler wrote:
> Replaced init_module and cleanup_module with static functions and module_init/module_exit.
> 

trivial comments

>  #ifdef MODULE
> -int
> -init_module(void)
> +static int __init
> +ip2_init_module(void)
>  {

+static int __init ip2_init_module(void)

> ****************************************************************/
>  #ifdef MODULE
> -void
> -cleanup_module(void)
> +void __exit
> +ip2_cleanup_module(void)
>  {

+void __exit ip2_cleanup_module(void)

Cheers,

Harvey

