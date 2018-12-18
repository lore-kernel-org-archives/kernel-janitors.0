From: Steve French <smfrench@gmail.com>
Date: Tue, 18 Dec 2018 01:59:05 +0000
Subject: Re: [PATCH -next] cifs: remove set but not used variable 'sep'
Message-Id: <CAH2r5msxn3k5pHxezO++-V0bWVstdhzHgR=q+a6h78b7-Q-dOA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

merged into cifs-2.6.git for-next

On Mon, Dec 17, 2018 at 7:28 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> fs/cifs/cifs_dfs_ref.c: In function 'cifs_dfs_do_automount':
> fs/cifs/cifs_dfs_ref.c:309:7: warning:
>  variable 'sep' set but not used [-Wunused-but-set-variable]
>
> It never used since introdution in commit 0f56b277073c ("cifs: Make use
> of DFS cache to get new DFS referrals")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/cifs_dfs_ref.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/fs/cifs/cifs_dfs_ref.c b/fs/cifs/cifs_dfs_ref.c
> index 0bf1762..bd6d3d5 100644
> --- a/fs/cifs/cifs_dfs_ref.c
> +++ b/fs/cifs/cifs_dfs_ref.c
> @@ -306,7 +306,6 @@ static struct vfsmount *cifs_dfs_do_automount(struct dentry *mntpt)
>         int len;
>         int rc;
>         struct vfsmount *mnt;
> -       char sep;
>
>         cifs_dbg(FYI, "in %s\n", __func__);
>         BUG_ON(IS_ROOT(mntpt));
> @@ -325,8 +324,6 @@ static struct vfsmount *cifs_dfs_do_automount(struct dentry *mntpt)
>                 goto cdda_exit;
>         }
>
> -       sep = CIFS_DIR_SEP(cifs_sb);
> -
>         /* always use tree name prefix */
>         full_path = build_path_from_dentry_optional_prefix(mntpt, true);
>         if (full_path = NULL)
>
>
>


-- 
Thanks,

Steve
