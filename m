From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 11 Sep 2007 08:13:51 +0000
Subject: [PATCH] BOOT: Show that no_ipi_broadcast() takes a parameter.
Message-Id: <Pine.LNX.4.64.0709110410340.24546@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  a rather obvious fix given the opening of the function:

...
static __init int no_ipi_broadcast(char *str)
{
        get_option(&str, &no_broadcast);
...


diff --git a/arch/i386/mach-default/setup.c b/arch/i386/mach-default/setup.c
index 7f635c7..31fb68e 100644
--- a/arch/i386/mach-default/setup.c
+++ b/arch/i386/mach-default/setup.c
@@ -127,7 +127,7 @@ static __init int no_ipi_broadcast(char *str)
 	return 1;
 }

-__setup("no_ipi_broadcast", no_ipi_broadcast);
+__setup("no_ipi_broadcast=", no_ipi_broadcast);

 static int __init print_ipi_mode(void)
 {

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
