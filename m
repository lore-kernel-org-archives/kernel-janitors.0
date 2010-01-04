From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Mon, 04 Jan 2010 11:09:35 +0000
Subject: Re: [Drbd-dev] [PATCH 2/5] drivers/block: Correct NULL test
Message-Id: <201001041209.35550.philipp.reisner@linbit.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912272226550.20548@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912272226550.20548@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org
Cc: Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org

Hi,

The patch titeled "drivers/block: Correct NULL test" is in the
git://git.drbd.org/linux-2.6-drbd.git for-jens tree and will
flow upstream from there.

-Phil

Full quote:
> From: Julia Lawall <julia@diku.dk>
> 
> Test the just-allocated value for NULL rather than some other value.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,y;
> statement S;
> @@
> 
> x = \(kmalloc\|kcalloc\|kzalloc\)(...);
> (
> if ((x) = NULL) S
> 
> if (
> -   y
> +   x
>        = NULL)
>  S
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/block/drbd/drbd_receiver.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/drivers/block/drbd/drbd_receiver.c
>  b/drivers/block/drbd/drbd_receiver.c ---
>  a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -3944,7 +3944,7 @@ static int drbd_do_auth(struct drbd_conf
>  	}
> 
>  	right_response = kmalloc(resp_size, GFP_NOIO);
> -	if (response = NULL) {
> +	if (right_response = NULL) {
>  		dev_err(DEV, "kmalloc of right_response failed\n");
>  		rv = 0;
>  		goto fail;
