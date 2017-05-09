From: Liu Bo <bo.li.liu@oracle.com>
Date: Tue, 09 May 2017 18:58:55 +0000
Subject: Re: [PATCH] btrfs: fix incorrect error return ret being passed to mapping_set_error
Message-Id: <20170509185855.GB17312@lim.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170509171401.4641-1-colin.king@canonical.com>
In-Reply-To: <20170509171401.4641-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 09, 2017 at 06:14:01PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The setting of return code ret should be based on the error code
> passed into function end_extent_writepage and not on ret. Thanks
> to Liu Bo for spotting this mistake in the original fix I submitted.
> 
> Detected by CoverityScan, CID#1414312 ("Logically dead code")

Looks good.

Reviewed-by: Liu Bo <bo.li.liu@oracle.com>

Thanks,

-liubo
> 
> Fixes: 5dca6eea91653e ("Btrfs: mark mapping with error flag to report errors to userspace")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/btrfs/extent_io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index d8da3edf2ac3..7c6a032df585 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -2458,7 +2458,7 @@ void end_extent_writepage(struct page *page, int err, u64 start, u64 end)
>  	if (!uptodate) {
>  		ClearPageUptodate(page);
>  		SetPageError(page);
> -		ret = ret < 0 ? ret : -EIO;
> +		ret = err < 0 ? err : -EIO;
>  		mapping_set_error(page->mapping, ret);
>  	}
>  }
> -- 
> 2.11.0
> 
