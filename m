From: Lukas Czerner <lczerner@redhat.com>
Date: Mon, 19 Jul 2010 11:09:40 +0000
Subject: Re: [PATCH 2/2] turn BUG_ON for out of bound in
Message-Id: <alpine.LFD.2.00.1007191308150.3435@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C43083E.6020201@gmail.com>
In-Reply-To: <4C43083E.6020201@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 19 Jul 2010, shenghui wrote:

> Sorry. Will you recommend to me one mail client?
> I have been suffering reformat by client these days.
> Thanks,

Mutt, or Alpine will be a very good choice.

This can be also useful:

 Documentation/SubmittingPatches
 Documentation/email-clients.txt

Cheers
-Lukas

> 
> 
> Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
> ---
> fs/mbcache.c |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/mbcache.c b/fs/mbcache.c
> index 5697d9e..5f96b82 100644
> --- a/fs/mbcache.c
> +++ b/fs/mbcache.c
> @@ -614,7 +614,7 @@ mb_cache_entry_find_first(struct mb_cache *cache, int
> index,
> 	struct list_head *l;
> 	struct mb_cache_entry *ce;
> 
> -	mb_assert(index < mb_cache_indexes(cache));
> +	BUG_ON(!(index < mb_cache_indexes(cache)));
> 	spin_lock(&mb_cache_spinlock);
> 	l = cache->c_indexes_hash[index][bucket].next;
> 	ce = __mb_cache_entry_find(l, &cache->c_indexes_hash[index][bucket],
> @@ -652,7 +652,7 @@ mb_cache_entry_find_next(struct mb_cache_entry *prev, int
> index,
> 	struct list_head *l;
> 	struct mb_cache_entry *ce;
> 
> -	mb_assert(index < mb_cache_indexes(cache));
> +	BUG_ON(!(index < mb_cache_indexes(cache)));
> 	spin_lock(&mb_cache_spinlock);
> 	l = prev->e_indexes[index].o_list.next;
> 	ce = __mb_cache_entry_find(l, &cache->c_indexes_hash[index][bucket],
> 
