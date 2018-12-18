From: Paulo Alcantara <paulo@paulo.ac>
Date: Tue, 18 Dec 2018 01:51:35 +0000
Subject: Re: [PATCH -next] cifs: Use GFP_ATOMIC when a lock is held in cifs_mount()
Message-Id: <F4A1ECE6-2A20-4D06-A753-1EEAB46A3501@paulo.ac>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545096879-123632-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545096879-123632-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On December 17, 2018 11:34:39 PM GMT-02:00, YueHaibing <yuehaibing@huawei.com> wrote:
>A spin lock is held before kstrndup, it may sleep with holding
>the spinlock, so we should use GFP_ATOMIC instead.
>
>Fixes: e58c31d5e387 ("cifs: Add support for failover in
>cifs_reconnect()")
>Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>---
> fs/cifs/connect.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
>index a83aa61..3d5e308 100644
>--- a/fs/cifs/connect.c
>+++ b/fs/cifs/connect.c
>@@ -4574,7 +4574,8 @@ int cifs_mount(struct cifs_sb_info *cifs_sb,
>struct smb_vol *vol)
> 		tcon->remap = cifs_remap(cifs_sb);
> 	}
> 	cifs_sb->origin_fullpath = kstrndup(tcon->dfs_path,
>-					    strlen(tcon->dfs_path), GFP_KERNEL);
>+					    strlen(tcon->dfs_path),
>+					    GFP_ATOMIC);
> 	if (!cifs_sb->origin_fullpath) {
> 		spin_unlock(&cifs_tcp_ses_lock);
> 		rc = -ENOMEM;

Reviewed-by: Paulo Alcantara <palcantara@suse.de>

Thanks
Paulo
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
