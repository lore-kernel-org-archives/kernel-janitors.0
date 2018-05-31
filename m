From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Date: Thu, 31 May 2018 06:44:39 +0000
Subject: Re: [PATCH] ALSA: xen-front: fix a loop timeout
Message-Id: <ff39a5c2-545a-3017-71c4-d8dca73e8129@epam.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180531062507.ajgs4splaboukp2v@kili.mountain>
In-Reply-To: <20180531062507.ajgs4splaboukp2v@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On 05/31/2018 09:25 AM, Dan Carpenter wrote:
> We want the loop to exit when "to" is set to zero, but in the current
> code it's set to -1.  Also I tweaked the indenting so it doesn't look
> like we're passing "--to" to xenbus_read_unsigned().
>
> Fixes: cc3196ae197c ("ALSA: xen-front: Introduce Xen para-virtualized sound frontend driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/sound/xen/xen_snd_front.c b/sound/xen/xen_snd_front.c
> index c18973a9bc9b..b089b13b5160 100644
> --- a/sound/xen/xen_snd_front.c
> +++ b/sound/xen/xen_snd_front.c
> @@ -334,7 +334,7 @@ static int xen_drv_remove(struct xenbus_device *dev)
>   	 */
>   	while ((xenbus_read_unsigned(front_info->xb_dev->otherend, "state",
>   				     XenbusStateUnknown) != XenbusStateInitWait) &&
> -				     to--)
> +	       --to)
>   		msleep(10);
>   
>   	if (!to) {
Thank you for your patch,
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
