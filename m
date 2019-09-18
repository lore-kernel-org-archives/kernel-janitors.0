From: Gao Xiang <gaoxiang25@huawei.com>
Date: Wed, 18 Sep 2019 08:33:08 +0000
Subject: Re: [PATCH -next] erofs: fix return value check in erofs_read_superblock()
Message-Id: <20190918083308.GA30134@architecture4>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190918083033.47780-1-weiyongjun1@huawei.com>
In-Reply-To: <20190918083033.47780-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Gao Xiang <xiang@kernel.org>, linux-erofs@lists.ozlabs.org

Hi Yongjun,

On Wed, Sep 18, 2019 at 08:30:33AM +0000, Wei Yongjun wrote:
> In case of error, the function read_mapping_page() returns
> ERR_PTR() not NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> Fixes: fe7c2423570d ("erofs: use read_mapping_page instead of sb_bread")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Gao Xiang <gaoxiang25@huawei.com>


Right... That is my mistake on recent killing bh
transformation...

I have no idea this patch could be merged for -rc1
since I don't know Greg could still accept patches
or freezed...

Since it's an error handling path and trivial, if
it's some late, could I submit this later after
erofs is merged into mainline (if it's ok) for -rc1?
(or maybe -rc2?)

Thanks,
Gao Xiang

> ---
>  fs/erofs/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index caf9a95173b0..0e369494f2f2 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -105,9 +105,9 @@ static int erofs_read_superblock(struct super_block *sb)
>  	int ret;
>  
>  	page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
> -	if (!page) {
> +	if (IS_ERR(page)) {
>  		erofs_err(sb, "cannot read erofs superblock");
> -		return -EIO;
> +		return PTR_ERR(page);
>  	}
>  
>  	sbi = EROFS_SB(sb);
> 
> 
> 
