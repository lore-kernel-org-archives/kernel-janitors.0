From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 27 Aug 2007 15:15:49 +0000
Subject: Re: standard for documenting conditional preprocessor directives?
Message-Id: <20070827081549.fd2fb8f9.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 27 Aug 2007 09:47:09 -0400 (EDT) Robert P. J. Day wrote:

> 
>   is there an understood standard for documenting conditional
> preprocessor directives so you can more easily follow the logic in
> lengthy code segments?
> 
>   consider:
> 
>     #ifdef SNAFU
>     ... very long blah blah ...
>     #else
>     ... equally long woof woof ...
>     #endif
> 
>   if you're perusing the code, and you hit the "#else" or "#endif",
> it's almost impossible to tell what they correspond to, particularly
> if they're mixed in with even more nested directives.  so what's the
> best way to make this more readable?
> 
>   what about something like?
> 
>     #ifdef SNAFU
>     ...
>     #else /* !SNAFU */
>     ...
>     #endif /* !SNAFU */
> 
>   i contend that both of those new comments have value since, without
> them, you wouldn't know what either the "#else" or "#endif"
> represented.  but i'm willing to be disabused of that notion.
> 
>   thoughts?

Your example almost matches my preference/style, but there is no Linux
kernel "standard" for this AFAIK.

I would probably use /* SNAFU */ on the #endif line, so that it's
consistent with the case of no #else block, but I see the case for
using !SNAFU as well.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
