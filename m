From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 08 Apr 2020 20:19:17 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <48f32229-068d-cc62-b6df-03cdc11b99a4@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
 <437746b14735ecef311720ad41d5b237209e9674.camel@perches.com>
In-Reply-To: <437746b14735ecef311720ad41d5b237209e9674.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, apw@canonical.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Le 08/04/2020 à 02:33, Joe Perches a écrit :
> On Tue, 2020-04-07 at 22:49 +0200, Christophe JAILLET wrote:
>> Strings logged with pr_xxx and dev_xxx often lack a trailing '\n'.
>> Introduce new tests to try to catch them early.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> This is more a PoC for now.
>>
>> Regex could be improved, merged, ...
>> We could also check for surrounding pr_cont...
>>
>> This patch is based on idea from [1]. coccinelle spots too many places
>> where \n are missing (~ 2800 with the heuristic I've used).
>> Fixing them would be painful.
>> I instead propose to teach checkpatch.pl about it to try to spot cases
>> early and avoid introducing new cases.
>>
>> [1]: https://marc.info/?l=kernel-janitors&m8619533629657&w=4
>> ---
>>   scripts/checkpatch.pl | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index c392ab8ea12e..792804bd6ad9 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -5676,6 +5676,16 @@ sub process {
>>   			}
>>   		}
>>   
>> +# check for missing \n at the end of logging function
>> +		if ($line =~ /\bpr_(emerg|alert|crit|err|warning|warn|notice|info|debug|dbg)\s*\("([^"]*(?<!\\n))"/) {
>> +			WARN("MISSING NL",
>> +			     "Possible missing '\\n' at the end of a log message\n" . $hereprev);
>> +		}
>> +		if ($line =~ /\bdev_(emerg|alert|crit|err|warning|warn|notice|info|debug|dbg)\s*\([^,]*,\s*"([^"]*(?<!\\n))"/) {
>> +			WARN("MISSING NL",
>> +			     "Possible missing '\\n' at the end of a log message\n" . $hereprev);
>> +		}
> This can't work as string is masked to "XXX"

Ok. I wasn't aware of that.

I tested the regex with regex101.org and only tested with patches that 
trigger the checkpatch.pl test, and it worked fine for me.
I didn't test with string with trailing \n, that should NOT trigger the 
test. I should have! :(

> This is probably better using $stat and checking if a "XX" format
> string exists as 1st or 2nd arg and adding an extraction
> from the $rawline equivalent and checking that.
>
> Also this test should probably using $logFunctions and check
> if the initial block is one of the known functions that
> use a newline termination (pr_|dev_|netdev_|wiphy_)

Agreed but your perl and regex is much more fluent than mine. ;-)

CJ
