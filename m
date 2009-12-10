From: David Miller <davem@davemloft.net>
Date: Thu, 10 Dec 2009 00:40:29 +0000
Subject: Re: [PATCH] Coding style correction on some drivers that use
Message-Id: <20091209.164029.112221779.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4B1FC5A4.9030300@bfs.de>
	<235c15c10912091309q6c20b417y3f80dbac0be2a073@mail.gmail.com>
	<alpine.LNX.2.00.0912100025190.3755@pobox.suse.cz>
In-Reply-To: <alpine.LNX.2.00.0912100025190.3755@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jkosina@suse.cz
Cc: rudy.matela@gmail.com, wharms@bfs.de, kas@fi.muni.cz, khc@pm.waw.pl, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Jiri Kosina <jkosina@suse.cz>
Date: Thu, 10 Dec 2009 00:26:57 +0100 (CET)

> On Wed, 9 Dec 2009, Rudy Matela wrote:
> 
>> > It is ok until the driver is removed, if this "issue" is not fixed it 
>> > will trigger any check-coding-style and generate new patches. Since it 
>> > involves no code changes it is harmless.
>>   Sould I keep sending coding style corrections to the Linux Kernel?
>> I'm trying to help, but if i'm just being annoying, please tell me and
>> I can try to contribute in a better way.  :-)
> 
> Coding style corrections (if they really improve readability of the code), 
> comment fixes (if they really make grepping for things better or make the 
> whole text more understandable) are welcome and I will happily merge them.
> 
> What I usually don't merge are purely whitespace "fixes", which don't 
> really fix anything in fact.

I think the whitespace ones here are extremely valuable, the code is
amazingly annoying to read as it is.

It boils down to this:

	foo() is a C function call

	foo () is a C operation like 'if', 'while' etc.

and people's brains are wired to this association.
