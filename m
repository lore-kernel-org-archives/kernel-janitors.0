From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Mon, 06 Jul 2015 11:24:37 +0000
Subject: Re: [PATCH] kprobes: Delete an unnecessary check before the function call "module_put"
Message-Id: <559A6575.9080605@hitachi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <546899CF.8020808@users.sourceforge.net> <5469B08E.90104@hitachi.com> <546C41EF.4040502@users.sourceforge.net> <546D65C6.3030109@hitachi.com> <559794F9.3050800@users.sourcefor
 ge.net>
In-Reply-To: <559794F9.3050800@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, "David S. Miller" <davem@davemloft.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On 2015/07/04 17:10, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 4 Jul 2015 10:00:26 +0200
> 
> The module_put() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 

OK, looks good to me.


Acked-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  kernel/kprobes.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index c90e417..52e3529 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1531,10 +1531,7 @@ int register_kprobe(struct kprobe *p)
>  
>  out:
>  	mutex_unlock(&kprobe_mutex);
> -
> -	if (probed_mod)
> -		module_put(probed_mod);
> -
> +	module_put(probed_mod);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(register_kprobe);
> 


-- 
Masami HIRAMATSU
Linux Technology Research Center, System Productivity Research Dept.
Center for Technology Innovation - Systems Engineering
Hitachi, Ltd., Research & Development Group
E-mail: masami.hiramatsu.pt@hitachi.com
