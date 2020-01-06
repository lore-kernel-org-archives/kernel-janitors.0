From: Guenter Roeck <linux@roeck-us.net>
Date: Mon, 06 Jan 2020 14:11:57 +0000
Subject: Re: [PATCH][next] usb: typec: ucsi: fix spelling mistake "connetor" -> "connector"
Message-Id: <99d45a1f-69f3-083b-35bd-7e09eea4d64f@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200106111124.28100-1-colin.king@canonical.com>
In-Reply-To: <20200106111124.28100-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 1/6/20 3:11 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/ucsi/ucsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 466bd8afceea..1b1e36178317 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -669,7 +669,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>   	struct ucsi_connector *con = &ucsi->connector[num - 1];
>   
>   	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
> -		dev_dbg(ucsi->dev, "Bogus connetor change event\n");
> +		dev_dbg(ucsi->dev, "Bogus connector change event\n");
>   		return;
>   	}
>   
> 
