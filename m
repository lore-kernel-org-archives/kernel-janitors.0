From: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
Date: Mon, 03 Oct 2005 05:49:05 +0000
Subject: [KJ] Re: [PATCH 4/14] connector: fix gfp flags type
Message-Id: <20051003054905.GB31592@2ka.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23016608183112552=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23016608183112552==
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline

On Sun, Oct 02, 2005 at 10:40:44PM -0700, Randy.Dunlap (rdunlap@xenotime.net) wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Fix implicit nocast warnings in connector code:
> drivers/connector/connector.c:102:24: warning: implicit cast to nocast type
> drivers/connector/connector.c:114:45: warning: implicit cast to nocast type
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>

ACK.

Thank you, Randy.

> ---
> 
>  drivers/connector/connector.c |    2 +-
>  include/linux/connector.h     |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff -Naurp linux-2614-rc2-git6/drivers/connector/connector.c~conn_gfpmask linux-2614-rc2-git6/drivers/connector/connector.c
> --- linux-2614-rc2-git6/drivers/connector/connector.c~conn_gfpmask	2005-09-27 21:36:09.000000000 -0700
> +++ linux-2614-rc2-git6/drivers/connector/connector.c	2005-10-02 20:32:40.000000000 -0700
> @@ -69,7 +69,7 @@ int cn_already_initialized = 0;
>   * a new message.
>   *
>   */
> -int cn_netlink_send(struct cn_msg *msg, u32 __group, int gfp_mask)
> +int cn_netlink_send(struct cn_msg *msg, u32 __group, unsigned int gfp_mask)
>  {
>  	struct cn_callback_entry *__cbq;
>  	unsigned int size;
> diff -Naurp linux-2614-rc2-git6/include/linux/connector.h~conn_gfpmask linux-2614-rc2-git6/include/linux/connector.h
> --- linux-2614-rc2-git6/include/linux/connector.h~conn_gfpmask	2005-09-27 21:36:12.000000000 -0700
> +++ linux-2614-rc2-git6/include/linux/connector.h	2005-10-02 20:52:02.000000000 -0700
> @@ -142,7 +142,7 @@ struct cn_dev {
>  
>  int cn_add_callback(struct cb_id *, char *, void (*callback) (void *));
>  void cn_del_callback(struct cb_id *);
> -int cn_netlink_send(struct cn_msg *, u32, int);
> +int cn_netlink_send(struct cn_msg *, u32, unsigned int);
>  
>  int cn_queue_add_callback(struct cn_queue_dev *dev, struct cn_callback *cb);
>  void cn_queue_del_callback(struct cn_queue_dev *dev, struct cb_id *id);

-- 
	Evgeniy Polyakov

--===============23016608183112552==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23016608183112552==--
