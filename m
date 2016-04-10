From: coypu@SDF.ORG
Date: Sun, 10 Apr 2016 23:32:05 +0000
Subject: Widespread misuse of GFP_ATOMIC
Message-Id: <20160410233205.GA19912@SDF.ORG>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello linux janitors,

from kmalloc man page:

GFP_ATOMIC - Allocation will not sleep. May use emergency pools. For
example, use this inside interrupt handlers.
GFP_NOWAIT - Allocation will not sleep.

grepping linux kernel tree:

[0:/usr/linux-src> ]$ grep -R GFP_ATOMIC . |wc -l
4452
[0:/usr/linux-src> ]$ grep -R GFP_NOWAIT . |wc -l
220

(alternative flags and some accounting:
total k.*alloc calls:   34320
GFP_KERNEL appearances: 23819
GDP_ATOMIC appearances: 4452
GFP_NOWAIT appearances: 220

unaccounted: 5829)

GFP_ATOMIC is meant for interrupt handlers and emergency pool.
Widespread misuse renders the emergency pool useless.

I believe the vast majority of such uses can be converted to GFP_NOWAIT.
Even valid uses of GFP_ATOMIC are likely rendered useless by this
widespread misuse.

You may wish to replace such calls.

Cheers, coypu
