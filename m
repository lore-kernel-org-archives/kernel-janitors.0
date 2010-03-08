From: Mike Christie <michaelc@cs.wisc.edu>
Date: Mon, 08 Mar 2010 20:57:29 +0000
Subject: Re: [patch] iscsi: change & to &&
Message-Id: <4B9564B9.5000202@cs.wisc.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100308122157.GI6469@bicker>
In-Reply-To: <20100308122157.GI6469@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "James E.J. Bottomley" <James.Bottomley-l3A5Bk7waGM@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, open-iscsi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 03/08/2010 06:21 AM, Dan Carpenter wrote:
> This change is basically a clean up.
>
> datadgst_en is an int which comes from the user.  I didn't see anything
> limiting it to 1 and 0 although obviously that's what it's supposed to
> be.  If the user passed in 2 this test would fail.
>
> This same if condition is repeated in another function and it uses&&
> there.
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>
>
> diff --git a/drivers/scsi/libiscsi_tcp.c b/drivers/scsi/libiscsi_tcp.c
> index 4ad87fd..3794d29 100644
> --- a/drivers/scsi/libiscsi_tcp.c
> +++ b/drivers/scsi/libiscsi_tcp.c
> @@ -420,7 +420,7 @@ iscsi_tcp_data_recv_prep(struct iscsi_tcp_conn *tcp_conn)
>   	struct iscsi_conn *conn = tcp_conn->iscsi_conn;
>   	struct hash_desc *rx_hash = NULL;
>
> -	if (conn->datadgst_en&
> +	if (conn->datadgst_en&&
>   	!(conn->session->tt->caps&  CAP_DIGEST_OFFLOAD))
>   		rx_hash = tcp_conn->rx_hash;
>

Doh. Thanks!

Reviewed-by: Mike Christie <michaelc@cs.wisc.edu>
