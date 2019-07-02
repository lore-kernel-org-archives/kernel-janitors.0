From: Joe Perches <joe@perches.com>
Date: Tue, 02 Jul 2019 16:08:04 +0000
Subject: Re: [PATCH] openpromfs: Adjust three seq_printf() calls in property_show()
Message-Id: <c26343465261e636ef029b8d0d7cb46183a23d23.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <22563348-fefa-8540-9d71-de37764f0596@web.de>
In-Reply-To: <22563348-fefa-8540-9d71-de37764f0596@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

On Tue, 2019-07-02 at 17:40 +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 Jul 2019 17:24:27 +0200
> 
> A bit of information should be put into a sequence.
> Thus improve the execution speed for this data output by better usage
> of corresponding functions.
> 
> This issue was detected by using the Coccinelle software.

(wasn't Markus perma-banned?)

> diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
[]
> @@ -76,14 +76,14 @@ static int property_show(struct seq_file *f, void *v)
>  		while (len > 0) {
>  			int n = strlen(pval);
> 
> -			seq_printf(f, "%s", (char *) pval);
> +			seq_puts(f, (char *) pval);
> 
>  			/* Skip over the NULL byte too.  */
>  			pval += n + 1;
>  			len -= n + 1;
> 
>  			if (len > 0)
> -				seq_printf(f, " + ");
> +				seq_puts(f, " + ");
>  		}
>  	} else {
>  		if (len & 3) {
> @@ -111,8 +111,7 @@ static int property_show(struct seq_file *f, void *v)
>  			}
>  		}
>  	}
> -	seq_printf(f, "\n");
> -
> +	seq_putc(f, '\n');
>  	return 0;
>  }

If this is really useful (and it's really not),
at least change void *pval to char *pval and
remove a bunch of useless casts.
