From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Date: Wed, 19 Nov 2014 00:09:54 +0000
Subject: Re: [PATCH 1/1] nilfs2: Deletion of an unnecessary check before the function call "iput"
Message-Id: <20141119.090954.206625370231465945.konishi.ryusuke@lab.ntt.co.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<546B4E19.8050405@users.sourceforge.net>
In-Reply-To: <546B4E19.8050405@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-nilfs@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr

On Tue, 18 Nov 2014 14:48:09 +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 18 Nov 2014 14:41:27 +0100
> 
> The iput() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to nilfs2 git tree.  Thanks.

Ryusuke Konishi


> ---
>  fs/nilfs2/the_nilfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
> index 9da25fe..69bd801 100644
> --- a/fs/nilfs2/the_nilfs.c
> +++ b/fs/nilfs2/the_nilfs.c
> @@ -808,8 +808,7 @@ void nilfs_put_root(struct nilfs_root *root)
>  		spin_lock(&nilfs->ns_cptree_lock);
>  		rb_erase(&root->rb_node, &nilfs->ns_cptree);
>  		spin_unlock(&nilfs->ns_cptree_lock);
> -		if (root->ifile)
> -			iput(root->ifile);
> +		iput(root->ifile);
>  
>  		kfree(root);
>  	}
> -- 
> 2.1.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nilfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
