From: Kevin Wern <kevin.m.wern@gmail.com>
Date: Sat, 06 Feb 2016 06:58:05 +0000
Subject: Re: [PATCH] checkpatch.pl: fix naked sscanf false positives
Message-Id: <CANtyZjQ-znd-BAP_c68bgDTwOt_MZ6sBSiieD9PQWPceTZh1QA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160205082952.GA18361@kwern-VirtualBox>
In-Reply-To: <20160205082952.GA18361@kwern-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 5, 2016 at 1:46 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Fri, Feb 05, 2016 at 12:29:52AM -0800, Kevin Wern wrote:
>> There is a section of checkpatch.pl that intends to ensure the return
>> value of sscanf is always checked.  However, in certain cases, like in
>> drivers/staging/dgnc/dgnc.mod.c
>
> You shouldn't be running checkpatch.pl on a mod.c file.  Those are just
> a build artifact and not code.
>
> regards,
> dan carpenter

Whoops, guess I'm being a bit of a newb there. Regardless, isn't it still more
precise to narrow this conditional down to function calls, rather than just
the symbol itself?

I can eliminate the bad use case from the commit.

On Fri, Feb 5, 2016 at 9:26 PM, Joe Perches <joe@perches.com> wrote:
> On Fri, 2016-02-05 at 00:29 -0800, Kevin Wern wrote:
>> There is a section of checkpatch.pl that intends to ensure the return
>> value of sscanf is always checked.  However, in certain cases, like in
>> drivers/staging/dgnc/dgnc.mod.c, the symbol for sscanf is used without
>> calling the function:
>>
>> static const struct modversion_info ____versions[]
>> __used
>> __attribute__((section("__versions"))) = {
>> ...
>> { 0x20c55ae0, __VMLINUX_SYMBOL_STR(sscanf) },
>> ...
>> };
>>
>> This currently results in a warning, which is undesirable. We should
>> adjust the script's first regex condition to match *calls* to sscanf,
>> not just the symbol itself.
>>
>> Signed-off-by: Kevin Wern <kevin.m.wern@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 0147c91..199247d 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -5452,7 +5452,7 @@ sub process {
>>  # check for naked sscanf
>>               if ($^V && $^V ge 5.10.0 &&
>>                   defined $stat &&
>> -                 $line =~ /\bsscanf\b/ &&
>> +                 $line =~ /\bsscanf\b\s*$balanced_parens/ &&
>
> No, that won't work.  That's what the $stat line is for
>
> I suppose it could be /\bsscanf\s*\(/ though

I thought the $stat line's purpose was to ensure a statement was being
evaluated in the current context. I tested the change with the example
statement, and it both eliminated the original example and retained the
ability to recognize unchecked sscanf return values.  Although the example
statement is from an artifact that shouldn't be checked by the script, it is
still a valid example.

I don't see why using unbalanced vs balanced parens would work better, although
I believe both would work.  The next statements that apply comparative contexts
all use $balanced_parens for the argument list, so I figured it was consistent.

Let me know what you think.  I'm willing to use a different regex, but I just
would like to understand the reasoning.

-Kevin Wern
