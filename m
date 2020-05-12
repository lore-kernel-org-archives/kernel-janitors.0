From: Kees Cook <keescook@chromium.org>
Date: Tue, 12 May 2020 19:40:57 +0000
Subject: Re: [PATCH][next] pstore/zone: remove redundant initializations to variable ret
Message-Id: <202005121240.1C306861D@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512173801.222666-1-colin.king@canonical.com>
In-Reply-To: <20200512173801.222666-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 12, 2020 at 06:38:01PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is being initialized with a value that is never read and it
> is being updated later with a new value.  The initialization is redundant
> and can be removed.  In one of the cases, ret can also be moved inside a
> for-loop to reduce the scope.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

> ---
>  fs/pstore/zone.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index 3cf7d6762c76..419de481c69c 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -600,7 +600,7 @@ static int psz_recover_zones(struct psz_context *cxt,
>   */
>  static inline int psz_recovery(struct psz_context *cxt)
>  {
> -	int ret = -EBUSY;
> +	int ret;
>  
>  	if (atomic_read(&cxt->recovered))
>  		return 0;

I've refactored this code.

> @@ -746,13 +746,13 @@ static void psz_write_kmsg_hdr(struct pstore_zone *zone,
>  static inline int notrace psz_kmsg_write_record(struct psz_context *cxt,
>  		struct pstore_record *record)
>  {
> -	int ret = -EBUSY;
>  	size_t size, hlen;
>  	struct pstore_zone *zone;
>  	unsigned int i;
>  
>  	for (i = 0; i < cxt->kmsg_max_cnt; i++) {
>  		unsigned int zonenum, len;
> +		int ret;
>  
>  		zonenum = (cxt->kmsg_write_cnt + i) % cxt->kmsg_max_cnt;
>  		zone = cxt->kpszs[zonenum];

And I've applied this hunk. Thanks!

-- 
Kees Cook
