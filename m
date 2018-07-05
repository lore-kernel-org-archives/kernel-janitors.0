From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Thu, 05 Jul 2018 13:10:01 +0000
Subject: Re: [PATCH][next] usb: typec: fix dereference before null check on adev
Message-Id: <20180705131001.GC15989@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704123406.9496-1-colin.king@canonical.com>
In-Reply-To: <20180704123406.9496-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 04, 2018 at 01:34:06PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer adev is being dereferenced before it is being sanity
> checked with a null pointer check, hence it is possible for
> a null pointer dereference to occur.  Fix this by dereferencing
> adev only once it is null checked.
> 
> Detected by CoverityScan, CID#1471598 ("Dereference before null check")
> 
> Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/bus.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index 999d7904172a..95a2b10127db 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -51,7 +51,7 @@ static int typec_altmode_set_state(struct typec_altmode *adev, int state)
>  int typec_altmode_notify(struct typec_altmode *adev,
>  			 unsigned long conf, void *data)
>  {
> -	bool is_port = is_typec_port(adev->dev.parent);
> +	bool is_port;
>  	struct altmode *altmode;
>  	struct altmode *partner;
>  	int ret;
> @@ -64,6 +64,7 @@ int typec_altmode_notify(struct typec_altmode *adev,
>  	if (!altmode->partner)
>  		return -ENODEV;
>  
> +	is_port = is_typec_port(adev->dev.parent);
>  	partner = altmode->partner;
>  
>  	ret = typec_altmode_set_mux(is_port ? altmode : partner, (u8)conf);

Thanks,

-- 
heikki
