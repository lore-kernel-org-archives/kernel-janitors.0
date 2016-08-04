From: "Bounine, Alexandre" <Alexandre.Bounine@idt.com>
Date: Thu, 04 Aug 2016 19:00:42 +0000
Subject: RE: [patch] rapidio: dereferencing an error pointer
Message-Id: <8D983423E7EDF846BB3056827B8CC5D15CFFD41D@corpmail1.na.ads.idt.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160804052606.GF775@mwanda>
In-Reply-To: <20160804052606.GF775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, August 04, 2016 1:26 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Subject: [patch] rapidio: dereferencing an error pointer
> 
> If riocm_ch_alloc() fails then we end up dereferencing the error
> pointer.
>

Probably simply setting "new_ch = NULL" on the error path would fix the
issue, but making code simpler also helps. Thank you.

Acked.
 
> The problem is that we're not unwinding in the reverse order from how
> we allocate things so it gets confusing.  I've changed this around so
> now "ch" is NULL when we are done with it after we call
> riocm_put_channel().  That way we can check if it's NULL and avoid
> calling riocm_put_channel() on it twice.
> 
> I renamed err_nodev to err_put_new_ch so that it better reflects what
> the goto does.
> 
> Then because we had flipping things around, it means we don't neeed to
> initialize the pointers to NULL and we can remove an if statement and
> pull things in an indent level.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/rapidio/rio_cm.c b/drivers/rapidio/rio_cm.c
> index cecc15a..3fa17ac 100644
> --- a/drivers/rapidio/rio_cm.c
> +++ b/drivers/rapidio/rio_cm.c
> @@ -1080,8 +1080,8 @@ static int riocm_send_ack(struct rio_channel *ch)
>  static struct rio_channel *riocm_ch_accept(u16 ch_id, u16 *new_ch_id,
>  					   long timeout)
>  {
> -	struct rio_channel *ch = NULL;
> -	struct rio_channel *new_ch = NULL;
> +	struct rio_channel *ch;
> +	struct rio_channel *new_ch;
>  	struct conn_req *req;
>  	struct cm_peer *peer;
>  	int found = 0;
> @@ -1155,6 +1155,7 @@ static struct rio_channel *riocm_ch_accept(u16
> ch_id, u16 *new_ch_id,
> 
>  	spin_unlock_bh(&ch->lock);
>  	riocm_put_channel(ch);
> +	ch = NULL;
>  	kfree(req);
> 
>  	down_read(&rdev_sem);
> @@ -1172,7 +1173,7 @@ static struct rio_channel *riocm_ch_accept(u16
> ch_id, u16 *new_ch_id,
>  	if (!found) {
>  		/* If peer device object not found, simply ignore the
> request */
>  		err = -ENODEV;
> -		goto err_nodev;
> +		goto err_put_new_ch;
>  	}
> 
>  	new_ch->rdev = peer->rdev;
> @@ -1184,15 +1185,16 @@ static struct rio_channel *riocm_ch_accept(u16
> ch_id, u16 *new_ch_id,
> 
>  	*new_ch_id = new_ch->id;
>  	return new_ch;
> +
> +err_put_new_ch:
> +	spin_lock_bh(&idr_lock);
> +	idr_remove(&ch_idr, new_ch->id);
> +	spin_unlock_bh(&idr_lock);
> +	riocm_put_channel(new_ch);
> +
>  err_put:
> -	riocm_put_channel(ch);
> -err_nodev:
> -	if (new_ch) {
> -		spin_lock_bh(&idr_lock);
> -		idr_remove(&ch_idr, new_ch->id);
> -		spin_unlock_bh(&idr_lock);
> -		riocm_put_channel(new_ch);
> -	}
> +	if (ch)
> +		riocm_put_channel(ch);
>  	*new_ch_id = 0;
>  	return ERR_PTR(err);
>  }
