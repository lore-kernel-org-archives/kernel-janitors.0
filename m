From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 05 May 2015 05:16:13 +0000
Subject: Re: [PATCH 2/5] fs: ext4: balloc: Fixed code style
Message-Id: <alpine.DEB.2.02.1505050715450.2044@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430786599-3843-3-git-send-email-adirkuhn@gmail.com>
In-Reply-To: <1430786599-3843-3-git-send-email-adirkuhn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Fixed code style" does not say what you did.

julia

On Tue, 5 May 2015, Adir Kuhn wrote:

> Fixed code style
> 
> Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
> ---
>  fs/ext4/balloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/balloc.c b/fs/ext4/balloc.c
> index 31a4152..7eb2b3d 100644
> --- a/fs/ext4/balloc.c
> +++ b/fs/ext4/balloc.c
> @@ -274,7 +274,7 @@ unsigned ext4_free_clusters_after_init(struct super_block *sb,
>   * @bh:			pointer to the buffer head to store the block
>   *			group descriptor
>   */
> -struct ext4_group_desc * ext4_get_group_desc(struct super_block *sb,
> +struct ext4_group_desc *ext4_get_group_desc(struct super_block *sb,
>  					     ext4_group_t block_group,
>  					     struct buffer_head **bh)
>  {
> --
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
