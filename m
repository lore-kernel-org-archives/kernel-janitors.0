From: Steve French <smfrench@gmail.com>
Date: Thu, 06 Sep 2018 17:57:33 +0000
Subject: Re: [PATCH -next] cifs: remove set but not used variable 'cifs_sb'
Message-Id: <CAH2r5mskU8UAdKrKcwbRJT_y6Eh1aOqEaUjY1Mnxf-1R8MqVmg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

merged into cifs-2.6.git for-next
On Wed, Sep 5, 2018 at 8:41 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> fs/cifs/ioctl.c: In function 'cifs_ioctl':
> fs/cifs/ioctl.c:164:23: warning:
>  variable 'cifs_sb' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/ioctl.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/cifs/ioctl.c b/fs/cifs/ioctl.c
> index 91f87ea..6a51ec6e 100644
> --- a/fs/cifs/ioctl.c
> +++ b/fs/cifs/ioctl.c
> @@ -161,7 +161,6 @@ long cifs_ioctl(struct file *filep, unsigned int command, unsigned long arg)
>         struct inode *inode = file_inode(filep);
>         int rc = -ENOTTY; /* strange error - but the precedent */
>         unsigned int xid;
> -       struct cifs_sb_info *cifs_sb;
>         struct cifsFileInfo *pSMBFile = filep->private_data;
>         struct cifs_tcon *tcon;
>         __u64   ExtAttrBits = 0;
> @@ -169,7 +168,6 @@ long cifs_ioctl(struct file *filep, unsigned int command, unsigned long arg)
>
>         xid = get_xid();
>
> -       cifs_sb = CIFS_SB(inode->i_sb);
>         cifs_dbg(FYI, "cifs ioctl 0x%x\n", command);
>         switch (command) {
>                 case FS_IOC_GETFLAGS:
>


-- 
Thanks,

Steve
