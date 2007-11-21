From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 21 Nov 2007 07:44:43 +0000
Subject: conditional inclusion of module entry and exit functions in
Message-Id: <alpine.LFD.0.9999.0711210238420.6372@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i've noticed a pile of code that appears to have some legacy stuff
in it regarding how to define module init and exit routines that can
probably be simplified, unless i'm misreading something.

  as an example, consider drivers/net/ne.c.  take a look toward the
end of that file, where you find:

====static int __init ne_init(void)
{
        return platform_driver_probe(&ne_driver, ne_drv_probe);
}

static void __exit ne_exit(void)
{
        platform_driver_unregister(&ne_driver);
}

#ifdef MODULE
#define MAX_NE_CARDS    4       /* Max number of NE cards per module */
static struct net_device *dev_ne[MAX_NE_CARDS];
static int io[MAX_NE_CARDS];
static int irq[MAX_NE_CARDS];
static int bad[MAX_NE_CARDS];   /* 0xbad = bad sig or no reset ack */

module_param_array(io, int, NULL, 0);
module_param_array(irq, int, NULL, 0);
module_param_array(bad, int, NULL, 0);
MODULE_PARM_DESC(io, "I/O base address(es),required");
MODULE_PARM_DESC(irq, "IRQ number(s)");
MODULE_PARM_DESC(bad, "Accept card(s) with bad signatures");
MODULE_DESCRIPTION("NE1000/NE2000 ISA/PnP Ethernet driver");
MODULE_LICENSE("GPL");
...
int __init init_module(void)
{
...
}

void __exit cleanup_module(void)
{
...
}
#else /* MODULE */
module_init(ne_init);
module_exit(ne_exit);
#endif /* MODULE */
====
  surely you don't have to do all that these days -- check if MODULE
is defined and include code based on that.  don't you simply define
the module init and exit routines, whatever parameters you want, and
let the appropriate code deal with all of that properly when the time
comes, depending on whether that code is modular or built-in?

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
