From: walter harms <wharms@bfs.de>
Date: Wed, 23 May 2007 07:32:20 +0000
Subject: Re: [KJ] [PATCH] potential parse error in ifdef
Message-Id: <4653EE04.6040508@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87fy5q5dxr.fsf@wanadoo.fr>
In-Reply-To: <87fy5q5dxr.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

hi Håkon,
you are right in some way but look in these (theoretical) example:

#ifdef LINUX
	donea()
#else
	doneb()
#endif

doneb() will never be used on Linux but it may  be useful for a driver programmer to
run that thing on an other system.

IMHO: add a note like "please explain why we need that dead code or we remove it", send it to the
maintainer and let him remove either the code or add an explanation.

re,
 wh

Håkon Løvdal wrote:
> On 21/05/07, Matthew Wilcox <matthew@wil.cx> wrote:
>> On Mon, May 21, 2007 at 06:39:12PM +0200, Yoann Padioleau wrote:
>> > I have made a tool to parse the kernel that does not pre-process the
>> > source. That means that my parser tries to parse all the code,
>> including
>> > code in the #else branch or code that is not often compiled because
>> > the driver is not very used (or not used at all). So, my parser
>> > sometimes reports parse error not originally detected by gcc.
>> > Here is my (first) patch.
>>
>> These all look good to me.
> 
> But one question. His tool has found some code segments
> that obviously never have been compiled and most likely are
> not included in the kernel in any way (because otherwise
> I would assume that allyesconfig would have caught them).
> 
> Dead, unused code that theoretically would compile is
> probably better than dead, unused code that would not
> compile, but if the code in question is indeed dead and
> unused I would assume that the best option would be to
> remove it?
> 
> BR Håkon Løvdal
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
