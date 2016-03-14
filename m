From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 14 Mar 2016 05:19:37 +0000
Subject: Re: [RFC PATCH V2] checkpatch: Check output format style of __func__ uses
Message-Id: <alpine.DEB.2.02.1603140619030.2139@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <83a6236111861645daa6dee9ae7f7aeb03cd7b14.1457896085.git.joe@perches.com> <5db4d45c04c506d23ab5b35527e2a544e86c4c6d.1457915615.git.joe@perches.com>
In-Reply-To: <5db4d45c04c506d23ab5b35527e2a544e86c4c6d.1457915615.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>, Dan Carpenter <error27@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel@vger.kernel.org

On Sun, 13 Mar 2016, Joe Perches wrote:

> Loggng messages that emit function names have many different forms.
> Perhaps it'd be better for logging consistency and grep ease to
> exclusively use "%s:"
> 
> As well, function tracing logging uses are generally unnecessary given
> the kernel's function tracing (ftrace) capability.
> 
> Right now, grep shows these mixtures of forms:
> 
> 13704	"%s:"
> 3839	"%s "
> 2787	"%s()"
> 
> Some of these are macros definitions of various styles.
> 
> Unfortunately, given the complexity of these macro definition styles,
> checkpatch isn't an ideal tool to find these macros.
> 
> Maybe a coccinelle script might be better suited to find and fix all
> the various types of uses.
> 
> Add a --fix option for these logging messages with __func__.

I'm not good enough at perl to really understand this.  Coudl you give an 
example of what it does, and of what it does not do?

thanks,
julia

> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> v2: Warn on function tracing logging
>     Add --fix option
> 
>  scripts/checkpatch.pl | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 75ce6d0..b695f75 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1415,6 +1415,22 @@ sub raw_line {
>  	return $line;
>  }
>  
> +sub cooked_line {
> +	my ($linenr, $cnt) = @_;
> +
> +	my $offset = $linenr - 1;
> +	$cnt++;
> +
> +	my $line;
> +	while ($cnt) {
> +		$line = $lines[$offset++];
> +		next if (defined($line) && $line =~ /^-/);
> +		$cnt--;
> +	}
> +
> +	return $line;
> +}
> +
>  sub cat_vet {
>  	my ($vet) = @_;
>  	my ($res, $coded);
> @@ -5681,6 +5697,45 @@ sub process {
>  			}
>  		}
>  
> +# check how __func__ is formatted, prefer "%s:...',  __func__
> +		if ($^V && $^V ge 5.10.0 &&
> +		    defined $stat &&
> +		    $stat =~ /\b__func__\b/ &&
> +		    $stat =~ /^\+\s*$logFunctions\s*\(\s*[^"]*$String\s*,\s*__func__\b/m &&
> +		    (() = $stat =~ /^\+|\n\+/g) = 1 &&
> +		    (() = $stat =~ /;/g) <= 1) {
> +			my $herectx = $here . "\n";
> +			my $cooked_linenr = -1;
> +			my $cooked_line = "";
> +			my $raw_line = "";
> +			my $cnt = statement_rawlines($stat);
> +			for (my $n = 0; $n < $cnt; $n++) {
> +				$herectx .= raw_line($linenr, $n) . "\n";
> +				if ($cooked_linenr = -1 && cooked_line($linenr, $n) =~ /$String/) {
> +					$cooked_linenr = $linenr + $n;
> +					$cooked_line = cooked_line($linenr, $n);
> +					$raw_line = raw_line($linenr, $n);
> +				}
> +			}
> +			my $qs = get_quoted_string($cooked_line, $raw_line);
> +			if ($qs =~ /^"\s*%s(?:[\s:\-]*|[\s:\-]*\(\s*\)\s*[\s:\-]*)?(?:enter|entering|entered|exit|exiting)?\s*\.*\s*\\n"$/i) {
> +				if (WARN("FUNC_STYLE",
> +					 "Prefer using ftrace to logging function entry/exit\n" . $herectx) &&
> +				     $cnt = 1 &&
> +				     $fix) {
> +					fix_delete_line($fixlinenr, $rawline);
> +				}
> +			} elsif ($qs !~ /^"%s:/) {
> +				if (WARN("FUNC_STYLE",
> +					 "Prefer using formatting style '%s:' for __func__\n" . $herectx) &&
> +				    $fix) {
> +					$fixed[$cooked_linenr - 1] =~ s/[:\s]*%s(?:[:\s,\-]*|[\s:\-]*\(\s*\)\s*[\s:\-]*)?//;
> +					$fixed[$cooked_linenr - 1] =~ s/"/"%s: /;
> +					$fixed[$cooked_linenr - 1] =~ s/"%s: \\n/"%s\\n/;
> +				}
> +			}
> +		}
> +
>  # check for uses of __DATE__, __TIME__, __TIMESTAMP__
>  		while ($line =~ /\b(__(?:DATE|TIME|TIMESTAMP)__)\b/g) {
>  			ERROR("DATE_TIME",
> -- 
> 2.6.3.368.gf34be46
> 
> 
