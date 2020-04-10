From: Joe Perches <joe@perches.com>
Date: Fri, 10 Apr 2020 19:34:56 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <a5c555e6853e9103a871127cafaea34583f426fb.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2020-04-07 at 22:49 +0200, Christophe JAILLET wrote:
> Strings logged with pr_xxx and dev_xxx often lack a trailing '\n'.
> Introduce new tests to try to catch them early.

Unintentional resend?

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This is more a PoC for now.
> 
> Regex could be improved, merged, ...
> We could also check for surrounding pr_cont...
> 
> This patch is based on idea from [1]. coccinelle spots too many places
> where \n are missing (~ 2800 with the heuristic I've used).
> Fixing them would be painful.
> I instead propose to teach checkpatch.pl about it to try to spot cases
> early and avoid introducing new cases.
> 
> [1]: https://marc.info/?l=kernel-janitors&m8619533629657&w=4
> ---
>  scripts/checkpatch.pl | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c392ab8ea12e..792804bd6ad9 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5676,6 +5676,16 @@ sub process {
>  			}
>  		}
>  
> +# check for missing \n at the end of logging function
> +		if ($line =~ /\bpr_(emerg|alert|crit|err|warning|warn|notice|info|debug|dbg)\s*\("([^"]*(?<!\\n))"/) {
> +			WARN("MISSING NL",
> +			     "Possible missing '\\n' at the end of a log message\n" . $hereprev);
> +		}
> +		if ($line =~ /\bdev_(emerg|alert|crit|err|warning|warn|notice|info|debug|dbg)\s*\([^,]*,\s*"([^"]*(?<!\\n))"/) {
> +			WARN("MISSING NL",
> +			     "Possible missing '\\n' at the end of a log message\n" . $hereprev);
> +		}
> +
>  # check for logging functions with KERN_<LEVEL>
>  		if ($line !~ /printk(?:_ratelimited|_once)?\s*\(/ &&
>  		    $line =~ /\b$logFunctions\s*\(.*\b(KERN_[A-Z]+)\b/) {
