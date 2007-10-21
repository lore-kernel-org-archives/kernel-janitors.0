From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 21 Oct 2007 19:06:09 +0000
Subject: Re: [PATCH] VSC_GSC_HSC bus debugging
Message-Id: <20071021190609.GA8421@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <471B926D.10009@tiscali.nl>
In-Reply-To: <471B926D.10009@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 21, 2007 at 07:54:53PM +0200, Roel Kluin wrote:
> +config GSC_DEBUG
> +	bool "VSC_GSC_HSC bus debugging"

What an ugly prompt string ...

> +	depends on GSC
> +	default n

default is 'n', by default.  No need to specify it.

> +#ifdef GSC_DEBUG
> +	#define DEBUG 1
> +#endif

Why the indent?

> -	DEBPRINTK("%s intr, mask=0x%x\n", gsc_asic->name, irr);
> +	printk("%s intr, mask=0x%x\n", gsc_asic->name, irr);

Presumably you meant pr_debug?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
