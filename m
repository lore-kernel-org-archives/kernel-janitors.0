From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 09:45:46 +0000
Subject: Re: [PATCH 07/56] coda: Remove void casts
Message-Id: <49DDC3CA.70200@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, jaharkes@cs.cmu.edu

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  fs/coda/inode.c  |    2 +-
>  fs/coda/upcall.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/coda/inode.c b/fs/coda/inode.c
> index 830f51a..a0407b3 100644
> --- a/fs/coda/inode.c
> +++ b/fs/coda/inode.c
> @@ -43,7 +43,7 @@ static struct kmem_cache * coda_inode_cachep;
>  static struct inode *coda_alloc_inode(struct super_block *sb)
>  {
>  	struct coda_inode_info *ei;
> -	ei = (struct coda_inode_info *)kmem_cache_alloc(coda_inode_cachep, GFP_KERNEL);
> +	ei = kmem_cache_alloc(coda_inode_cachep, GFP_KERNEL);
>  	if (!ei)
>  		return NULL;
>  	memset(&ei->c_fid, 0, sizeof(struct CodaFid));
> diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
> index c274d94..0f2e171 100644
> --- a/fs/coda/upcall.c
> +++ b/fs/coda/upcall.c
> @@ -59,7 +59,7 @@ static void *alloc_upcall(int opcode, int size)
>  
>  #define UPARG(op)\
>  do {\
> -	inp = (union inputArgs *)alloc_upcall(op, insize); \
> +	inp = alloc_upcall(op, insize); \
>          if (IS_ERR(inp)) { return PTR_ERR(inp); }\
>          outp = (union outputArgs *)(inp); \
>          outsize = insize; \
>   

