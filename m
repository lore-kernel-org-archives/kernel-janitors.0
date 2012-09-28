From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 11:45:13 +0000
Subject: [PPC] relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .tex
Message-Id: <20120928114513.GA1213@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org

Hi,

I got such build errors in powerpc allyesconfig and other configs.
How can they be eliminated? I'm running the cross compile tools from
kernel.org.

drivers/built-in.o: In function `.yenta_interrupt':
yenta_socket.c:(.text+0x1ffba78): relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .text section in arch/powerpc/platforms/built-in.o
yenta_socket.c:(.text+0x1ffbb40): relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .text section in arch/powerpc/platforms/built-in.o
yenta_socket.c:(.text+0x1ffbcd0): relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .text section in arch/powerpc/platforms/built-in.o
drivers/built-in.o: In function `.yenta_interrupt_wrapper':
yenta_socket.c:(.text+0x1ffbe3c): relocation truncated to fit: R_PPC64_REL24 against symbol `_savegpr0_29' defined in .text.save.restore section in arch/powerpc/lib/built-in.o
yenta_socket.c:(.text+0x1ffbea8): relocation truncated to fit: R_PPC64_REL24 against symbol `_restgpr0_29' defined in .text.save.restore section in arch/powerpc/lib/built-in.o
drivers/built-in.o: In function `.yenta_probe_irq.isra.1':
yenta_socket.c:(.text+0x1ffc044): relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .text section in arch/powerpc/platforms/built-in.o
yenta_socket.c:(.text+0x1ffc1d0): relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .text section in arch/powerpc/platforms/built-in.o
yenta_socket.c:(.text+0x1ffc298): relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .text section in arch/powerpc/platforms/built-in.o
yenta_socket.c:(.text+0x1ffc478): relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .text section in arch/powerpc/platforms/built-in.o
yenta_socket.c:(.text+0x1ffc608): relocation truncated to fit: R_PPC64_REL24 against symbol `.eeh_check_failure' defined in .text section in arch/powerpc/platforms/built-in.o
yenta_socket.c:(.text+0x1ffc7a0): additional relocation overflows omitted from the output

Thanks,
Fengguang
