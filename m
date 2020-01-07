From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Tue, 07 Jan 2020 08:36:28 +0000
Subject: Re: [PATCH][next] usb: typec: ucsi: fix spelling mistake "connetor" -> "connector"
Message-Id: <20200107083628.GA7440@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200106111124.28100-1-colin.king@canonical.com>
In-Reply-To: <20200106111124.28100-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 06, 2020 at 11:11:24AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 466bd8afceea..1b1e36178317 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -669,7 +669,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>  	struct ucsi_connector *con = &ucsi->connector[num - 1];
>  
>  	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
> -		dev_dbg(ucsi->dev, "Bogus connetor change event\n");
> +		dev_dbg(ucsi->dev, "Bogus connector change event\n");
>  		return;
>  	}
>  
> -- 
> 2.24.0

-- 
heikki
