From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 12:19:47 +0000
Subject: Re: [PATCH 36/56] ocfs2: Remove void casts
Message-Id: <36ca99e90904080519s2996a423yfe7eca91a411c8c1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-35-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-37-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-37-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:22, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  fs/ocfs2/dlm/dlmmaster.c |   10 ++++------
>  1 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
> index f8b653f..e4c2f5b 100644
> --- a/fs/ocfs2/dlm/dlmmaster.c
> +++ b/fs/ocfs2/dlm/dlmmaster.c
> @@ -2455,7 +2453,7 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
>                goto leave;
>        }
>
> -       mle = (struct dlm_master_list_entry *) kmem_cache_alloc(dlm_mle_cache,
> +       mle = kmem_cache_alloc(dlm_mle_cache,
>                                                                GFP_NOFS);
Flag.

>        if (!mle) {
>                mlog_errno(ret);
> @@ -3036,7 +3034,7 @@ int dlm_migrate_request_handler(struct o2net_msg *msg, u32 len, void *data,
>        hash = dlm_lockid_hash(name, namelen);
>
>        /* preallocate.. if this fails, abort */
> -       mle = (struct dlm_master_list_entry *) kmem_cache_alloc(dlm_mle_cache,
> +       mle = kmem_cache_alloc(dlm_mle_cache,
>                                                         GFP_NOFS);
Flag.

>
>        if (!mle) {
> --
Bert
