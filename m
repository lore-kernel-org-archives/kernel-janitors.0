From: Matthew Wilcox <willy@debian.org>
Date: Fri, 30 Jan 2004 15:02:34 +0000
Subject: Re: [Kernel-janitors] [REDIFF] Fix warning in drivers/net/pppoe.c
Message-Id: <20040130150234.GH18725@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073582302.6115.42.camel@telecentrolivre>
In-Reply-To: <1073582302.6115.42.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 30, 2004 at 10:43:24AM -0200, Luiz Fernando Capitulino wrote:
> diff -X dontdiff -Nru linux-2.6.2-rc2-bk2/drivers/net/pppoe.c linux-2.6.2-rc2-bk2~/drivers/net/pppoe.c
> --- linux-2.6.2-rc2-bk2/drivers/net/pppoe.c	2004-01-30 09:33:19.000000000 -0200
> +++ linux-2.6.2-rc2-bk2~/drivers/net/pppoe.c	2004-01-30 09:53:40.000000000 -0200
> @@ -1076,6 +1076,20 @@
>  	.llseek		= seq_lseek,
>  	.release	= seq_release,
>  };
> +
> +static int __init pppoe_proc_init(void)
> +{
> +	struct proc_dir_entry *p = create_proc_entry("pppoe", S_IRUGO,
> +						     proc_net);

While I normally prefer declaration and initialisation on the same line,
if you have to split the arguments of the initialisation, better to write it
like this:

	struct proc_dir_entry *p;

	p = create_proc_entry("pppoe", S_IRUGO, proc_net);
	if (!p)
		return 1;

> +static int inline pppoe_proc_init(void) { return 1; }

"static inline int" is preferred.

> +
> +	if ((err = pppoe_proc_init())) {
> +		unregister_pppox_proto(PX_PROTO_OE);
> +		err = -ENOMEM;
> +		goto out;
> +	}

	err = pppoe_proc_init();
	if (err) {
		...
	}

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
