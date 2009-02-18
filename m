From: Manish Katiyar <mkatiyar@gmail.com>
Date: Wed, 18 Feb 2009 16:48:47 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <ea11fea30902180836g6e68070dr72aad039d6e42bd1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Feb 18, 2009 at 9:53 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Feb 18, 2009 at 08:49:21PM +0530, Manish Katiyar wrote:
>> On Tue, Feb 17, 2009 at 6:02 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
>> >>
>> >> Hmm.....after doing the changes when I saw the md5sum they are
>> >> different :-( . Considering that I have done only whitespace fixes,
>> >> few comments which exceeded 80 cols and replacing __initcall with
>> >> device_initcall(). The sizes of object files are same.
>> >> How should I go about finding why is the difference ?
>> >
>> > Binary search undoing your changes one-by-one.
>> >
>> > My bet is that it is either:
>> > 1) Move of EXPORT_SYMBOL
>> > 2) Delete one line where you moved an opening brace
>> >
>> > The approch here is simple.
>> > Split the patch is two parts.
>> > One that keep the md5 sum, and a second much smaller patch that impact
>> > the md5 sum. In this way you make it easier to review the changes that
>> > impact the md5 sum.
>>
>> Hi Sam,
>>
>> I am bit confused, apparently it looks like change in comments is
>> causing md5sum to change. See the output below.
>
> Thats because your change add an extra line. And __LINE__ is used
> by BUG_ON later in the file - so now it sees a new line numbers
> and thus md5 sum changes.

Ohhh.......thanks a lot Sam, I would have never guessed that. Till now
I always felt comments are harmless. In that case should I split them
in a separate patch even if they are just simple changes in comments ?

Thanks -
Manish


>
>        Sam
>
