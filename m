From: Domen Puncer <domen@coderock.org>
Date: Thu, 26 May 2005 06:15:42 +0000
Subject: Re: [KJ] [PATCH] net/sunrpc string * to [] fix
Message-Id: <20050526061542.GI3851@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67091307677991807=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050525183354.2ba9953a.rnsanchez@terra.com.br>
In-Reply-To: <20050525183354.2ba9953a.rnsanchez@terra.com.br>
To: kernel-janitors@vger.kernel.org

--===============67091307677991807==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Content-Transfer-Encoding: quoted-printable

Please set to plain text (disk.c patch is ok in this regard).


On 25/05/05 18:33 -0300, Ricardo Nabinger Sanchez wrote:
> Hello,
> 
> I'm new here, and would like to help with Kernel-Janitors.  If nobody else
> is working on 'char *s = "string";', I'd like to continue fixing the
> remaining strings (473 to go).
> 
> 
> This patch "fixes" net/sunrpc/sched.c and svcauth_unix.c string
> declarations from 
> 	char *p = "string"
> to
> 	char p[] = "string";
> as pointed by Jeff Garzik on Kernel-Janitors' TODO.
> 
> 
> Apologies for attaching the patch (and not inlining it), but it would be
> mangled otherwise.  I'll try to fix this.
> 
> Best regards.
> 
> ---
> 
>  sched.c        |    2 +-
>  svcauth_unix.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Signed-off-by: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>

Put this line before "---", as everything after it is discarded.

> diff -urNp -X dontdiff linux-2.6.11.10/net/sunrpc/sched.c mod-linux-2.6.11.10/net/sunrpc/sched.c
> --- linux-2.6.11.10/net/sunrpc/sched.c	2005-05-25 17:52:45.000000000 -0300
> +++ mod-linux-2.6.11.10/net/sunrpc/sched.c	2005-05-25 17:54:39.000000000 -0300
> @@ -1054,7 +1054,7 @@ void rpc_show_tasks(void)
>  	printk("-pid- proc flgs status -client- -prog- --rqstp- -timeout "
>  		"-rpcwait -action- --exit--\n");
>  	alltask_for_each(t, le, &all_tasks) {
> -		const char *rpc_waitq = "none";
> +		const char rpc_waitq[] = "none";
>  
>  		if (RPC_IS_QUEUED(t))
>  			rpc_waitq = rpc_qname(t->u.tk_wait.rpc_waitq);

			^^^ this won't work now. Compile test should
				catch this.


Care to resend disk.c patch, as it's missing Signed-off-by (and
this seems to be the only thing wrong with it).


	Domen

--===============67091307677991807==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67091307677991807==--
