From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 01 Jun 2020 17:17:54 +0000
Subject: Re: [PATCH] kernel: power: swap: mark a function as __init to save some memory
Message-Id: <71346705-6882-d2ca-3c53-1a5b23d66bbf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531210059.647066-1-christophe.jaillet@wanadoo.fr>
 <effe3cde7b1f188427c42c476f5a96251d837416.camel@perches.com>
In-Reply-To: <effe3cde7b1f188427c42c476f5a96251d837416.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, rjw@rjwysocki.net, pavel@ucw.cz, len.brown@intel.com, Dan Carpenter <error27@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 01/06/2020 à 00:11, Joe Perches a écrit :
> (adding Dan Carpenter)
> 
> On Sun, 2020-05-31 at 23:00 +0200, Christophe JAILLET wrote:
>> 'swsusp_header_init()' is only called via 'core_initcall'.
>> It can be marked as __init to save a few bytes of memory.
> 
> Hey Dan
> 
> smatch has a full function calling tree right?
> 
> Can smatch find unmarked functions called only by __init
> functions so those unmarked functions can be appropriately
> marked with __init like the below?
> 

Hi, in case of interest for anyone, I actually find such things as follow:
    - grep to spot xxx_initcall macro (see comments in the perl script 
below)
    - a perl script which tries to spot missing __init

The false positive rate is low.
Feel free to use and propose patches based on it.

CJ

________________________________________________
#!/usr/bin/perl

use warnings;
use strict;

# grep -r --include=*.c -E 
'^[[:space:]]*(early|core|postcore|arch|subsys|fs|device|late)_initcall\(.*\)' 
* > tmp.txt
my $tmp="tmp.txt";

open(my $fh, "<", $tmp);
while (my $line = <$fh>) {
         # Each line looks like:
         #      net/mac80211/main.c:subsys_initcall(ieee80211_init);
         if ($line =~ /^(.*):.*\((.*)\)/) {
             system("grep -E '$2\\(void' $1 | grep -v -E '__.*init'");
         }
}
close($fh)


>> ---
>>   kernel/power/swap.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
>> index ca0fcb5ced71..01e2858b5fe3 100644
>> --- a/kernel/power/swap.c
>> +++ b/kernel/power/swap.c
>> @@ -1590,7 +1590,7 @@ int swsusp_unmark(void)
>>   }
>>   #endif
>>   
>> -static int swsusp_header_init(void)
>> +static int __init swsusp_header_init(void)
>>   {
>>   	swsusp_header = (struct swsusp_header*) __get_free_page(GFP_KERNEL);
>>   	if (!swsusp_header)
> 
> 
