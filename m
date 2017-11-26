From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 26 Nov 2017 05:51:01 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <alpine.DEB.2.20.1711260648130.2387@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
In-Reply-To: <20171126054037.9743-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>



On Sat, 25 Nov 2017, Logan Gunthorpe wrote:

> Check for lines with a log function using a relatively strict regular
> expression catching only printk, dev_* and pr_* functions. Once
> one is found, accumulate further lines for any functions that
> are split over multiple lines.

I don't understand at all the second sentence.  Are you staying with the
same call, or moving on to other calls?  Also, it would be the call that
is split over multiple lines, not the function split over multiple lines.

I think this would have been much easier with Cocccinelle where the code
is parsed and the control-flow graph is available to see whether there is
a pr_cont afterwards.  But if it works, then it is surely good enough.

julia

> Stop accumulating the log function line
> when we find a ';' or match the full format string.
>
> A get_log_fmt() function is used to find either the first or
> second argument (depending on the log function matched) as the
> format string. If the format argument ends in '\n"', then we conclude
> that the logging call is correct. If the line ends in '%s"', then we
> only print a CHK warning as the developer *may* have the newline in an
> argument string. Otherwise we print a warning that the line is
> likely missing a new line.
>
> Because we are trying to match multiple lines, we must also match
> lines that are part of the context of the patch. In order to ensure
> we don't print a message on log lines that are only part of context,
> we track that at least one line was added using the $log_func_changed
> flag.
>
> To handle continuations, during pre-processing we search for all
> pr_cont and KERN_CONT instances and create a hash set of the line
> numbers of all preceding log function calls. The hash set is then used
> to mask out any calls that are likely followed by continuations. This
> should handle many cases, however a small number of false positives are
> likely going to occur in cases where a patch's context does not cover
> the following KERN_CONT. This is acceptable, in my opinion, seeing
> KERN_CONT is already discouraged and will create it's own warnings that
> the developer has to reason about.
>
> I've created a small test suite to test this change which can be found
> on github[1]. I've also run this on the kernel source and found more
> than 6000 violations. I reviewed a random sampling of these for false
> positives and have not found any.
>
> Thanks to Joe for describing how to properly test a change such as this.
>
> [1] https://github.com/lsgunth/checkpatch-tests
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Cc: Andy Whitcroft <apw@canonical.com>
> Cc: Joe Perches <joe@perches.com>
> ---
>
> Here's my second attempt at this. As described in the commit log,
> I've made it a bit more sophisticated and fixed a number of issues with
> how the patch format is processed. The testing has also improved
> significantly having run it on the entire kernel source as well as
> a suite of test cases. The patch isn't entirely perfect (per the note
> about false positives) but I feel it's close enough that its benefits
> outweighs this. (As it only annoys developers who are working with a
> discouraged feature.)
>
> As mentioned in the commit log, I've found more than 6000 instances
> that look like this error. I've seen a few cases that appear to have
> intended to use KERN_CONT but didn't and are thus caught by this.
> If there are any heroic kernel janitors that are interested in tackling
> these issues, the list can be found here:
>
> https://github.com/lsgunth/checkpatch-tests/blob/master/results/v4.14
>
>  scripts/checkpatch.pl | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8b80bac055e4..cdd767af6566 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -460,6 +460,34 @@ our $logFunctions = qr{(?x:
>  	seq_vprintf|seq_printf|seq_puts
>  )};
>
> +
> +our $logNewLineFirstArg = qr{(?x:
> +	printk(?:_ratelimited|_once|_deferred_once|_deferred|)|
> +	pr_(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|cont|WARN)(?:_ratelimited|_once|)
> +)};
> +
> +our $logNewLineSecondArg = qr{(?x:
> +	dev_(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|WARN)(?:_ratelimited|_once|)
> +)};
> +
> +our $logNewLineFunctions = qr{(?x:
> +    $logNewLineFirstArg |
> +    $logNewLineSecondArg
> +)};
> +
> +sub get_log_fmt {
> +	my ($line, $rawline) = @_;
> +
> +	if ($line =~ m/\b$logNewLineFirstArg\(([^,)]+)[,)]/g) {
> +		return substr($rawline, $-[1], $+[1] - $-[1]);
> +	} elsif($line =~ m/\b$logNewLineSecondArg\([^,]+,([^,)]+)[,)]/g) {
> +		return substr($rawline, $-[1], $+[1] - $-[1]);
> +	} else {
> +		return "";
> +	}
> +}
> +
> +
>  our $signature_tags = qr{(?xi:
>  	Signed-off-by:|
>  	Acked-by:|
> @@ -2224,6 +2252,13 @@ sub process {
>
>  	my $camelcase_file_seeded = 0;
>
> +	my $in_log_function = 0;
> +	my $log_func_changed = 0;
> +	my $log_func_line = "";
> +	my $log_func_rawline = "";
> +	my $log_last_linenr = -1;
> +	my %log_func_continued = ();
> +
>  	sanitise_line_reset();
>  	my $line;
>  	foreach my $rawline (@rawlines) {
> @@ -2287,6 +2322,15 @@ sub process {
>  			# simplify matching -- only bother with positive lines.
>  			$line = sanitise_line($rawline);
>  		}
> +
> +		if ($log_last_linenr > 0 && $line =~ /(KERN_CONT|pr_cont)/) {
> +			$log_func_continued{$log_last_linenr} = ();
> +		}
> +
> +		if ($line =~ /\b$logNewLineFunctions\(/) {
> +			$log_last_linenr = $linenr;
> +		}
> +
>  		push(@lines, $line);
>
>  		if ($realcnt > 1) {
> @@ -2321,6 +2365,7 @@ sub process {
>  		    $line =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@(.*)/) {
>  			my $context = $4;
>  			$is_patch = 1;
> +			$in_log_function = 0;
>  			$first_line = $linenr + 1;
>  			$realline=$1-1;
>  			if (defined $2) {
> @@ -3505,6 +3550,41 @@ sub process {
>  		}
>  		$prev_values = substr($curr_values, -1);
>
> +# check for logging functions with lines that don't end in a '\n"'
> +		if ($line =~ /\b$logNewLineFunctions\(/ &&
> +		    !exists $log_func_continued{$linenr}) {
> +			$in_log_function = 1;
> +			$log_func_changed = 0;
> +			$log_func_rawline = "";
> +			$log_func_line = "";
> +		}
> +		if ($in_log_function) {
> +			if ($line =~ /^\+/)  {
> +				$log_func_changed = 1;
> +			}
> +
> +			$log_func_rawline .= $rawline;
> +			$log_func_line .= $line;
> +			my $fmt_string = get_log_fmt($log_func_line,
> +						     $log_func_rawline);
> +
> +			if ($fmt_string && !$log_func_changed) {
> +				$in_log_function = 0;
> +			} elsif ($fmt_string =~ /\\n"$/) {
> +				$in_log_function = 0;
> +			} elsif ($fmt_string =~ /%s"$/) {
> +				CHK("LOGGING_MISSING_NEWLINE",
> +				    "Log message may not end in new line (\\n)\n" . $herecurr);
> +				$in_log_function = 0;
> +			} elsif ($fmt_string =~ /"$/) {
> +				WARN("LOGGING_MISSING_NEWLINE",
> +				     "Log messages should end in a line feed (\\n)\n" . $herecurr);
> +				$in_log_function = 0;
> +			} elsif ($line =~ /;$/) {
> +				$in_log_function = 0;
> +			}
> +		}
> +
>  #ignore lines not being added
>  		next if ($line =~ /^[^\+]/);
>
> --
> 2.11.0
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
