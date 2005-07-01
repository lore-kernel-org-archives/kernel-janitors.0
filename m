From: Domen Puncer <domen@coderock.org>
Date: Fri, 01 Jul 2005 22:15:05 +0000
Subject: [KJ] Re: GCC4 warning: no return statement in function returning
Message-Id: <20050701221504.GA26388@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80804243724865343=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80804243724865343==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/07/05 11:19 -0700, Jesse Millan wrote:
> 

> 
> 
> Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>
> 
> The function kauditd_thread() does not return an integer as the declaration
> says it should. There is no return statement in the body whatsoever and looks
> like the function should have been declared as returning void.
> ---

Can you put Signed-off-by at end of description, I don't think I've
seen it elsewhere often. And please try to make Subjects that are
different for every patch.

> 
> 
> diff -puN kernel/audit.c~audit-patch kernel/audit.c
> --- linux-2.6.13-rc1.kj.jm.gcc4/kernel/audit.c~audit-patch	2005-07-01 10:59:36.417950168 -0700
> +++ linux-2.6.13-rc1.kj.jm.gcc4-jessem/kernel/audit.c	2005-07-01 11:00:52.979311072 -0700
> @@ -275,7 +275,7 @@ static int audit_set_failure(int state, 
>  	return old;
>  }
>  
> -int kauditd_thread(void *dummy)
> +void kauditd_thread(void *dummy)

This should warn too, as kthread_create() (kthread_run()) accepts
int (*threadfn)(void *data)

I think kauditd_thread() should be fixed here to return something...
"The return value should be zero or a negative error number:
 it will be passed to kthread_stop()."

>  {
>  	struct sk_buff *skb;
>  
> _

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============80804243724865343==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80804243724865343==--
