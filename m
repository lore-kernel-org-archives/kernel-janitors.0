From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 09 Nov 2004 22:29:07 +0000
Subject: Re: [KJ] [PATCH] convert airo wireless driver to module_param
Message-Id: <419144B3.4090303@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109212957.GA9496@dice.seeling33.de>
In-Reply-To: <20041109212957.GA9496@dice.seeling33.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Stefan Sperling wrote:
> On Tue, Nov 09, 2004 at 01:38:18PM -0800, Randy.Dunlap wrote:
> 
>>Why make these writable, even by root?
>>Why make them visible?
>>
>>Rusty's first set of module_param() conversion patches, which
>>I mostly followed, use permission (last parameter) of 0
>>(not visible in sysfs) except for fields that can be modified.
>>Often this is a "debug" or "verbose" flag or bitmask.
>>
>>Many of these shouldn't be exposed in sysfs IMO.
> 
> 
> OK, I wasn't too sure about permissions anyway.
> I thought the general idea was to allow autoconfiguration through sysfs,
> and expose a driver's internal state to diagnostic tools in user space.
> So I only 0444'd parameters that should obviously not be changed at runtime,
> such as IO ports and IRQs.
> 
> I'll try again and make everything invisible except debug/verbosity flags.
> Since you mentioned bitmasks, is it safe to make irq bitmasks writable as well?
> I made them read-only.

I mentioned bitmasks because some debug variables aren't boolean,
they are bit flags, or sometimes they are an integer (debug level).

No, I don't think that irq bitmasks should be writeable.
Having any system reource data writeable (like IRQ) is asking for
trouble IMO.


-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
