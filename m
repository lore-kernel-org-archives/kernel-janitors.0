From: Corey Minyard <minyard@acm.org>
Date: Tue, 17 Oct 2017 20:47:34 +0000
Subject: Re: [PATCH][ipmi-next] ipmi_si: fix memory leak on new_smi
Message-Id: <1fe921ca-73d9-6ccf-d7dc-8174340369ae@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171017155452.24807-1-colin.king@canonical.com>
In-Reply-To: <20171017155452.24807-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/17/2017 10:54 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The error exit path omits kfree'ing the allocated new_smi, causing a memory
> leak.  Fix this by kfree'ing new_smi.

Thanks, queued for the next release.

-corey

> Detected by CoverityScan, CID#14582571 ("Resource Leak")
>
> Fixes: 7e030d6dff71 ("ipmi: Prefer ACPI system interfaces over SMBIOS ones")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/char/ipmi/ipmi_si_intf.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 55e0c42bee4d..4c16af64f73a 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2004,6 +2004,7 @@ int ipmi_si_add_smi(struct si_sm_io *io)
>   				 ipmi_addr_src_to_str(new_smi->io.addr_source),
>   				 si_to_str[new_smi->io.si_type]);
>   			rv = -EBUSY;
> +			kfree(new_smi);
>   			goto out_err;
>   		}
>   	}


