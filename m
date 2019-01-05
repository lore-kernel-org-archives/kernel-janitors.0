From: Steve French <smfrench@gmail.com>
Date: Sat, 05 Jan 2019 23:50:25 +0000
Subject: Re: [PATCH] cifs: Fix a debug message
Message-Id: <CAH2r5mtGdNihRBkP16h03y4LP4bGp-ARVbXqNGhXafq3mL0mBQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190105122529.GA3288@kadam>
In-Reply-To: <20190105122529.GA3288@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

merged into cifs-2.6.git for-next

thx

On Sat, Jan 5, 2019 at 6:30 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This debug message was never shown because it was checking for NULL
> returns but extract_hostname() returns error pointers.
>
> Fixes: 93d5cb517db3 ("cifs: Add support for failover in cifs_reconnect()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/connect.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index f66529679ca2..683310f26171 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -433,9 +433,10 @@ static void reconn_inval_dfs_target(struct TCP_Server_Info *server,
>         kfree(server->hostname);
>
>         server->hostname = extract_hostname(name);
> -       if (!server->hostname) {
> -               cifs_dbg(FYI, "%s: failed to extract hostname from target: %d\n",
> -                        __func__, -ENOMEM);
> +       if (IS_ERR(server->hostname)) {
> +               cifs_dbg(FYI,
> +                        "%s: failed to extract hostname from target: %ld\n",
> +                        __func__, PTR_ERR(server->hostname));
>         }
>  }
>
> --
> 2.17.1
>


-- 
Thanks,

Steve
