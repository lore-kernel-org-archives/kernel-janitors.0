From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 09 Feb 2007 18:10:20 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <45CCB90C.80005@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Mehul Jani wrote:
>
>     >>>I tried that change in linux-2.6/fs/lockd/mon.c
>     >>>
>     >>>static struct rpc_procinfo   nsm_procedures[] = {
>     >>>[SM_MON] = {
>     >>>             .p_proc         = SM_MON,
>     >>>             .p_encode       = (kxdrproc_t) xdr_encode_mon,
>     >>>             .p_decode       = (kxdrproc_t) xdr_decode_stat_res,
>     >>>             .p_bufsiz       = max(SM_mon_sz, SM_monres_sz) << 2,
>
>     Will work since both SM_mon_sz and SM_monres_sz are compile-time
>     constants, not true?
>
>     [ ... snip ... ]
>
>  
> So...
>  
> The patch actually modifies the macro's last line in kernel.h
>  
> -       _x < _y ? _x : _y; })
> +       __min(_x, _y); })
>  
> But what I am unable to understand is why is the compiler unhappy with
> * _x < _y ? _x : _y; })*
>  
> and happy with new macro been called internally *__min(_x,_y);*
Ok, _now_ I see. I used the xdr4.c but mon.c seems happy with the new 
max() (as you asked). Can only say: dunno. It should not make a difference.

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
