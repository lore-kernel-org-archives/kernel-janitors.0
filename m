From: Jan Kara <jack@suse.cz>
Date: Tue, 19 Feb 2019 14:02:40 +0000
Subject: Re: [PATCH][udf-next] udf: don't call mark_buffer_dirty on a null bh pointer
Message-Id: <20190219140240.GA31849@quack2.suse.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cWoXeonUoKmBZSoM"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219114403.24771-1-colin.king@canonical.com>
In-Reply-To: <20190219114403.24771-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue 19-02-19 11:44:03, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a null check on the pointer bh to avoid a null pointer dereference
> on bh->b_data however later bh is passed to mark_buffer_dirty that can also
> cause a null pointer dereference on bh.  Avoid this potential null pointer
> dereference by moving the call to mark_buffer_dirty inside the null checked
> block.
> 
> Fixes: e8b4274735e4 ("udf: finalize integrity descriptor before writeback")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the patch! In fact it is the 'if (bh)' check that's
unnecessarily defensive (we cannot have sbi->s_lvid_dirty and
!sbi->s_lvid_bh). So I'll just drop that check (attached patch).

								Honza

> ---
>  fs/udf/super.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/udf/super.c b/fs/udf/super.c
> index a6940d90bedd..b7e9a83d39db 100644
> --- a/fs/udf/super.c
> +++ b/fs/udf/super.c
> @@ -2336,13 +2336,13 @@ static int udf_sync_fs(struct super_block *sb, int wait)
>  
>  			lvid = (struct logicalVolIntegrityDesc *)bh->b_data;
>  			udf_finalize_lvid(lvid);
> -		}
>  
> -		/*
> -		 * Blockdevice will be synced later so we don't have to submit
> -		 * the buffer for IO
> -		 */
> -		mark_buffer_dirty(bh);
> +			/*
> +			 * Blockdevice will be synced later so we don't have
> +			 * to submit the buffer for IO
> +			 */
> +			mark_buffer_dirty(bh);
> +		}
>  		sbi->s_lvid_dirty = 0;
>  	}
>  	mutex_unlock(&sbi->s_alloc_mutex);
> -- 
> 2.20.1
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--cWoXeonUoKmBZSoM
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0001-udf-Drop-pointless-check-from-udf_sync_fs.patch"

From a00eb52e3f2f815efa52a9e3bf1b730d86c05faa Mon Sep 17 00:00:00 2001
From: Jan Kara <jack@suse.cz>
Date: Tue, 19 Feb 2019 14:59:43 +0100
Subject: [PATCH] udf: Drop pointless check from udf_sync_fs()

The check if (bh) in udf_sync_fs() is pointless as we cannot have
sbi->s_lvid_dirty and !sbi->s_lvid_bh (as already asserted by
udf_updated_lvid()). So just drop the pointless check.

Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/udf/super.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index a6940d90bedd..ffd8038ff728 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -2330,13 +2330,10 @@ static int udf_sync_fs(struct super_block *sb, int wait)
 	mutex_lock(&sbi->s_alloc_mutex);
 	if (sbi->s_lvid_dirty) {
 		struct buffer_head *bh = sbi->s_lvid_bh;
+		struct logicalVolIntegrityDesc *lvid;
 
-		if (bh) {
-			struct logicalVolIntegrityDesc *lvid;
-
-			lvid = (struct logicalVolIntegrityDesc *)bh->b_data;
-			udf_finalize_lvid(lvid);
-		}
+		lvid = (struct logicalVolIntegrityDesc *)bh->b_data;
+		udf_finalize_lvid(lvid);
 
 		/*
 		 * Blockdevice will be synced later so we don't have to submit
-- 
2.16.4


--cWoXeonUoKmBZSoM--
