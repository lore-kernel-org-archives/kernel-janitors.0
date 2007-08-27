From: Andre Haupt <andre@finow14.de>
Date: Mon, 27 Aug 2007 14:57:30 +0000
Subject: Re: standard for documenting conditional preprocessor directives?
Message-Id: <20070827145730.GA19149@ahaupt-debian-vm.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 27, 2007 at 09:47:09AM -0400, Robert P. J. Day wrote:
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

I would make that latter
	#endif /* SNAFU */
instead, because the #endif refers to the #ifdef and not to the #else
statement.
> 
>   i contend that both of those new comments have value since, without
> them, you wouldn't know what either the "#else" or "#endif"
> represented.  but i'm willing to be disabused of that notion.
> 
>   thoughts?
> 
sounds reasonable. Some people seem to hate comments in preprocessor directives
though.

regards,

Andre
