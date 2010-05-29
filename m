From: Mike Fedyk <mfedyk@mikefedyk.com>
Date: Sat, 29 May 2010 18:01:56 +0000
Subject: Re: [patch 5/11] btrfs: remove unneeded null check in btrfs_rename()
Message-Id: <AANLkTikLkpTgkOGi8M8VL_rZRLyzbJKoKW9RiNMJenMi@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100529094508.GF5483@bicker>
In-Reply-To: <20100529094508.GF5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-btrfs@vger.kernel.org, Yan Zheng <zheng.yan@oracle.com>, Josef Bacik <josef@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Chris Mason <chris.mason@oracle.com>, kernel-janitors@vger.kernel.org

On Sat, May 29, 2010 at 2:45 AM, Dan Carpenter <error27@gmail.com> wrote:
> "old_inode" cannot be null here, because we dereference it
> unconditionally throughout the function.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index fa6ccc1..0bc29be 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -6487,10 +6487,8 @@ static int btrfs_rename(struct inode *old_dir, struct dentry *old_dentry,
>         * make sure the inode gets flushed if it is replacing
>         * something.
>         */
> -       if (new_inode && new_inode->i_size &&
> -           old_inode && S_ISREG(old_inode->i_mode)) {
> +       if (new_inode && new_inode->i_size && S_ISREG(old_inode->i_mode))
>                btrfs_add_ordered_operation(trans, root, old_inode);
> -       }

I think code like this is here because there are still a lot of
features that are being added to btrfs and it's easier to have the
additional checks than continually adding and removing them as the
code changes.
