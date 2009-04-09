From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:16:58 +0000
Subject: Re: [PATCH 36/56] ocfs2: Remove void casts
Message-Id: <49DDCB1A.20007@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-35-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-37-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080519s2996a423yfe7eca91a411c8c1@mail.gmail.com> <49DCAED6.1080404@fastmail.fm>
In-Reply-To: <49DCAED6.1080404@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org, mfasheh@suse.com, joel.becker@oracle.com

[Added maintainer CCs]
Jack Stone wrote:
> Fixed Patch
>
> Thanks,
>
> Jack
>
> --
>
> ocfs2: Remove void casts
>
> From: Jack Stone <jwjstone@fastmail.fm>
>
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>
>  fs/ocfs2/dlm/dlmmaster.c |   12 ++++--------
>  1 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
> index f8b653f..52ee37d 100644
> --- a/fs/ocfs2/dlm/dlmmaster.c
> +++ b/fs/ocfs2/dlm/dlmmaster.c
> @@ -758,8 +758,7 @@ lookup:
>          spin_unlock(&dlm->spinlock);
>          mlog(0, "allocating a new resource\n");
>          /* nothing found and we need to allocate one. */
> -        alloc_mle = (struct dlm_master_list_entry *)
> -            kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
> +        alloc_mle = kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
>          if (!alloc_mle)
>              goto leave;
>          res = dlm_new_lockres(dlm, lockid, namelen);
> @@ -1543,8 +1542,7 @@ way_up_top:
>              spin_unlock(&dlm->master_lock);
>              spin_unlock(&dlm->spinlock);
>  
> -            mle = (struct dlm_master_list_entry *)
> -                kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
> +            mle = kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
>              if (!mle) {
>                  response = DLM_MASTER_RESP_ERROR;
>                  mlog_errno(-ENOMEM);
> @@ -2455,8 +2453,7 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
>          goto leave;
>      }
>  
> -    mle = (struct dlm_master_list_entry *) kmem_cache_alloc(dlm_mle_cache,
> -                                GFP_NOFS);
> +    mle = kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
>      if (!mle) {
>          mlog_errno(ret);
>          goto leave;
> @@ -3036,8 +3033,7 @@ int dlm_migrate_request_handler(struct o2net_msg
> *msg, u32 len, void *data,
>      hash = dlm_lockid_hash(name, namelen);
>  
>      /* preallocate.. if this fails, abort */
> -    mle = (struct dlm_master_list_entry *) kmem_cache_alloc(dlm_mle_cache,
> -                             GFP_NOFS);
> +    mle = kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
>  
>      if (!mle) {
>          ret = -ENOMEM;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

