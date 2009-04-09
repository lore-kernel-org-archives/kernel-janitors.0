From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:35:04 +0000
Subject: Re: [PATCH 52/56] ufs: Remove void casts
Message-Id: <49DDCF58.6050504@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-38-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-39-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-40-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-41-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-42-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-43-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-44-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-45-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, dushistov@mail.ru

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  fs/ufs/dir.c   |    2 +-
>  fs/ufs/super.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ufs/dir.c b/fs/ufs/dir.c
> index dbbbc46..17898e3 100644
> --- a/fs/ufs/dir.c
> +++ b/fs/ufs/dir.c
> @@ -585,7 +585,7 @@ int ufs_make_empty(struct inode * inode, struct inode *dir)
>  	}
>  
>  	kmap(page);
> -	base = (char*)page_address(page);
> +	base = page_address(page);
>  	memset(base, 0, PAGE_CACHE_SIZE);
>  
>  	de = (struct ufs_dir_entry *) base;
> diff --git a/fs/ufs/super.c b/fs/ufs/super.c
> index 6035929..2488b6d 100644
> --- a/fs/ufs/super.c
> +++ b/fs/ufs/super.c
> @@ -1304,7 +1304,7 @@ static struct kmem_cache * ufs_inode_cachep;
>  static struct inode *ufs_alloc_inode(struct super_block *sb)
>  {
>  	struct ufs_inode_info *ei;
> -	ei = (struct ufs_inode_info *)kmem_cache_alloc(ufs_inode_cachep, GFP_KERNEL);
> +	ei = kmem_cache_alloc(ufs_inode_cachep, GFP_KERNEL);
>  	if (!ei)
>  		return NULL;
>  	ei->vfs_inode.i_version = 1;
>   

