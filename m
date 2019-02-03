From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 03 Feb 2019 11:31:37 +0000
Subject: Re: [PATCH] staging: rtl8192u: fix a null pointer dereference on a null dev pointer
Message-Id: <20190203113137.GB2563@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190202225627.27116-1-colin.king@canonical.com>
In-Reply-To: <20190202225627.27116-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 02, 2019 at 10:56:27PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an earlier null check on pointer dev which implies it may be null,
> however the assignment of pointer pref and the call to free_ieee82011 on
> a null dev can cause null pointer dereference errors.  Fix this by moving
> the assignment of priv and the the call to free_ieee80211 into the block of
> code that performs the null dev sanity check.
> 
> Detected by CoverityScan, CID#143078 ("Dereference after null check")
> 
> Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index 0ac0bbf7d923..4741a29326ea 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -4955,9 +4955,10 @@ static void rtl8192_cancel_deferred_work(struct r8192_priv *priv)
>  static void rtl8192_usb_disconnect(struct usb_interface *intf)
>  {
>  	struct net_device *dev = usb_get_intfdata(intf);
> -	struct r8192_priv *priv = ieee80211_priv(dev);
>  
>  	if (dev) {
> +		struct r8192_priv *priv = ieee80211_priv(dev);

"dev" can't actually be NULL.  Look how we call usb_set_intfdata() in
probe().  It's better to remove the check instead.

regards,
dan carpenter
