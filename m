From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 11 Oct 2007 12:58:23 +0000
Subject: Re: janitor job: CL_SIZE
Message-Id: <Pine.LNX.4.64.0710110857530.8283@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <470E1CE5.80606@bfs.de>
In-Reply-To: <470E1CE5.80606@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 11 Oct 2007, walter harms wrote:

> hi list,
> i looked into COMMAND_LINE_SIZE usage and found
>
> ./include/asm-mips/bootinfo.h:#define CL_SIZE                   COMMAND_LINE_SIZE
> ./include/asm-m68k/setup.h:#define CL_SIZE COMMAND_LINE_SIZE
>
> CL_SIZE is used in:
>
> ./arch/ppc/amiga/bootinfo.c:extern char cmd_line[CL_SIZE];
> ./arch/m68k/mac/config.c:extern char m68k_command_line[CL_SIZE];
> ./arch/m68k/kernel/setup.c:static char m68k_command_line[CL_SIZE];
> ./arch/m68k/kernel/setup.c:     memcpy(boot_command_line, *cmdline_p, CL_SIZE);
> ./arch/mips/lasat/prom.c:               strncpy(arcs_cmdline, argv[0], CL_SIZE-1);
> ./arch/mips/lasat/prom.c:               arcs_cmdline[CL_SIZE-1] = '\0';
> ./arch/mips/kernel/setup.c:static char command_line[CL_SIZE];
> ./arch/mips/kernel/setup.c:       char arcs_cmdline[CL_SIZE]=CONFIG_CMDLINE;
> ./arch/mips/sibyte/cfe/setup.c: if (cfe_getenv("LINUX_CMDLINE", arcs_cmdline, CL_SIZE) < 0) {
> ./arch/mips/sibyte/cfe/setup.c: arcs_cmdline[CL_SIZE-1] = 0;
> ./arch/mips/mips-boards/generic/memory.c:       char cmdline[CL_SIZE], *ptr;
>
> is there any good reason to do it this way ?
> otherwise s/CL_SIZE/COMMAND_LINE_SIZE/ can be used ?

i'm a bit curious about that single usage in the ppc arch directory,
since CL_SIZE doesn't seem to be defined for ppc.  where is it picking
up that macro definition from?

the first part of arch/ppc/amiga/bootinfo.c reads:

/*
 *  Extracted from arch/m68k/kernel/setup.c.
 *  Should be properly generalized and put somewhere else.
 *                              Jesper
 */

#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/string.h>
#include <linux/init.h>

#include <asm/setup.h>
#include <asm/bootinfo.h>

extern char cmd_line[CL_SIZE];
...

  so we can see how that macro ended up there.  but how can it
possibly be defined?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
