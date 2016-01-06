From: Michal Nazarewicz <mina86@mina86.com>
Date: Wed, 06 Jan 2016 00:02:57 +0000
Subject: Re: [patch v2] usb: gadget: f_midi: missing unlock on error path
Message-Id: <xa1t60z7tw0e.fsf@mina86.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105102809.GA26420@mwanda>
In-Reply-To: <20160105102809.GA26420@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 06 2016, Dan Carpenter wrote:
> On Tue, Jan 05, 2016 at 08:51:18PM +0000, Felipe Ferreri Tonello wrote:
>> This case is not a matter of been pretty but a matter of been less error
>> prone.
>> 
>> What would you suggest?
>
> Normally it's better to unwind in the reverse order from how we
> allocated so it would be:
>
> 	lock
> 	allocate midi
> 	allocate ports
>
> 	free ports
> 	free midi
> 	unlock
>
> We could move the midi allocation outside the lock, but we can't move
> ports allocation.

I still think the easiest way to go is getting rid of ports allocation
all together.  With that gone, it’s trivial to initialise midi to NULL
and then we can do kfree whenever we want.

> And also we want to drop the lock as soon as we can
> so it's better to do that early like my patch does instead of after the
> frees.  It's less symetric that way and thus more error prone but it's
> better for performance.
>
> Anyway, I don't think it really matters, this is a minor thing.
>
> Also I hope that Smatch will be able to avoid that false positive about
> the midi dereference by the end of 2016. :)

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  ミハウ “mina86” ナザレヴイツ  (o o)
ooo +--<mpn@google.com>--<xmpp:mina86@jabber.org>--ooO--(_)--Ooo--
