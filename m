From: Steve French <smfrench@gmail.com>
Date: Sat, 03 Nov 2018 18:22:11 +0000
Subject: Re: [PATCH] cifs: clean up indentation, replace spaces with tab
Message-Id: <CAH2r5mtejuFDR=y13U3xiGwMOKoP3eOcHzk9midYLcwWp19Dyg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181103155944.3028-1-colin.king@canonical.com>
In-Reply-To: <20181103155944.3028-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

merged into cifs-2.6.git for-next
On Sat, Nov 3, 2018 at 11:00 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to clean up indentation, replace spaces with tab
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/cifsencrypt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifsencrypt.c b/fs/cifs/cifsencrypt.c
> index 85b31cfa2f3c..ecdff344e8fe 100644
> --- a/fs/cifs/cifsencrypt.c
> +++ b/fs/cifs/cifsencrypt.c
> @@ -224,7 +224,7 @@ int cifs_verify_signature(struct smb_rqst *rqst,
>         if (cifs_pdu->Command = SMB_COM_LOCKING_ANDX) {
>                 struct smb_com_lock_req *pSMB >                         (struct smb_com_lock_req *)cifs_pdu;
> -           if (pSMB->LockType & LOCKING_ANDX_OPLOCK_RELEASE)
> +               if (pSMB->LockType & LOCKING_ANDX_OPLOCK_RELEASE)
>                         return 0;
>         }
>
> --
> 2.19.1
>


-- 
Thanks,

Steve
