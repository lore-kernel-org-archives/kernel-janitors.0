From: Steve French <smfrench@gmail.com>
Date: Sat, 15 Sep 2018 09:08:37 +0000
Subject: Re: [PATCH] cifs: Use kmemdup rather than duplicating its implementation in smb311_posix_mkdir()
Message-Id: <CAH2r5mvMmSz_E+i-2f8jjQXwZgfqkp9oO43jGKGjbiWW7UZ5Eg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536543186-182076-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536543186-182076-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

merged into cifs-2.6.git for-next
On Sun, Sep 9, 2018 at 10:11 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use kmemdup rather than duplicating its implementation
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/smb2pdu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index c08acfc..90f041d 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -2474,13 +2474,13 @@ int smb311_posix_mkdir(const unsigned int xid, struct inode *inode,
>                 goto ioctl_exit;
>         }
>
> -       *out_data = kmalloc(*plen, GFP_KERNEL);
> +       *out_data = kmemdup((char *)rsp + le32_to_cpu(rsp->OutputOffset),
> +                           *plen, GFP_KERNEL);
>         if (*out_data = NULL) {
>                 rc = -ENOMEM;
>                 goto ioctl_exit;
>         }
>
> -       memcpy(*out_data, (char *)rsp + le32_to_cpu(rsp->OutputOffset), *plen);
>  ioctl_exit:
>         free_rsp_buf(resp_buftype, rsp);
>         return rc;
>
>
>


-- 
Thanks,

Steve
