From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 25 Jan 2005 17:11:36 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <41F67DC8.3080608@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Nish Aravamudan wrote:
> On Tue, 25 Jan 2005 08:58:27 -0800, Randy.Dunlap <rddunlap@osdl.org> wrote:
> 
>>Domen Puncer wrote:
>>
>>>>Second stage, that i'm doing now is to put stuff into sections (like it
>>>>is at the beginning of file).
>>>>I'm also thinking about ordering from easiest to hardest.
>>>
>>>
>>>I tried doing this, diff is ugly, lots of reordering, moving and
>>>making items from below shorter. Easiest to hardest ordering is very
>>>rough and subjective.
>>
>>Rough and subjective are expected IMO, but also helpful to newcomers.
>>
>>
>>>I think i added all new suggestions.
>>>Deleted rcpci45.c and module licences entries.
>>>
>>>So... is it better, or should i just continue with previous version?
>>>
>>>
>>> $Id: TODO,v 1.25 2004/12/29 23:03:14 domen Exp $
>>>   -==========-
>>>
>>>-None of the following items are in any order of importance or difficulty.
>>>-Where possible related items have been grouped together.
>>>+Send patches that add/fix items to kernel-janitors@lists.osdl.org.
>>>+Please don't add items to end of file.
>>>
>>> 
>>>+Where it makes sense, sections are supposed to be ordered by incresing
>>>+difficulty.
>>>+
>>>+Links are marked with:
>>>+D: description/information about the issue
>>>+E: example patch
>>
>>I like the shortened version (with D: and E:), although I expect that
>>some people would rather see the D: inline instead of having to
>>follow links.  Also, it could easily be a little too sparse (or
>>spartan) for people who are new to Linux.
> 
> 
> To account for this case, could we maintain two TODOs? They wouldn't
> be any different, just that one is less "spartan," as Randy said, than
> the other :) Basically inline the links there for now.... The
> sparse(r) TODO would be official & maintained; more verbose one would
> get updated whenever we got around to it. Link the latter from the
> former at the bottom, perhaps. So that you *have* to go through the
> sparse one :)
> 
> I don't know if it's feasible (more work for KJ maintainer,
> admittedly), but might be a good compromise. Looks good otherwise,
> Domen.

If I were updating the TODO, I wouldn't care for that option.
Choose A xor B.  :)

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
