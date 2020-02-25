From: Rijo Thomas <Rijo-john.Thomas@amd.com>
Date: Tue, 25 Feb 2020 12:18:36 +0000
Subject: Re: [PATCH v2] tee: amdtee: fix memory leak in amdtee_open_session()
Message-Id: <80bbfd17-b1d3-31f5-a2d7-c2163dc4d874@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200224105139.b5nweo2guprmxteu@kili.mountain>
In-Reply-To: <20200224105139.b5nweo2guprmxteu@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 24/02/20 4:21 pm, Dan Carpenter wrote:
> On these error paths the "sess" variable isn't freed.  It's a refcounted
> pointer so we need to call kref_put().  I re-arranged the code a bit so
> the error case is always handled before the success case and the error
> paths are indented two tabs.
> 
> Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

Thanks,
Rijo

> ---
> v2: In the first version I changed these to return negative error codes,
>     but actually it's supposed to return success and the error code is
>     stored in arg->ret.
> 
>  drivers/tee/amdtee/core.c | 48 +++++++++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
> index 6370bb55f512..0026eb6f13ce 100644
> --- a/drivers/tee/amdtee/core.c
> +++ b/drivers/tee/amdtee/core.c
> @@ -212,6 +212,19 @@ static int copy_ta_binary(struct tee_context *ctx, void *ptr, void **ta,
>  	return rc;
>  }
>  
> +static void destroy_session(struct kref *ref)
> +{
> +	struct amdtee_session *sess = container_of(ref, struct amdtee_session,
> +						   refcount);
> +
> +	/* Unload the TA from TEE */
> +	handle_unload_ta(sess->ta_handle);
> +	mutex_lock(&session_list_mutex);
> +	list_del(&sess->list_node);
> +	mutex_unlock(&session_list_mutex);
> +	kfree(sess);
> +}
> +
>  int amdtee_open_session(struct tee_context *ctx,
>  			struct tee_ioctl_open_session_arg *arg,
>  			struct tee_param *param)
> @@ -236,15 +249,13 @@ int amdtee_open_session(struct tee_context *ctx,
>  
>  	/* Load the TA binary into TEE environment */
>  	handle_load_ta(ta, ta_size, arg);
> -	if (arg->ret = TEEC_SUCCESS) {
> -		mutex_lock(&session_list_mutex);
> -		sess = alloc_session(ctxdata, arg->session);
> -		mutex_unlock(&session_list_mutex);
> -	}
> -
>  	if (arg->ret != TEEC_SUCCESS)
>  		goto out;
>  
> +	mutex_lock(&session_list_mutex);
> +	sess = alloc_session(ctxdata, arg->session);
> +	mutex_unlock(&session_list_mutex);
> +
>  	if (!sess) {
>  		rc = -ENOMEM;
>  		goto out;
> @@ -259,40 +270,29 @@ int amdtee_open_session(struct tee_context *ctx,
>  
>  	if (i >= TEE_NUM_SESSIONS) {
>  		pr_err("reached maximum session count %d\n", TEE_NUM_SESSIONS);
> +		kref_put(&sess->refcount, destroy_session);
>  		rc = -ENOMEM;
>  		goto out;
>  	}
>  
>  	/* Open session with loaded TA */
>  	handle_open_session(arg, &session_info, param);
> -
> -	if (arg->ret = TEEC_SUCCESS) {
> -		sess->session_info[i] = session_info;
> -		set_session_id(sess->ta_handle, i, &arg->session);
> -	} else {
> +	if (arg->ret != TEEC_SUCCESS) {
>  		pr_err("open_session failed %d\n", arg->ret);
>  		spin_lock(&sess->lock);
>  		clear_bit(i, sess->sess_mask);
>  		spin_unlock(&sess->lock);
> +		kref_put(&sess->refcount, destroy_session);
> +		goto out;
>  	}
> +
> +	sess->session_info[i] = session_info;
> +	set_session_id(sess->ta_handle, i, &arg->session);
>  out:
>  	free_pages((u64)ta, get_order(ta_size));
>  	return rc;
>  }
>  
> -static void destroy_session(struct kref *ref)
> -{
> -	struct amdtee_session *sess = container_of(ref, struct amdtee_session,
> -						   refcount);
> -
> -	/* Unload the TA from TEE */
> -	handle_unload_ta(sess->ta_handle);
> -	mutex_lock(&session_list_mutex);
> -	list_del(&sess->list_node);
> -	mutex_unlock(&session_list_mutex);
> -	kfree(sess);
> -}
> -
>  int amdtee_close_session(struct tee_context *ctx, u32 session)
>  {
>  	struct amdtee_context_data *ctxdata = ctx->data;
> 
