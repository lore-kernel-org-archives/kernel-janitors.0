From: walter harms <wharms@bfs.de>
Date: Thu, 18 Jan 2018 10:50:30 +0000
Subject: Re: [PATCH] platform/x86: dell-smbios: Fix error handling in build_tokens_sysfs()
Message-Id: <5A607BF6.6090800@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118104503.GA30055@mwanda>
In-Reply-To: <20180118104503.GA30055@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 18.01.2018 11:45, schrieb Dan Carpenter:
> We're freeing "value_name" which is NULL, so that's a no-op, instead of
> "location_name" and then we don't free the first zero-th elements of
> token_location_attrs[] and token_value_attrs[].
> 
> Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index 6a60db515bda..d8a21c7ba594 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -512,7 +512,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
>  		continue;
>  
>  loop_fail_create_value:
> -		kfree(value_name);
> +		kfree(location_name);
>  		goto out_unwind_strings;
>  	}
>  	smbios_attribute_group.attrs = token_attrs;
> @@ -523,7 +523,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
>  	return 0;
>  
>  out_unwind_strings:
> -	for (i = i-1; i > 0; i--) {
> +	for (i = i-1; i >= 0; i--) {
>  		kfree(token_location_attrs[i].attr.name);
>  		kfree(token_value_attrs[i].attr.name);
>  	}

would you mind to reverse order here ?
you know programmers are terrible at couting backwards.


re,
 wh

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
