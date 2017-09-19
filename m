From: Tejun Heo <tj@kernel.org>
Date: Tue, 19 Sep 2017 03:29:56 +0000
Subject: Re: [PATCH] libata: make static arrays const, reduces object code size
Message-Id: <20170919032956.GP378890@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170918133140.31220-1-colin.king@canonical.com>
In-Reply-To: <20170918133140.31220-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Andrew Morton <akpm@linux-foundation.org>, piaojun <piaojun@huawei.com>, linux-ide@vger.kernel.org, ocfs2-devel@oss.oracle.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Sep 18, 2017 at 02:31:40PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const arrayis on the stack, instead make them static.
> Makes the object code smaller by over 260 bytes:
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
...
> diff --git a/fs/ocfs2/dlm/dlmrecovery.c b/fs/ocfs2/dlm/dlmrecovery.c
> index 74407c6dd592..31a61e8e0152 100644
> --- a/fs/ocfs2/dlm/dlmrecovery.c
> +++ b/fs/ocfs2/dlm/dlmrecovery.c
> @@ -1129,7 +1129,6 @@ static int dlm_send_mig_lockres_msg(struct dlm_ctxt *dlm,
>  		(mres->num_locks * sizeof(struct dlm_migratable_lock));
>  
>  	/* add an all-done flag if we reached the last lock */
> -	orig_flags = mres->flags;
>  	BUG_ON(total_locks > mres_total_locks);
>  	if (total_locks = mres_total_locks)
>  		mres->flags |= DLM_MRES_ALL_DONE;

Looks like patch contamination.

Thanks.

-- 
tejun
