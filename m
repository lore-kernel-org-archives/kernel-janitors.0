From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 29 Nov 2005 21:42:55 +0000
Subject: Re: [KJ] use kzalloc instead of kcalloc(1,
Message-Id: <20051129214255.GA7696@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68788822575519237=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <007001c5f392$4c61cda0$3ec0c756@bureau>
In-Reply-To: <007001c5f392$4c61cda0$3ec0c756@bureau>
To: kernel-janitors@vger.kernel.org

--===============68788822575519237==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 29, 2005 at 07:02:13AM +0100, Daniel Marjam?ki wrote:
> I believe you are patching against the wrong version, my friend.
>
> I applied the changes manually and then made a new patch:

:-/ Every time I view it in mutt, everything is OK. Every time I save
email, I get space-space at the beggining of context lines, which, of course,
confuses patch(1).

> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -408,7 +408,7 @@ static inline void add_aggr_kprobe(struc
>  /*
>   * This is the second or subsequent kprobe at the address - handle
>   * the intricacies
> - * TODO: Move kcalloc outside the spin_lock
> + * TODO: Move kzalloc outside the spin_lock
>   */
>  static int __kprobes register_aggr_kprobe(struct kprobe *old_p,
>  					  struct kprobe *p)
> @@ -420,7 +420,7 @@ static int __kprobes register_aggr_kprob
>  		copy_kprobe(old_p, p);
>  		ret = add_new_kprobe(old_p, p);
>  	} else {
> -		ap = kcalloc(1, sizeof(struct kprobe), GFP_ATOMIC);
> +		ap = kzalloc(sizeof(struct kprobe), GFP_ATOMIC);
>  		if (!ap)
>  			return -ENOMEM;
>  		add_aggr_kprobe(ap, old_p);


--===============68788822575519237==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68788822575519237==--
