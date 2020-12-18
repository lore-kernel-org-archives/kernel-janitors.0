From: Steve French <smfrench@gmail.com>
Date: Fri, 18 Dec 2020 02:38:58 +0000
Subject: Re: [PATCH 3/3] cifs: Re-indent cifs_swn_reconnect()
Message-Id: <CAH2r5mvvevajfzFrj0Q2GGDYV1en8aupf8RM_23hA1qa23RLbg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9s6nGDLt4xreaYN@mwanda> <X9s7By4IDIcG4D+w@mwanda>
In-Reply-To: <X9s7By4IDIcG4D+w@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steve French <sfrench@samba.org>, Samuel Cabrero <scabrero@suse.de>, CIFS <linux-cifs@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>

tentatively merged these three into cifs-2.6.git for-next pending testing

On Thu, Dec 17, 2020 at 5:04 AM Dan Carpenter via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> This code is slightly nicer if we flip the cifs_sockaddr_equal()
> around and pull all the code in one tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/cifs_swn.c | 64 ++++++++++++++++++++++++----------------------
>  1 file changed, 33 insertions(+), 31 deletions(-)
>
> diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
> index 91163d3cf8b7..d35f599aa00e 100644
> --- a/fs/cifs/cifs_swn.c
> +++ b/fs/cifs/cifs_swn.c
> @@ -484,41 +484,43 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
>
>         /* Store the reconnect address */
>         mutex_lock(&tcon->ses->server->srv_mutex);
> -       if (!cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr)) {
> -               ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
> -                               &tcon->ses->server->swn_dstaddr);
> -               if (ret < 0) {
> -                       cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
> -                       goto unlock;
> -               }
> -               tcon->ses->server->use_swn_dstaddr = true;
> +       if (cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr))
> +               goto unlock;
>
> -               /*
> -                * Unregister to stop receiving notifications for the old IP address.
> -                */
> -               ret = cifs_swn_unregister(tcon);
> -               if (ret < 0) {
> -                       cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
> -                                       __func__, ret);
> -                       goto unlock;
> -               }
> +       ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
> +                                     &tcon->ses->server->swn_dstaddr);
> +       if (ret < 0) {
> +               cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
> +               goto unlock;
> +       }
> +       tcon->ses->server->use_swn_dstaddr = true;
>
> -               /*
> -                * And register to receive notifications for the new IP address now that we have
> -                * stored the new address.
> -                */
> -               ret = cifs_swn_register(tcon);
> -               if (ret < 0) {
> -                       cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
> -                                       __func__, ret);
> -                       goto unlock;
> -               }
> +       /*
> +        * Unregister to stop receiving notifications for the old IP address.
> +        */
> +       ret = cifs_swn_unregister(tcon);
> +       if (ret < 0) {
> +               cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
> +                        __func__, ret);
> +               goto unlock;
> +       }
>
> -               spin_lock(&GlobalMid_Lock);
> -               if (tcon->ses->server->tcpStatus != CifsExiting)
> -                       tcon->ses->server->tcpStatus = CifsNeedReconnect;
> -               spin_unlock(&GlobalMid_Lock);
> +       /*
> +        * And register to receive notifications for the new IP address now that we have
> +        * stored the new address.
> +        */
> +       ret = cifs_swn_register(tcon);
> +       if (ret < 0) {
> +               cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
> +                        __func__, ret);
> +               goto unlock;
>         }
> +
> +       spin_lock(&GlobalMid_Lock);
> +       if (tcon->ses->server->tcpStatus != CifsExiting)
> +               tcon->ses->server->tcpStatus = CifsNeedReconnect;
> +       spin_unlock(&GlobalMid_Lock);
> +
>  unlock:
>         mutex_unlock(&tcon->ses->server->srv_mutex);
>
> --
> 2.29.2
>
>


-- 
Thanks,

Steve
