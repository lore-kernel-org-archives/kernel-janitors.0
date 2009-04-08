From: Joe Perches <joe@perches.com>
Date: Wed, 08 Apr 2009 22:06:00 +0000
Subject: Re: [PATCH 54/56] x86: Remove void casts
Message-Id: <1239228360.32205.14.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <36ca99e90904080518qf81b483h6ed2bc9752ee0d1e@mail.gmail.com>
	 <49DCAE97.8040602@fastmail.fm> <20090408140637.GC12931@elte.hu>
	 <49DCB140.7000603@fastmail.fm> <20090408144055.GH12931@elte.hu>
	 <49DCB8C5.4090108@fastmail.fm> <20090408144842.GK12931@elte.hu>
	 <49DCBA61.8060507@fastmail.fm> <20090408145715.GO12931@elte.hu>
	 <49DCBBDF.4040603@fastmail.fm> <20090408151644.GQ12931@elte.hu>
	 <49DD0D02.3030604@fastmail.fm>
In-Reply-To: <49DD0D02.3030604@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Bert Wesarg <bert.wesarg@googlemail.com>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, 2009-04-08 at 21:45 +0100, Jack Stone wrote:
> That has already been done. Someone just so happened to submit
> such a patch today.
> http://marc.info/?l=linux-kernel&m3916809504492&w=2

It's been floating around for awhile now.

If you're using git send-email, you could try adding
--cc-cmd "scripts/get_maintainer.pl patchfile" 

Here are some descriptions of available options
http://lkml.org/lkml/2008/10/27/479

Let me know how it works for you.

cheers, Joe

