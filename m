From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 09:44:45 +0000
Subject: Re: [PATCH 06/56] cifs: Remove void casts
Message-Id: <49DDC38D.1080908@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, sfrench@samba.org

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  fs/cifs/transport.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
> index 0ad3e2d..fb3bd00 100644
> --- a/fs/cifs/transport.c
> +++ b/fs/cifs/transport.c
> @@ -111,7 +111,7 @@ AllocOplockQEntry(struct inode *pinode, __u16 fid, struct cifsTconInfo *tcon)
>  		cERROR(1, ("Null parms passed to AllocOplockQEntry"));
>  		return NULL;
>  	}
> -	temp = (struct oplock_q_entry *) kmem_cache_alloc(cifs_oplock_cachep,
> +	temp = kmem_cache_alloc(cifs_oplock_cachep,
>  						       GFP_KERNEL);
>  	if (temp = NULL)
>  		return temp;
>   

