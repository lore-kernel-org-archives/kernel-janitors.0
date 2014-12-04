From: Joe Perches <joe@perches.com>
Date: Thu, 04 Dec 2014 02:47:25 +0000
Subject: Re: [PATCH] checkpatch: allow uppercase logging function names
Message-Id: <1417661245.2902.31.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417660721-13330-1-git-send-email-wwiser@gmail.com>
In-Reply-To: <1417660721-13330-1-git-send-email-wwiser@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2014-12-03 at 21:38 -0500, Wesley Wiser wrote:
> Some kernel logging functions are prefixed with uppercase letters such
> as TP_printk, DUMP_printk, DBG_printk, DEBC_printk, etc. The previous
> behavior only allowed logging functions (which may exceed the 80
> character line limit) to be prefixed by lowercase letters and numbers.

I'm not sure that these should be encouraged.
I'd prefer to make these lower case instead.

The regex also allows mixed case like Tp_printk.

Maybe if it was something like
(?:[a-z0-9]+_|[A-Z0-9]+_){1,2}

but it still seems undesirable.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 374abf4..3b08f1e 100755
> --- 
> +++ b/scripts/checkpatch.pl
> @@ -343,7 +343,7 @@ our $typeTypedefs = qr{(?x:
>  
>  our $logFunctions = qr{(?x:
>  	printk(?:_ratelimited|_once|)|
> -	(?:[a-z0-9]+_){1,2}(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|cont|WARN)(?:_ratelimited|_once|)|
> +	(?:[a-zA-Z0-9]+_){1,2}(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|cont|WARN)(?:_ratelimited|_once|)|
>  	WARN(?:_RATELIMIT|_ONCE|)|
>  	panic|
>  	MODULE_[A-Z_]+|



