From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 10 Apr 2020 17:35:37 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <6e52383e-100d-b016-32c2-6fb54938b6fe@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
 <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
In-Reply-To: <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 08/04/2020 à 04:14, Joe Perches a écrit :
> This works rather better:
>
> Perhaps you could test?
> ---
>
> v2:
>
> o Avoid pr_cont
> o Use only last format line if split across multiple lines
>
>   scripts/checkpatch.pl | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index d64c67..f00a6c8 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5673,6 +5673,28 @@ sub process {
>   			}
>   		}
>   
> +# check for possible missing newlines at the end of common logging functions
> +		if (defined($stat) &&
> +		    $stat =~ /^\+\s*($logFunctions)\s*\((?:\s*$FuncArg\s*,\s*){0,3}\s*$String/ &&
> +		    $1 !~ /_cont$/ && $1 =~ /^(?:pr|dev|netdev|netif|wiphy)_/) {
> +			my $cnt = statement_rawlines($stat);
> +			my $extracted_string = "";
> +			for (my $i = 0; $i < $cnt; $i++) {
> +				next if ($lines[$linenr + $i - 1] !~ /$String\s*[,\)]/);
> +				$extracted_string = get_quoted_string($lines[$linenr + $i - 1],
> +								      $rawlines[$linenr + $i - 1]);
> +				last if ($extracted_string ne "");
> +			}
> +			if ($extracted_string ne "" && $extracted_string !~ /\\n"$/) {
> +				my $herectx = $here . "\n";
> +				for (my $n = 0; $n < $cnt; $n++) {
> +					$herectx .=  raw_line($linenr, $n) . "\n";
> +				}
> +				WARN("MISSING_FORMAT_NEWLINE",
> +				     "Possible missing '\\n' at the end of a logging message format string\n" . $herectx);
> +			}
> +		}
> +
>   # check for logging functions with KERN_<LEVEL>
>   		if ($line !~ /printk(?:_ratelimited|_once)?\s*\(/ &&
>   		    $line =~ /\b$logFunctions\s*\(.*\b(KERN_[A-Z]+)\b/) {


Hi,

I'm looking at some modification done in the last month that could have 
been spotted by the above script.

     ./scripts/checkpatch.pl -f drivers/usb/phy/phy-jz4770.c

correctly spots the 3 first cases, but the 3 last (line 202, 210 and 
217) are missed.
I don't understand why.

CJ
