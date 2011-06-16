From: Dan Carpenter <error27@gmail.com>
Date: Thu, 16 Jun 2011 19:18:58 +0000
Subject: Re: [patch] ACPI: use after free in acpi_battery_add()
Message-Id: <BANLkTinOEVR=8kqpyee2VoKh12tWOhVgaQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110329031210.GA9856@bicker>
In-Reply-To: <20110329031210.GA9856@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org, kyle@redhat.com

It seems like this patch was missed.

regards,
dan carpenter

On 3/29/11, Dan Carpenter <error27@gmail.com> wrote:
> "battery" was dereferenced on the error path here.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index fcc13ac..cfc7a5b 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -988,6 +988,7 @@ static int acpi_battery_add(struct acpi_device *device)
>  		acpi_battery_remove_fs(device);
>  #endif
>  		kfree(battery);
> +		return result;
>  	}
>
>  	battery->pm_nb.notifier_call = battery_notify;
>
