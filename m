From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Jun 2007 23:45:17 +0000
Subject: [KJ] more on boot-time kernel parms and LILO and cleanup
Message-Id: <Pine.LNX.4.64.0706151922040.29426@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  (a little more perusal shows that this is a bit more complicated
than i thought initially.)

  further to the discussion of cleaning up code and docs related to
boot-time parms, consider the following snippet out of the file
Documentation/kernel-parameters.txt:

...
        pas16=          [HW,SCSI]
                        See header of drivers/scsi/pas16.c.
...

  ok, so is there really a boot-time parameter of "pas16"?  that
depends on how you look at it.

  that docs file states at the top:

"The following is a consolidated list of the kernel parameters as
implemented (mostly) by the __setup() macro ..."

  sure, that's the whole point of __setup(), but that's now how
"pas16" is implemented.  from the source file drivers/scsi/pas16.c, it
seems clear that that boot-time parameter is supported *only* through
LILO:

...
/*
 * Function : pas16_setup(char *str, int *ints)
 *
 * Purpose : LILO command line initialization of the overrides array,
 *
 * Inputs : str - unused, ints - array of integer parameters with ints[0]
 *      equal to the number of ints.
 *
 */

void __init pas16_setup(char *str, int *ints)
{
    static int commandline_current = 0;
    int i;
    if (ints[0] != 2)
        printk("pas16_setup : usage pas16=io_port,irq\n");
    else
        if (commandline_current < NO_OVERRIDES) {
            overrides[commandline_current].io_port = (unsigned short) ints[1];
            overrides[commandline_current].irq = ints[2];
            for (i = 0; i < NO_BASES; ++i)
                if (bases[i].io_port = (unsigned short) ints[1]) {
                    bases[i].noauto = 1;
                    break;
                }
            ++commandline_current;
        }
}
...

  i have to admit, i'd never been aware of this LILO-related boot-time
feature, so i'm assuming that it has a general form of, if you specify
something like "fubarB" at boot time, this ends up calling the setup
routine "fubar_setup" and passing the appropriate parameter[s].  is
that about right?

  but if that's the case, then that boot-time certainly won't be valid
under GRUB so it's kind of misleading to advertise it as a boot-time
parameter.  that source file *does* have the newer form for defining
kernel parameters:

...
#ifdef MODULE
module_param(pas16_addr, ushort, 0);
module_param(pas16_irq, int, 0);
#endif
...

but is there anything that should be done about the older,
LILO-related parameters?  should they be left as is?  should they be
removed?  should they be updated?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
