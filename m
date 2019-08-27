From: Steve French <smfrench@gmail.com>
Date: Tue, 27 Aug 2019 15:46:41 +0000
Subject: Re: [PATCH] cifs: Use kzfree() to zero out the password
Message-Id: <CAH2r5mtNVwt-Dp8YVvbVHbYEpUAG_bw=aqJqWdB1Wb-hY1e=NQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827105917.GA23038@mwanda>
In-Reply-To: <20190827105917.GA23038@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steve French <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>, CIFS <linux-cifs@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

merged into cifs-2.6.git for-next

On Tue, Aug 27, 2019 at 6:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> It's safer to zero out the password so that it can never be disclosed.
>
> Fixes: 0c219f5799c7 ("cifs: set domainName when a domain-key is used in multiuser")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/connect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index e6cc5c4b0f19..642bbb5bee3a 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3101,7 +3101,7 @@ cifs_set_cifscreds(struct smb_vol *vol, struct cifs_ses *ses)
>                         rc = -ENOMEM;
>                         kfree(vol->username);
>                         vol->username = NULL;
> -                       kfree(vol->password);
> +                       kzfree(vol->password);
>                         vol->password = NULL;
>                         goto out_key_put;
>                 }
> --
> 2.20.1
>


-- 
Thanks,

Steve
