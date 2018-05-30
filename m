From: Al Stone <ahs3@redhat.com>
Date: Wed, 30 May 2018 17:59:45 +0000
Subject: Re: [PATCH][next] mailbox: PCC: check for negative count for parse failure checking
Message-Id: <0d780988-0e59-a3b7-a7c1-9e3f0d227412@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180530171429.3172-1-colin.king@canonical.com>
In-Reply-To: <20180530171429.3172-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/30/2018 11:14 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function acpi_table_parse_enties_array can potentially return a
> negative value if parsing fails. Currently the check on the return
> is not checking for errors, so fix this by adding a -ve check too.
> 
> Detected by CoverityScan, CID#1469477 ("Improper use of negative value")
> 
> Fixes: 8f8027c5f935 ("mailbox: PCC: erroneous error message when parsing ACPI PCCT")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mailbox/pcc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index fc3c237daef2..87d67922020d 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -461,7 +461,7 @@ static int __init acpi_pcc_probe(void)
>  	count = acpi_table_parse_entries_array(ACPI_SIG_PCCT,
>  			sizeof(struct acpi_table_pcct), proc,
>  			ACPI_PCCT_TYPE_RESERVED, MAX_PCC_SUBSPACES);
> -	if (count = 0 || count > MAX_PCC_SUBSPACES) {
> +	if (count <= 0 || count > MAX_PCC_SUBSPACES) {
>  		pr_warn("Invalid PCCT: %d PCC subspaces\n", count);
>  		return -EINVAL;
>  	}
> 

Yup, nice catch.  A little paranoid, but we like that in a kernel :).  Thanks.

Reviewed-by: Al Stone <ahs3@redhat.com>

-- 
ciao,
al
-----------------------------------
Al Stone
Software Engineer
Red Hat, Inc.
ahs3@redhat.com
-----------------------------------
