From: walter harms <wharms@bfs.de>
Date: Thu, 11 Oct 2007 11:45:34 +0000
Subject: [KJ] janitor job: CL_SIZE
Message-Id: <470E0CDE.3090506@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi list,
i looked into COMMAND_LINE_SIZE usage and found

./include/asm-mips/bootinfo.h:#define CL_SIZE                   COMMAND_LINE_SIZE
./include/asm-m68k/setup.h:#define CL_SIZE COMMAND_LINE_SIZE

CL_SIZE is used in:

./arch/ppc/amiga/bootinfo.c:extern char cmd_line[CL_SIZE];
./arch/m68k/mac/config.c:extern char m68k_command_line[CL_SIZE];
./arch/m68k/kernel/setup.c:static char m68k_command_line[CL_SIZE];
./arch/m68k/kernel/setup.c:     memcpy(boot_command_line, *cmdline_p, CL_SIZE);
./arch/mips/lasat/prom.c:               strncpy(arcs_cmdline, argv[0], CL_SIZE-1);
./arch/mips/lasat/prom.c:               arcs_cmdline[CL_SIZE-1] = '\0';
./arch/mips/kernel/setup.c:static char command_line[CL_SIZE];
./arch/mips/kernel/setup.c:       char arcs_cmdline[CL_SIZE]=CONFIG_CMDLINE;
./arch/mips/sibyte/cfe/setup.c: if (cfe_getenv("LINUX_CMDLINE", arcs_cmdline, CL_SIZE) < 0) {
./arch/mips/sibyte/cfe/setup.c: arcs_cmdline[CL_SIZE-1] = 0;
./arch/mips/mips-boards/generic/memory.c:       char cmdline[CL_SIZE], *ptr;

is there any good reason to do it this way ?
otherwise s/CL_SIZE/COMMAND_LINE_SIZE/ can be used ?

re,
 wh
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
