From: bruce@cs.usyd.edu.au (Bruce Janson)
Date: Tue, 17 Jul 2007 04:07:40 +0000
Subject: Re: [PATCH] add static declaration to non-global functions and init_module / cleanup_module fixes
Message-Id: <200707170413.l6H4D8WX025390@dm2.cs.usyd.edu.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11846446011693-git-send-email-crquan@gmail.com>
In-Reply-To: <11846446011693-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

    From crquan@gmail.com Tue Jul 17 14:03:38 2007
    ...
    From: Denis Cheng <crquan@gmail.com>
    To: Bruce Janson <bruce@cs.usyd.edu.au>
    Cc: Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org
    ...
    
    switch to use module_init / module_exit macros.
    
    To: Bruce Janson <bruce@cs.usyd.edu.au>
    Cc: kernel-janitors@vger.kernel.org
    Signed-off-by: Denis Cheng <crquan@gmail.com>
    ---
     drivers/net/wireless/wavelan.c |    9 +++++++--
     1 files changed, 7 insertions(+), 2 deletions(-)
    
    diff --git a/drivers/net/wireless/wavelan.c b/drivers/net/wireless/wavelan.c
    index 1cf090d..a489ef4 100644
    --- a/drivers/net/wireless/wavelan.c
    +++ b/drivers/net/wireless/wavelan.c
    @@ -4307,7 +4307,7 @@ out:
      * Insertion of the module
      * I'm now quite proud of the multi-device support.
      */
    -int __init init_module(void)
    +static int __init wavelan_init(void)
     {
     	int ret = -EIO;		/* Return error if no cards found */
     	int i;
    @@ -4371,7 +4371,7 @@ int __init init_module(void)
     /*
      * Removal of the module
      */
    -void cleanup_module(void)
    +static void __exit wavelan_exit(void)
     {
     #ifdef DEBUG_MODULE_TRACE
     	printk(KERN_DEBUG "-> cleanup_module()\n");
    @@ -4398,7 +4398,12 @@ void cleanup_module(void)
     	printk(KERN_DEBUG "<- cleanup_module()\n");
     #endif
     }
    +
    +module_init(wavelan_init);
    +module_exit(wavelan_exit);
    +
     #endif				/* MODULE */
    +
     MODULE_LICENSE("GPL");
     
     /*
    -- 
    1.5.2.2
    ...

Hi Denis, Janitors,
    I have not been the maintainer of that device for a number
of years now (10?).  I handed it over to Jean Tourrilhes:

  http://www.hpl.hp.com/personal/Jean_Tourrilhes/index.html

but I have not kept track of it since then.

Regards,
Bruce Janson, Network Group, ICT Infrastructure     Email:  bruce@usyd.edu.au
Rm 125c, Bldg H08, University Computing Centre      Phone:  +61-2-9351-4911
University of Sydney, NSW, Australia, 2006
