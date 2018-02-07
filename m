From: "Huang\, Ying" <ying.huang@intel.com>
Date: Wed, 07 Feb 2018 00:38:36 +0000
Subject: Re: [PATCH] mm: swap: make pointer swap_avail_heads static
Message-Id: <87o9l11vn7.fsf@yhuang-dev.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206215836.12366-1-colin.king@canonical.com>
In-Reply-To: <20180206215836.12366-1-colin.king@canonical.com> (Colin King's
	message of "Tue, 6 Feb 2018 21:58:36 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer swap_avail_heads is local to the source and does not need
> to be in global scope, so make it static.
>
> Cleans up sparse warning:
> mm/swapfile.c:88:19: warning: symbol 'swap_avail_heads' was not
> declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: "Huang, Ying" <ying.huang@intel.com>

Best Regards,
Huang, Ying

> ---
>  mm/swapfile.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 006047b16814..0d00471af98b 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -85,7 +85,7 @@ PLIST_HEAD(swap_active_head);
>   * is held and the locking order requires swap_lock to be taken
>   * before any swap_info_struct->lock.
>   */
> -struct plist_head *swap_avail_heads;
> +static struct plist_head *swap_avail_heads;
>  static DEFINE_SPINLOCK(swap_avail_lock);
>  
>  struct swap_info_struct *swap_info[MAX_SWAPFILES];
