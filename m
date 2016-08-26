From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 15:07:07 +0000
Subject: Re: arm: sys_oabi-compat: Use kmalloc_array() in two functions
Message-Id: <6ed97ce3-4378-496f-848b-c66dcc05b21d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5deba521-2dd4-cd2e-23d7-226a1a7728c3@users.sourceforge.net>
 <20160825224632.GL1041@n2100.armlinux.org.uk>
 <dd343c72-2ec7-2114-bee5-1d16fc6c04ac@users.sourceforge.net>
 <20160826134459.GR1041@n2100.armlinux.org.uk>
In-Reply-To: <20160826134459.GR1041@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

> It should at least make basic English sense.  I'm afraid the above
> doesn't convey any meaning what so ever, at least to me.  It doesn't
> matter how many times I read it, I still end up wondering "wtf is
> this trying to tell me?"

I have started to look a bit more on the usage of the following
function pairs in some Linux source files.

kmalloc() ⇔ kmalloc_array()
kzalloc() ⇔ kcalloc()

Can such combinations be extended anyhow?


Some update candidates can be found for this use case in several
software areas.

Regards,
Markus
