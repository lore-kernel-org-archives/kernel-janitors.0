From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date: Thu, 21 Mar 2019 08:58:40 +0000
Subject: Re: [PATCH] drm/i915/selftests: fix NULL vs IS_ERR() check in mock_context_barrier()
Message-Id: <8736ng1u4f.fsf@gaia.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190321083335.GA31210@kadam>
In-Reply-To: <20190321083335.GA31210@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The mock_context() function returns NULL on error, it doesn't return
> error pointers.
>
> Fixes: 85fddf0b0027 ("drm/i915: Introduce a context barrier callback")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  .../gpu/drm/i915/selftests/i915_gem_context.c |  4 +-
>  drivers/staging/erofs/unzip_vle.c             | 70 ++++++++++---------
>  2 files changed, 38 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/selftests/i915_gem_context.c
> index 4399ef9ebf15..a172dbd9cb9e 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_context.c
> @@ -1620,8 +1620,8 @@ static int mock_context_barrier(void *arg)
>  	mutex_lock(&i915->drm.struct_mutex);
>  
>  	ctx = mock_context(i915, "mock");
> -	if (IS_ERR(ctx)) {
> -		err = PTR_ERR(ctx);
> +	if (!ctx) {
> +		err = -ENOMEM;
>  		goto unlock;
>  	}

Yup.

The rest of the diff is unrelated tho, please resend.

-Mika

>  
> diff --git a/drivers/staging/erofs/unzip_vle.c b/drivers/staging/erofs/unzip_vle.c
> index c7b3b21123c1..a711bf61f60c 100644
> --- a/drivers/staging/erofs/unzip_vle.c
> +++ b/drivers/staging/erofs/unzip_vle.c
> @@ -844,11 +844,9 @@ static void z_erofs_vle_unzip_kickoff(void *ptr, int bios)
>  static inline void z_erofs_vle_read_endio(struct bio *bio)
>  {
>  	const blk_status_t err = bio->bi_status;
> +	struct erofs_sb_info *sbi = NULL;
>  	unsigned int i;
>  	struct bio_vec *bvec;
> -#ifdef EROFS_FS_HAS_MANAGED_CACHE
> -	struct address_space *mc = NULL;
> -#endif
>  	struct bvec_iter_all iter_all;
>  
>  	bio_for_each_segment_all(bvec, bio, i, iter_all) {
> @@ -858,20 +856,12 @@ static inline void z_erofs_vle_read_endio(struct bio *bio)
>  		DBG_BUGON(PageUptodate(page));
>  		DBG_BUGON(!page->mapping);
>  
> -#ifdef EROFS_FS_HAS_MANAGED_CACHE
> -		if (unlikely(!mc && !z_erofs_is_stagingpage(page))) {
> -			struct inode *const inode = page->mapping->host;
> -			struct super_block *const sb = inode->i_sb;
> -
> -			mc = MNGD_MAPPING(EROFS_SB(sb));
> -		}
> +		if (unlikely(!sbi && !z_erofs_is_stagingpage(page)))
> +			sbi = EROFS_SB(page->mapping->host->i_sb);
>  
> -		/*
> -		 * If mc has not gotten, it equals NULL,
> -		 * however, page->mapping never be NULL if working properly.
> -		 */
> -		cachemngd = (page->mapping = mc);
> -#endif
> +		/* sbi should already be gotten if the page is managed */
> +		if (sbi)
> +			cachemngd = erofs_page_is_managed(sbi, page);
>  
>  		if (unlikely(err))
>  			SetPageError(page);
> @@ -972,6 +962,7 @@ static int z_erofs_vle_unzip(struct super_block *sb,
>  	overlapped = false;
>  	compressed_pages = grp->compressed_pages;
>  
> +	err = 0;
>  	for (i = 0; i < clusterpages; ++i) {
>  		unsigned int pagenr;
>  
> @@ -981,26 +972,37 @@ static int z_erofs_vle_unzip(struct super_block *sb,
>  		DBG_BUGON(!page);
>  		DBG_BUGON(!page->mapping);
>  
> -		if (z_erofs_is_stagingpage(page))
> -			continue;
> -#ifdef EROFS_FS_HAS_MANAGED_CACHE
> -		if (page->mapping = MNGD_MAPPING(sbi)) {
> -			DBG_BUGON(!PageUptodate(page));
> -			continue;
> -		}
> -#endif
> +		if (!z_erofs_is_stagingpage(page)) {
> +			if (erofs_page_is_managed(sbi, page)) {
> +				if (unlikely(!PageUptodate(page)))
> +					err = -EIO;
> +				continue;
> +			}
> +
> +			/*
> +			 * only if non-head page can be selected
> +			 * for inplace decompression
> +			 */
> +			pagenr = z_erofs_onlinepage_index(page);
>  
> -		/* only non-head page could be reused as a compressed page */
> -		pagenr = z_erofs_onlinepage_index(page);
> +			DBG_BUGON(pagenr >= nr_pages);
> +			DBG_BUGON(pages[pagenr]);
> +			++sparsemem_pages;
> +			pages[pagenr] = page;
>  
> -		DBG_BUGON(pagenr >= nr_pages);
> -		DBG_BUGON(pages[pagenr]);
> -		++sparsemem_pages;
> -		pages[pagenr] = page;
> +			overlapped = true;
> +		}
>  
> -		overlapped = true;
> +		/* PG_error needs checking for inplaced and staging pages */
> +		if (unlikely(PageError(page))) {
> +			DBG_BUGON(PageUptodate(page));
> +			err = -EIO;
> +		}
>  	}
>  
> +	if (unlikely(err))
> +		goto out;
> +
>  	llen = (nr_pages << PAGE_SHIFT) - work->pageofs;
>  
>  	if (z_erofs_vle_workgrp_fmt(grp) = Z_EROFS_VLE_WORKGRP_FMT_PLAIN) {
> @@ -1044,10 +1046,9 @@ static int z_erofs_vle_unzip(struct super_block *sb,
>  	for (i = 0; i < clusterpages; ++i) {
>  		page = compressed_pages[i];
>  
> -#ifdef EROFS_FS_HAS_MANAGED_CACHE
> -		if (page->mapping = MNGD_MAPPING(sbi))
> +		if (erofs_page_is_managed(sbi, page))
>  			continue;
> -#endif
> +
>  		/* recycle all individual staging pages */
>  		(void)z_erofs_gather_if_stagingpage(page_pool, page);
>  
> @@ -1198,6 +1199,7 @@ pickup_page_for_submission(struct z_erofs_vle_workgroup *grp,
>  	if (page->mapping = mc) {
>  		WRITE_ONCE(grp->compressed_pages[nr], page);
>  
> +		ClearPageError(page);
>  		if (!PagePrivate(page)) {
>  			/*
>  			 * impossible to be !PagePrivate(page) for
> -- 
> 2.17.1
