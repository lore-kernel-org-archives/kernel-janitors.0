From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 23 Apr 2009 17:34:19 +0000
Subject: Re: is there a "single_bit_set" macro somewhere?
Message-Id: <alpine.LFD.2.00.0904231331260.12974@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.2.00.0904231307160.12567@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.0904231307160.12567@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 23 Apr 2009, Julia Lawall wrote:

> I found 8 occurrences with the following Coccinelle semantic match:
>
> @@ expression n; @@
>
> * (n & (n-1)) = 0
>
>
> The most unpleasant was:
>
> (!(((fp)->ipend & ~0x30) & (((fp)->ipend & ~0x30) - 1)))
>
> in the file arch/blackfin/kernel/traps.c.
>
> At least some of them seemed to have comments nearby that suggested
> that searching for a single 1-bit was indeed the goal.  I haven't
> looked at all of them, though.

  behold, the power of shell and REs, which searches for four
variations of that test:

==
#!/bin/sh

DIR=${1-*}

echo -e "     x & (x - 1):\n"
grep -Ern "([^\(\)]+) ?\& ?\(\1 ?- ?1\)" ${DIR}
echo -e "     x & ((x) - 1):\n"
grep -Ern "([^\(\)]+) ?\& ?\(\(\1\) ?- ?1\)" ${DIR}
echo -e "     (x) & (x - 1):\n"
grep -Ern "\(([^\(\)]+)\) ?\& ?\(\1 ?- ?1\)" ${DIR}
echo -e "     (x) & ((x) - 1):\n"
grep -Ern "\(([^\(\)]+)\) ?\& ?\(\(\1\) ?- ?1\)" ${DIR}

==
$ find_pow2_cleanup.sh drivers/staging/comedi
     x & (x - 1):

drivers/staging/comedi/drivers/amplc_pci224.c:790:	if ((cmd->start_src & (cmd->start_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci224.c:792:	if ((cmd->scan_begin_src & (cmd->scan_begin_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci224.c:794:	if ((cmd->convert_src & (cmd->convert_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci224.c:796:	if ((cmd->scan_end_src & (cmd->scan_end_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci224.c:798:	if ((cmd->stop_src & (cmd->stop_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1274:	if ((cmd->start_src & (cmd->start_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1276:	if ((cmd->scan_begin_src & (cmd->scan_begin_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1278:	if ((cmd->convert_src & (cmd->convert_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1280:	if ((cmd->scan_end_src & (cmd->scan_end_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1282:	if ((cmd->stop_src & (cmd->stop_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1710:	if ((cmd->start_src & (cmd->start_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1712:	if ((cmd->scan_begin_src & (cmd->scan_begin_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1714:	if ((cmd->convert_src & (cmd->convert_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1716:	if ((cmd->scan_end_src & (cmd->scan_end_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_pci230.c:1718:	if ((cmd->stop_src & (cmd->stop_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_dio200.c:843:	if ((cmd->start_src & (cmd->start_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_dio200.c:845:	if ((cmd->scan_begin_src & (cmd->scan_begin_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_dio200.c:847:	if ((cmd->convert_src & (cmd->convert_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_dio200.c:849:	if ((cmd->scan_end_src & (cmd->scan_end_src - 1)) != 0)
drivers/staging/comedi/drivers/amplc_dio200.c:851:	if ((cmd->stop_src & (cmd->stop_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmmio.c:1123:	if ((cmd->start_src & (cmd->start_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmmio.c:1125:	if ((cmd->scan_begin_src & (cmd->scan_begin_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmmio.c:1127:	if ((cmd->convert_src & (cmd->convert_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmmio.c:1129:	if ((cmd->scan_end_src & (cmd->scan_end_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmmio.c:1131:	if ((cmd->stop_src & (cmd->stop_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmuio.c:1033:	if ((cmd->start_src & (cmd->start_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmuio.c:1035:	if ((cmd->scan_begin_src & (cmd->scan_begin_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmuio.c:1037:	if ((cmd->convert_src & (cmd->convert_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmuio.c:1039:	if ((cmd->scan_end_src & (cmd->scan_end_src - 1)) != 0)
drivers/staging/comedi/drivers/pcmuio.c:1041:	if ((cmd->stop_src & (cmd->stop_src - 1)) != 0)
     x & ((x) - 1):

     (x) & (x - 1):

     (x) & ((x) - 1):

  and that's out of a single subdirectory of drivers/staging.  there's
more.  lots more.

rday
--

====================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
====================================
