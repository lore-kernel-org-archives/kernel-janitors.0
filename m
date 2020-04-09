From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 09 Apr 2020 07:24:22 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <60c732a1-aa4e-afab-d223-894a67713003@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
 <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
 <4b7e1cf3-6fa7-60af-a1d3-2457339dbe8a@wanadoo.fr>
 <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
In-Reply-To: <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 09/04/2020 à 05:10, Joe Perches a écrit :
> On Wed, 2020-04-08 at 22:23 +0200, Marion & Christophe JAILLET wrote:
>> Le 08/04/2020 à 04:14, Joe Perches a écrit :
>>> This works rather better:
>>>
>>> Perhaps you could test?
>>> ---
>>>
>>> v2:
>>>
>>> o Avoid pr_cont
>>> o Use only last format line if split across multiple lines
>>>
>>>    scripts/checkpatch.pl | 22 ++++++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index d64c67..f00a6c8 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -5673,6 +5673,28 @@ sub process {
>>>    			}
>>>    		}
>>>    
>>> +# check for possible missing newlines at the end of common logging functions
>>> +		if (defined($stat) &&
>>> +		    $stat =~ /^\+\s*($logFunctions)\s*\((?:\s*$FuncArg\s*,\s*){0,3}\s*$String/ &&
>>> +		    $1 !~ /_cont$/ && $1 =~ /^(?:pr|dev|netdev|netif|wiphy)_/) {
>>> +			my $cnt = statement_rawlines($stat);
>>> +			my $extracted_string = "";
>>> +			for (my $i = 0; $i < $cnt; $i++) {
>>> +				next if ($lines[$linenr + $i - 1] !~ /$String\s*[,\)]/);
>>> +				$extracted_string = get_quoted_string($lines[$linenr + $i - 1],
>>> +								      $rawlines[$linenr + $i - 1]);
>>> +				last if ($extracted_string ne "");
>>> +			}
>>> +			if ($extracted_string ne "" && $extracted_string !~ /\\n"$/) {
>>> +				my $herectx = $here . "\n";
>>> +				for (my $n = 0; $n < $cnt; $n++) {
>>> +					$herectx .=  raw_line($linenr, $n) . "\n";
>>> +				}
>>> +				WARN("MISSING_FORMAT_NEWLINE",
>>> +				     "Possible missing '\\n' at the end of a logging message format string\n" . $herectx);
>>> +			}
>>> +		}
>>> +
>>>    # check for logging functions with KERN_<LEVEL>
>>>    		if ($line !~ /printk(?:_ratelimited|_once)?\s*\(/ &&
>>>    		    $line =~ /\b$logFunctions\s*\(.*\b(KERN_[A-Z]+)\b/) {
>>>
>> For what I wanted to check and according to the few tests I've made, it
>> looks fine.
>>
>> Thank you very much for sharing this much more robust (and working)
>> alternative.
>>
>> For what it worth: (i.e. much more tests should be done)
>> Tested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Then I think you really haven't tested it very thoroughly.
>
> For instance:
>
> $ git ls-files -- 'drivers/*.[ch]' | \
>    xargs ./scripts/checkpatch.pl -f --quiet --no-summary --types=MISSING_FORMAT_NEWLINE
>
> emits many false positives.
>
> Some types of false positives:
>
> o Many of the formats seem to end in a ':' or a ' '
>    maybe those should be excluded
>     #86: FILE: drivers/android/binder_alloc_selftest.c:86:
>     +	pr_err("free seq: ");
>
>     o Split string formats should be excluded better
>       as only the first string fragment is checked:
>     #1001: FILE: drivers/ata/pata_octeon_cf.c:1001:
>     +	dev_info(&pdev->dev, "version " DRV_VERSION" %d bit%s.\n",
>     +		 is_16bit ? 16 : 8,
>     +		 cf_port->is_true_ide ? ", True IDE" : "");
>
>     probably a few others, including a desire to check
>     if a pr_cont is below the use within a few lines.
>
>     > Maybe, at least a Suggested-By: would be appreciated.
>
> No worries, when it's cooked, it'll have that.
>
> cheers, Joe
>
>
I think that, at least printk(), WARN() and co, and panic() should also 
be handled the same way.


A few files (5 according to my grep) also have something like:
    #define pr_fmt(fmt) "bcache: %s()" fmt "\n", __func__
and then sometimes a mix of pr_xxx() with either trailing \n or not.

Maybe those should be handled manually to be consistent and avoid a "\n" 
in pr_fmt which is not widely used in other files

CJ
