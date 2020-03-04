From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Wed, 04 Mar 2020 11:02:39 +0000
Subject: Re: [PATCH] ACPI: video: remove redundant assignments to variable result
Message-Id: <1811882.qudN6vFfLL@kreacher>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200229001243.113176-1-colin.king@canonical.com>
In-Reply-To: <20200229001243.113176-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Saturday, February 29, 2020 1:12:43 AM CET Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable result is being initialized with a value that is never
> read and it is being updated later with a new value. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/acpi/acpi_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 15c5b272e698..bc96457c9e25 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -943,7 +943,7 @@ acpi_video_init_brightness(struct acpi_video_device *device)
>  	int i, max_level = 0;
>  	unsigned long long level, level_old;
>  	struct acpi_video_device_brightness *br = NULL;
> -	int result = -EINVAL;
> +	int result;
>  
>  	result = acpi_video_get_levels(device->dev, &br, &max_level);
>  	if (result)
> 

Applied as 5.7 material, thanks!
