From: Kees Cook <keescook@chromium.org>
Date: Tue, 12 May 2020 18:59:16 +0000
Subject: Re: [PATCH][next] pstore/zone: fix dereference of pointer before it has been null checked
Message-Id: <202005121159.711F246@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512171932.222102-1-colin.king@canonical.com>
In-Reply-To: <20200512171932.222102-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, WeiXiong Liao <liaoweixiong@allwinnertech.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 12, 2020 at 06:19:32PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the assignment of cnt dereferences pointer 'record' before
> the pointer has been null checked. Fix this by only making this
> dereference after it has been null checked close to the point cnt
> is to be used.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 637ce64e7f57 ("pstore/zone,blk: Add support for pmsg frontend")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/pstore/zone.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index c5bf3b9f644f..3cf7d6762c76 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -825,7 +825,7 @@ static int notrace psz_record_write(struct pstore_zone *zone,
>  		struct pstore_record *record)
>  {
>  	size_t start, rem;
> -	int cnt = record->size;
> +	int cnt;
>  	bool is_full_data = false;
>  	char *buf = record->buf;

Also here. I'll fix both. Thanks!

-Kees

>  
> @@ -835,6 +835,7 @@ static int notrace psz_record_write(struct pstore_zone *zone,
>  	if (atomic_read(&zone->buffer->datalen) >= zone->buffer_size)
>  		is_full_data = true;
>  
> +	cnt = record->size;
>  	if (unlikely(cnt > zone->buffer_size)) {
>  		buf += cnt - zone->buffer_size;
>  		cnt = zone->buffer_size;
> -- 
> 2.25.1
> 

-- 
Kees Cook
