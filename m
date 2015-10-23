From: Ashwin Chaugule <ashwin.chaugule@linaro.org>
Date: Fri, 23 Oct 2015 08:45:09 +0000
Subject: Re: [patch] ACPI/CPPC: signedness bug in register_pcc_channel()
Message-Id: <CAJ5Y-ebKF1Au2C9Q3vyvmugDEomfqhO89KAgsUrph4sgxT_t9w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151022195259.GC24439@mwanda>
In-Reply-To: <20151022195259.GC24439@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux acpi <linux-acpi@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 22 October 2015 at 15:52, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The "pcc_subspace_idx" is -1 if it hasn't been initialized yet.  We need
> it to be signed.
>
> Fixes: 337aadff8e45 ('ACPI: Introduce CPU performance controls using CPPC')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index 0bbf84b..2ed5516 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c
> @@ -302,7 +302,7 @@ err_ret:
>  }
>  EXPORT_SYMBOL_GPL(acpi_get_psd_map);
>
> -static int register_pcc_channel(unsigned pcc_subspace_idx)
> +static int register_pcc_channel(int pcc_subspace_idx)
>  {
>         struct acpi_pcct_subspace *cppc_ss;
>         unsigned int len;

Acked-by: Ashwin Chaugule <ashwin.chaugule@linaro.org>

Thanks,
Ashwin.
