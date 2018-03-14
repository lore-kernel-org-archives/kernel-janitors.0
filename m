From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Wed, 14 Mar 2018 11:44:36 +0000
Subject: Re: [PATCH][ACPI-next] ACPI: battery: make function __battery_hook_unregister static
Message-Id: <1655597.UWgU0oY7TV@aspire.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180223163255.3899-1-colin.king@canonical.com>
In-Reply-To: <20180223163255.3899-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday, February 23, 2018 5:32:55 PM CET Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function __battery_hook_unregister is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/acpi/battery.c:654:6: warning: symbol '__battery_hook_unregister'
> was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/acpi/battery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index cfdef4c1d097..b4580b2e8706 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -651,7 +651,7 @@ static LIST_HEAD(acpi_battery_list);
>  static LIST_HEAD(battery_hook_list);
>  static DEFINE_MUTEX(hook_mutex);
>  
> -void __battery_hook_unregister(struct acpi_battery_hook *hook, int lock)
> +static void __battery_hook_unregister(struct acpi_battery_hook *hook, int lock)
>  {
>  	struct acpi_battery *battery;
>  	/*
> 

Applied, thanks!


