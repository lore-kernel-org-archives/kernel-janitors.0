From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 05 Feb 2004 10:20:19 +0000
Subject: Re: [Kernel-janitors] New guy here, and patch for kj.pl
Message-Id: <402218E3.6060300@gmx.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125123747.GA21585@noos.fr>
In-Reply-To: <20040125123747.GA21585@noos.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi! I'm another new guy here on kj and a few days ago I wrote a little 
patch to show that I want to tackle the removal of some unnecessary 
min/max-methods in the kernel.

I didnt get any feedback yet, but I guess since nobody screamed (and I 
found some more occurences) I'm going to try my best.

Also being new to kernel hacking (and the depth of c-programming) I have 
a question, which hopefully one of you can help me with:

For example fs/lockd/mon.c has a MAX-function which is used in

#ifndef MAX
# define MAX(a, b)....
#endif

static struct rpc_procinfo	nsm_procedures[] = {
[SM_MON] = {
		.p_proc		= SM_MON,
		.p_encode	= (kxdrproc_t) xdr_encode_mon,
		.p_decode	= (kxdrproc_t) xdr_decode_stat_res,
		.p_bufsiz	= MAX(SM_mon_sz, SM_monres_sz) << 2,
	},
[SM_UNMON] = {
		.p_proc		= SM_UNMON,
		.p_encode	= (kxdrproc_t) xdr_encode_unmon,
		.p_decode	= (kxdrproc_t) xdr_decode_stat,
		.p_bufsiz	= MAX(SM_mon_id_sz, SM_unmonres_sz) << 2,
	},
};

but replacing the call of it with max(...) from kernel.h results in 
following:

CC      fs/lockd/mon.o
fs/lockd/mon.c:216: error: braced-group within expression allowed only 
inside a function
fs/lockd/mon.c:216: error: initializer element is not constant
fs/lockd/mon.c:216: error: (near initialization for 
`nsm_procedures[2].p_bufsiz')
fs/lockd/mon.c:216: error: parse error before ')' token
fs/lockd/mon.c:216: error: initializer element is not constant
fs/lockd/mon.c:216: error: (near initialization for `nsm_procedures[2]')
fs/lockd/mon.c:218: error: parse error before '[' token
fs/lockd/mon.c:222: error: parse error before "void"
fs/lockd/mon.c:179: warning: `xdr_encode_unmon' defined but not used
fs/lockd/mon.c:199: warning: `xdr_decode_stat' defined but not used
make[2]: *** [fs/lockd/mon.o] Error 1
make[1]: *** [fs/lockd] Error 2
make: *** [fs] Error 2

Can anyone help me with that error code?

Thanks in advance
Michael Veeck



Randy.Dunlap schrieb:
> On Sun, 25 Jan 2004 13:37:47 +0100 JOUANNE Mickael <grigouze@noos.fr> wrote:
> 
> (did anyone reply to your question?)
> 
> It's best to let the mailing list know that you plan to tackle
> something, in case someone else is already working on it.
> 
> It's also a good idea to post some changes early so that you get
> some feedback on them before spending lots of time on it and
> that time being wasted in the case that it's all wrong/bad.
> 
> --
> ~Randy
> kernel-janitors project:  http://janitor.kernelnewbies.org/
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
