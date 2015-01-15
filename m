From: Dave Young <dyoung@redhat.com>
Date: Thu, 15 Jan 2015 09:57:09 +0000
Subject: Re: [patch] x86: ksysfs: small memory leak on error
Message-Id: <20150115095709.GB15197@darkstar.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150115082134.GA2130@mwanda>
In-Reply-To: <20150115082134.GA2130@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 01/15/15 at 11:21am, Dan Carpenter wrote:
> The "> 0" should be ">= 0" so that we free the last entry.
> 

ditto as the another patch, i=0 case has been handled in previous code so it
is not necessary to do it under goto label.

> Fixes: 5039e316dde3 ('x86: Export x86 boot_params to sysfs')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kernel/ksysfs.c b/arch/x86/kernel/ksysfs.c
> index c2bedae..b0cfb64 100644
> --- a/arch/x86/kernel/ksysfs.c
> +++ b/arch/x86/kernel/ksysfs.c
> @@ -299,7 +299,7 @@ static int __init create_setup_data_nodes(struct kobject *parent)
>  	return 0;
>  
>  out_clean_nodes:
> -	for (j = i - 1; j > 0; j--)
> +	for (j = i - 1; j >= 0; j--)
>  		cleanup_setup_data_node(*(kobjp + j));
>  	kfree(kobjp);
>  out_setup_data_kobj:
