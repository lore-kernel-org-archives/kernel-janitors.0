From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 09 Feb 2007 18:01:49 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <45CCB70D.1070602@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Mehul Jani wrote:
>
>
>     >>>Just went through the archives....
>     >>>
>     >>>        I tried to recreate the compile-failure (was some time
>     ago since
>     >>>        it
>     >>>        happened) when using min()/max() in a struct but it
>     happily compiled it
>     >>>        so (thankfully) you are correct, just need to use
>     min()/max(). :)
>     >>>
>     >>>        Richard Knutsson
>     >>>
>     >>>Do you mean to say that you were able to compile when the
>     macros were used inside struct?
>     >>>Im still not able to get that to happen...
>     >>>
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
Oh, it is still unhappy with min()/max() in the above struct. You will 
have to use __min()/__max() directly to please the compiler.
I just modified the other macros since I thought it was unnecessary (and 
error-prone) to define the "algorithm" multiple times + it makes the 
logical statement that __min()/__max() are the unsecure macros and by 
adding type-checking we get the secure min()/max().

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
