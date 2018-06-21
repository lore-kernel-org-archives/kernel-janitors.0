From: Steve French <smfrench@gmail.com>
Date: Thu, 21 Jun 2018 16:59:45 +0000
Subject: Re: [PATCH] CIFS: Fix error code in smb311_posix_mkdir()
Message-Id: <CAH2r5mu6pfLkU2sVLfqj0hZHugQUEsy0O_dfi7K2dhAwYVT-BQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180621150103.2zl7be4yzzotnqgw@kili.mountain>
In-Reply-To: <20180621150103.2zl7be4yzzotnqgw@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

merged the patches together

On Thu, Jun 21, 2018 at 10:01 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> The error assignment needs to go before the goto.
>
> Fixes: 5539e9b24a38 ("CIFS: fix memory leak and remove dead code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 062a2a59beb3..c9489b1160f0 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -1946,8 +1946,8 @@ int smb311_posix_mkdir(const unsigned int xid, struct inode *inode,
>         if (ses && (ses->server))
>                 server = ses->server;
>         else {
> -               goto err_free_path;
>                 rc = -EIO;
> +               goto err_free_path;
>         }
>
>         /* resource #2: request */
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks,

Steve
