From: Kees Cook <keescook@chromium.org>
Date: Tue, 12 May 2020 18:58:23 +0000
Subject: Re: [PATCH][next] pstore/zone,blk: fix dereference of pointer before it has been null checked
Message-Id: <202005121158.4D49A98839@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512170719.221514-1-colin.king@canonical.com>
In-Reply-To: <20200512170719.221514-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, WeiXiong Liao <liaoweixiong@allwinnertech.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 12, 2020 at 06:07:19PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the assignment of ctx dereferences pointer 'record' before
> the pointer has been null checked. Fix this by only making this
> dereference after it has been null checked close to the point ctx
> is to be used.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: bb4ccd1e6f56 ("pstore/zone,blk: Add ftrace frontend support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks; applied.

-Kees

> ---
>  fs/pstore/zone.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index bd8e194110fc..c5bf3b9f644f 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -998,7 +998,7 @@ static ssize_t psz_kmsg_read(struct pstore_zone *zone,
>  static ssize_t psz_ftrace_read(struct pstore_zone *zone,
>  		struct pstore_record *record)
>  {
> -	struct psz_context *cxt = record->psi->data;
> +	struct psz_context *cxt;
>  	struct psz_buffer *buf;
>  	int ret;
>  
> @@ -1018,6 +1018,7 @@ static ssize_t psz_ftrace_read(struct pstore_zone *zone,
>  		return ret;
>  
>  out:
> +	cxt = record->psi->data;
>  	if (cxt->ftrace_read_cnt < cxt->ftrace_max_cnt)
>  		/* then, read next ftrace zone */
>  		return -ENOMSG;
> -- 
> 2.25.1
> 

-- 
Kees Cook
