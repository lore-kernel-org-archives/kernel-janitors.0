From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Jul 2020 13:24:04 +0000
Subject: Re: [PATCH] ACPI: APEI: remove redundant assignment to variable rc
Message-Id: <CAJZ5v0gPLp2FdP15-g6G=RksmcqyF4v1a01=2jhoXj0P9ii0Tg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722170608.960983-1-colin.king@canonical.com>
In-Reply-To: <20200722170608.960983-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jul 22, 2020 at 7:06 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable rc is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/acpi/apei/hest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/apei/hest.c b/drivers/acpi/apei/hest.c
> index 953a2fae8b15..6e980fe16772 100644
> --- a/drivers/acpi/apei/hest.c
> +++ b/drivers/acpi/apei/hest.c
> @@ -227,7 +227,7 @@ __setup("hest_disable", setup_hest_disable);
>  void __init acpi_hest_init(void)
>  {
>         acpi_status status;
> -       int rc = -ENODEV;
> +       int rc;
>         unsigned int ghes_count = 0;
>
>         if (hest_disable) {
> --

Applied as 5.9 material, thanks!
