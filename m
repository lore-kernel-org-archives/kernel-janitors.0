From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Date: Tue, 07 Apr 2015 13:22:09 +0000
Subject: Re: [patch] ima: cleanup ima_init_policy() a little
Message-Id: <1428412929.6005.4.camel@dhcp-9-2-203-236.watson.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150407092211.GA24937@mwanda>
In-Reply-To: <20150407092211.GA24937@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2015-04-07 at 12:22 +0300, Dan Carpenter wrote: 
> It's a bit easier to read this if we split it up into two for loops.

Agreed

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com> 

Mimi

> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index d1eefb9..e86b58d 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -338,16 +338,12 @@ void __init ima_init_policy(void)
>  	appraise_entries = ima_use_appraise_tcb ?
>  			 ARRAY_SIZE(default_appraise_rules) : 0;
> 
> -	for (i = 0; i < measure_entries + appraise_entries; i++) {
> -		if (i < measure_entries)
> -			list_add_tail(&default_rules[i].list,
> -				      &ima_default_rules);
> -		else {
> -			int j = i - measure_entries;
> -
> -			list_add_tail(&default_appraise_rules[j].list,
> -				      &ima_default_rules);
> -		}
> +	for (i = 0; i < measure_entries; i++)
> +		list_add_tail(&default_rules[i].list, &ima_default_rules);
> +
> +	for (i = 0; i < appraise_entries; i++) {
> +		list_add_tail(&default_appraise_rules[i].list,
> +			      &ima_default_rules);
>  	}
> 
>  	ima_rules = &ima_default_rules;


