From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 11:26:03 +0000
Subject: Re: [PATCH 04/56] befs: Remove void casts
Message-Id: <36ca99e90904080426p71cf193ei5e3806e3781336d2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:21, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  fs/befs/linuxvfs.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
> index 76afd0d..cfd9698 100644
> --- a/fs/befs/linuxvfs.c
> +++ b/fs/befs/linuxvfs.c
> @@ -277,7 +277,7 @@ static struct inode *
>  befs_alloc_inode(struct super_block *sb)
>  {
>         struct befs_inode_info *bi;
> -        bi = (struct befs_inode_info *)kmem_cache_alloc(befs_inode_cachep,
> +        bi = kmem_cache_alloc(befs_inode_cachep,
>                                                        GFP_KERNEL);
                                                         ^^^^^^^^^^^^
This can now be one line up.

Bert
>         if (!bi)
>                 return NULL;
> --
> 1.5.4.3
