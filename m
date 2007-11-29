From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 29 Nov 2007 07:28:43 +0000
Subject: const __initdata?
Message-Id: <alpine.LFD.0.9999.0711290227150.25822@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  from include/linux/init.h:

 * For initialized data:
 * You should insert __initdata between the variable name and equal
 * sign followed by value, e.g.:
 *
 * static int init_variable __initdata = 0;
 * static char linux_logo[] __initdata = { 0x32, 0x36, ... };
 *
 * Don't forget to initialize data not at file scope, i.e. within a function,
 * as gcc otherwise puts the data into the bss section and not into the init
 * section.
 *
 * Also note, that this data cannot be "const".

you mean, like this in drivers/hwmon/w83627ehf.c:

/* w83627ehf_find() looks for a '627 in the Super-I/O config space */
static int __init w83627ehf_find(int sioaddr, unsigned short *addr,
                                 struct w83627ehf_sio_data *sio_data)
{
        static const char __initdata sio_name_W83627EHF[] = "W83627EHF";
        static const char __initdata sio_name_W83627EHG[] = "W83627EHG";
        static const char __initdata sio_name_W83627DHG[] = "W83627DHG";
	...

or am i misreading that?

rday

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
