From: Daniel Borkmann <daniel@iogearbox.net>
Date: Fri, 18 May 2018 08:27:18 +0000
Subject: Re: [PATCH 1/2] bpf: sockmap, double free in __sock_map_ctx_update_elem()
Message-Id: <e9dc40fb-ffa6-58af-d9df-eaab2d0a9259@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180518075810.GA28285@mwanda>
In-Reply-To: <20180518075810.GA28285@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 05/18/2018 09:58 AM, Dan Carpenter wrote:
> We accidentally free "e" twice.
>=20
> Fixes: 81110384441a ("bpf: sockmap, add hash map support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/kernel/bpf/sockmap.c b/kernel/bpf/sockmap.c
> index c6de1393df63..216d5c9b0eb3 100644
> --- a/kernel/bpf/sockmap.c
> +++ b/kernel/bpf/sockmap.c
> @@ -1833,7 +1833,6 @@ static int __sock_map_ctx_update_elem(struct bpf_ma=
p *map,
>  	if (tx_msg)
>  		bpf_prog_put(tx_msg);
>  	write_unlock_bh(&sock->sk_callback_lock);
> -	kfree(e);
>  	return err;
>  }

Thanks for the two fixes, appreciate it! There were two similar ones that
fix the same issues which were already applied yesterday to bpf-next:

https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=
=0E4364560361d57e8cd873a8990327f3471d7d8a
https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=
=A78622932c27e8ec33e5ba180f3d2e87fb806b28
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
