From: Matthew Wilcox <willy@debian.org>
Date: Fri, 30 Jan 2004 18:20:11 +0000
Subject: Re: [Kernel-janitors] [REDIFF] Fix warning in drivers/net/pppoe.c
Message-Id: <20040130182011.GJ18725@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073582302.6115.42.camel@telecentrolivre>
In-Reply-To: <1073582302.6115.42.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 30, 2004 at 04:07:59PM -0200, Luiz Fernando Capitulino wrote:
> this version have the Matthew's hints.

Sorry to do this to you ...

> +#else /* CONFIG_PROC_FS */
> +static inline int pppoe_proc_init(void) { return 1; }
>  #endif /* CONFIG_PROC_FS */

> +	err = pppoe_proc_init();
> +	if (err) {
> +		unregister_pppox_proto(PX_PROTO_OE);
> +		err = -ENOMEM;
> +		goto out;
> +	}

Shouldn't the stub function return 0 (no error)?  Otherwise we'll always
unregister the protocol.

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
