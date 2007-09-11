From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 11 Sep 2007 19:41:02 +0000
Subject: does '__setup("dscc4.setup=", dscc4_setup);' make any sense?
Message-Id: <Pine.LNX.4.64.0709111538230.25770@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  in drivers/net/wan/dscc4.c, you have the snippet:

==#ifndef MODULE
static int __init dscc4_setup(char *str)
{
        int *args[] = { &debug, &quartz, NULL }, **p = args;

        while (*p && (get_option(&str, *p) = 2))
                p++;
        return 1;
}

__setup("dscc4.setup=", dscc4_setup);
#endif
==
  but is that call to __setup() correct?  i thought you would just use

  __setup("setup=", dscc4_setup);

but you * would* specify "dscc4.setup=" on the boot line and that
would properly be associated with that setup routine if that code were
compiled into the kernel.

or am i totally misreading how this mechanism works?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
