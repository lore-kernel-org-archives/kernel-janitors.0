From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 03 Dec 2020 19:07:04 +0000
Subject: Re: [RFC PATCH] checkpatch: correctly detect lines of help text
Message-Id: <35b5a3fd-7b15-1173-b64a-b20839706527@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <133ac827-c0d2-c5c7-39d8-7d2c17de7c76@fau.de>
 <8436bc4191d92af283ea6aa7ca450e36da653e2e.camel@perches.com>
 <16f0bfd4-61ca-48d8-c9ab-10bfc9a233ad@infradead.org>
 <a83033e9fcc706be129e9c4c0d30a0542f13d406.camel@perches.com>
 <7a81a3c0-2734-4799-5b34-0a6279c1e59d@infradead.org>
 <40543766190a1d5e054e6573ae00112467acf964.camel@perches.com>
In-Reply-To: <40543766190a1d5e054e6573ae00112467acf964.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, Nicolai Fischer <nicolai.fischer@fau.de>, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Cc: apw@canonical.com, johannes.czekay@fau.de, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@i4.cs.fau.de

On 12/3/20 11:04 AM, Joe Perches wrote:
> On Thu, 2020-12-03 at 10:31 -0800, Randy Dunlap wrote:
>> On 12/3/20 9:58 AM, Joe Perches wrote:
>>> On Wed, 2020-12-02 at 10:59 -0800, Randy Dunlap wrote:
>>>
>>>> There are also large hunks of block/Kconfig and drivers/hid/Kconfig
>>>> that don't use any indentation for help text...
>>>> in case that matters here.
>>>
>>> Maybe something like this could help.
>>>
>>> Indent the unindented help blocks by 2 spaces and reflow where appropriate.
>>>
>>> ---
>>>  block/Kconfig       | 105 +++++-----
>>>  drivers/hid/Kconfig | 549 +++++++++++++++++++++++++++-------------------------
>>>  2 files changed, 335 insertions(+), 319 deletions(-)
>>
>>
>> LGTM. Thanks.
> 
> btw: there appears to be ~750 help sections in Kconfig files
> that do not use 2 space indentation for the help content vs
> the ~14000 help sections that do use 2 space indentation.
> 
> Maybe there's some value in standardizing on the 2 space style.

coding-style.rst implies to mean that we have already done that:

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


> 
> A trivial script to show the sections that don't use 2 spaces:
> 
> $ git grep -n -A1 -P "^\s*help\s*$" -- '*/Kconfig*' |
>   grep -v '^--$' |
>   perl -e 'while (<>) {
>     my $line1 = $_;
>     my $line2 = <>;
> 
>     my $l1 = $line1;
>     my $l2 = $line2;
> 
>     chomp($l1);
>     chomp($l2);
> 
>     $l1 =~ s/^.*:\d+:(\s*).*/$1/;
>     $l2 =~ s/^.*-\d+-(\s*).*/$1/;
> 
>     if ("$l1  " ne "$l2") {
> 	print "$line1";
> 	print "$line2";
>     }
> }'
> 
> Change the ne to eq to see the matches.
> 
> For instance, a head -50 of the above is:
> 
[snip]

thanks.
-- 
~Randy
