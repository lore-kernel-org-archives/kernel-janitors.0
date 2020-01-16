From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 16 Jan 2020 20:37:16 +0000
Subject: Re: [PATCH][next] driver core: platform: fix u32 greater or equal to zero comparison
Message-Id: <CAJZ5v0hpn2mdp88B46xaaVPkHSPESadJd3A4ZwijHAW5nOidwg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200116175758.88396-1-colin.king@canonical.com>
In-Reply-To: <20200116175758.88396-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Simon Schwartz <kern.simon@theschwartz.xyz>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 16, 2020 at 6:58 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the check that a u32 variable i is >= 0 is always true because
> the unsigned variable will never be negative, causing the loop to run
> forever.  Fix this by changing the pre-decrement check to a zero check on
> i followed by a decrement of i.
>
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 39cc539f90d0 ("driver core: platform: Prevent resouce overflow from causing infinite loops")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/base/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 864b53b3d598..7fa654f1288b 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -571,7 +571,7 @@ int platform_device_add(struct platform_device *pdev)
>                 pdev->id = PLATFORM_DEVID_AUTO;
>         }
>
> -       while (--i >= 0) {
> +       while (i--) {
>                 struct resource *r = &pdev->resource[i];
>                 if (r->parent)
>                         release_resource(r);
> --
> 2.24.0
>
