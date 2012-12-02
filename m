From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 02 Dec 2012 17:35:18 +0000
Subject: Re: [patch v3] x86, UV: integer wrap bug in uv_hub_ipi_value()
Message-Id: <20121202173517.GB6568@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50BB74E7.9060306@bfs.de>
 <20121202172842.GA20110@elgon.mountain>
In-Reply-To: <20121202172842.GA20110@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Russ Anderson <rja@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, walter harms <wharms@bfs.de>

On Sun, Dec 02, 2012 at 08:28:43PM +0300, Dan Carpenter wrote:
> This is a static checker fix.  The problem is that we store the bits
> from "uv_apicid_hibits" into "apicid" (the high 16 bits) but then we
> shift it 16 bit to the left.  "apicid" is an int so it wraps and we lose
> them.
> 
> I have also simplified uv_wakeup_secondary() a little based on a
> suggestion.

This was supposed to say "suggestions from Walter Harms." but I
pressed "u" in vim instead of "i" because they are next to each
other so that that got deleted.  @%$@#$%@%$.  I'll resend.

regards,
dan carpenter

