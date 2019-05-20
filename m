From: Steve French <smfrench@gmail.com>
Date: Mon, 20 May 2019 01:20:18 +0000
Subject: Re: [PATCH] cifs: fix memory leak of pneg_inbuf on -EOPNOTSUPP ioctl case
Message-Id: <CAH2r5muO=GLx2Hh77rTPqCZ1yP6a0r5yjSEu5j58o__Mni1bsQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190517081233.11764-1-colin.king@canonical.com>
In-Reply-To: <20190517081233.11764-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

merged into cifs-2.6.git for-next (and added cc:stable #v5.1)

On Fri, May 17, 2019 at 3:42 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently in the case where SMB2_ioctl returns the -EOPNOTSUPP error
> there is a memory leak of pneg_inbuf. Fix this by returning via
> the out_free_inbuf exit path that will perform the relevant kfree.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 969ae8e8d4ee ("cifs: Accept validate negotiate if server return NT_STATUS_NOT_SUPPORTED")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/smb2pdu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 710ceb875161..5b8d1482ffbd 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -1054,7 +1054,8 @@ int smb3_validate_negotiate(const unsigned int xid, struct cifs_tcon *tcon)
>                  * not supported error. Client should accept it.
>                  */
>                 cifs_dbg(VFS, "Server does not support validate negotiate\n");
> -               return 0;
> +               rc = 0;
> +               goto out_free_inbuf;
>         } else if (rc != 0) {
>                 cifs_dbg(VFS, "validate protocol negotiate failed: %d\n", rc);
>                 rc = -EIO;
> --
> 2.20.1
>


-- 
Thanks,

Steve
