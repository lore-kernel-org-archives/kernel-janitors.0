From: Borislav Petkov <bp@alien8.de>
Date: Wed, 15 May 2019 12:12:48 +0000
Subject: Spelling fixes for new people to get involved
Message-Id: <20190515121247.GF24212@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

if you grep the kernel tree for the word "compliment":

$ git grep compliment
arch/nios2/include/asm/asm-macros.h:126: * Tests the bit in reg2 and then compliments the bit in reg2.
arch/nios2/include/asm/asm-macros.h:189: * Tests the bit in reg2 and then compliments the bit in reg2.
arch/nios2/include/asm/asm-macros.h:202: * Tests the bit in reg2 and then compliments the bit in reg2.
arch/powerpc/platforms/pseries/mobility.c:82:    * A negative value is also the two's compliment of the actual value.
drivers/block/rsxx/config.c:48:  * Return the compliment of the CRC to ensure compatibility
drivers/block/skd_main.c:2039:  /* Note that the compliment of mask is written. A 1-bit means
...

you'll see that in almost all cases, the word the author meant to use
was "complement", with an 'e'.

I think the respective maintainer wouldn't mind a patch fixing that in their
driver/subsystem. :-)

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
