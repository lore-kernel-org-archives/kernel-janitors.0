From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 15 Aug 2019 08:38:40 +0000
Subject: Re: [PATCH] drm/vmwgfx: Fix double free in vmw_recv_msg()
Message-Id: <08f19935-97fe-4c8b-ca7b-707586ed89a1@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815083050.GC27238@mwanda>
In-Reply-To: <20190815083050.GC27238@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 15/08/2019 09:30, Dan Carpenter wrote:
> We recently added a kfree() after the end of the loop:
> 
> 	if (retries = RETRIES) {
> 		kfree(reply);
> 		return -EINVAL;
> 	}
> 
> There are two problems.  First the test is wrong and because retries
> equals RETRIES if we succeed on the last iteration through the loop.
> Second if we fail on the last iteration through the loop then the kfree
> is a double free.
> 
> When you're reading this code, please note the break statement at the
> end of the while loop.  This patch changes the loop so that if it's not
> successful then "reply" is NULL and we can test for that afterward.
> 
> Fixes: 6b7c3b86f0b6 ("drm/vmwgfx: fix memory leak when too many retries have occurred")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> index 59e9d05ab928..0af048d1a815 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> @@ -353,7 +353,7 @@ static int vmw_recv_msg(struct rpc_channel *channel, void **msg,
>  				     !!(HIGH_WORD(ecx) & MESSAGE_STATUS_HB));
>  		if ((HIGH_WORD(ebx) & MESSAGE_STATUS_SUCCESS) = 0) {
>  			kfree(reply);
> -
> +			reply = NULL;
>  			if ((HIGH_WORD(ebx) & MESSAGE_STATUS_CPT) != 0) {
>  				/* A checkpoint occurred. Retry. */
>  				continue;
> @@ -377,7 +377,7 @@ static int vmw_recv_msg(struct rpc_channel *channel, void **msg,
>  
>  		if ((HIGH_WORD(ecx) & MESSAGE_STATUS_SUCCESS) = 0) {
>  			kfree(reply);
> -
> +			reply = NULL;
>  			if ((HIGH_WORD(ecx) & MESSAGE_STATUS_CPT) != 0) {
>  				/* A checkpoint occurred. Retry. */
>  				continue;
> @@ -389,10 +389,8 @@ static int vmw_recv_msg(struct rpc_channel *channel, void **msg,
>  		break;
>  	}
>  
> -	if (retries = RETRIES) {
> -		kfree(reply);
> +	if (!reply)
>  		return -EINVAL;
> -	}
>  
>  	*msg_len = reply_len;
>  	*msg     = reply;
> 

Dan, Thanks for fixing up my mistake.
