From: Jeff Garzik <jgarzik@pobox.com>
Date: Fri, 27 Jan 2006 15:33:50 +0000
Subject: [KJ] Re: [Patch 1/3] BUG_ON() Conversion in net/tulip/de2104x.c
Message-Id: <43DA3D5E.6070808@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Eric Sesterhenn / snakebyte wrote:
> hi,
> 
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner and can better optimized away
> 
> One of the if()s contains a call to de_is_running(),
> which seems to be safe to replace, but someone with more
> knownledge of the code might want to verify this...
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

applied 1-3 to upstream-2.6.17 branch of netdev


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
