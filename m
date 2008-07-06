From: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 06 Jul 2008 14:48:02 +0000
Subject: Re: [linux-dvb] [PATCH] Remove fdump tool for av7110 firmware
Message-Id: <1215355682.3189.101.camel@shinybook.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214139259.2994.8.camel@jaswinder.satnam>
	<200807060315.51736@orion.escape-edv.de> <48708BBF.9050400@cadsoft.de>
	<1215343022.10393.945.camel@pmac.infradead.org>
	<412bdbff0807060729o639f98b1s383d146856feb6da@mail.gmail.com>
In-Reply-To: <412bdbff0807060729o639f98b1s383d146856feb6da@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devin Heitmueller <devin.heitmueller@gmail.com>
Cc: kernelnewbies <kernelnewbies@nl.linux.org>, linux-dvb@linuxtv.org, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jaswinder Singh <jaswinder@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Sun, 2008-07-06 at 10:29 -0400, Devin Heitmueller wrote:
> Correct me if I'm wrong, but doesn't this also affect those
> distributions that consider kernels with binary firmware blobs to not
> be free software?  Those distributions take the stance that the
> firmware must be loadable by userland, in which case the proposed
> patch removes this capability.

No, it doesn't remove that capability.

We're just observing that the trick which fdump.c uses to turn firmware
into a hex array in C source is obsoleted by the generic ability to
include firmware blobs into the kernel using CONFIG_EXTRA_FIRMWARE. If
we just use the generic method, then the conditional code in the driver
can go away, as can the fdump tool.

Yes, that does mean that it's either in the _kernel_ or in userspace,
rather than being in the .ko file -- but if you want modularity and are
already depending on having a functional userspace, it doesn't seem to
make a lot of sense to have this reimplementation of generic
functionality, just so that you can keep the two parts in _one_ file.

-- 
dwmw2

