From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 16 Mar 2004 08:25:44 +0000
Subject: Re: [Kernel-janitors] Patch to change char * into char[]
Message-Id: <20040316082544.GB2021@mail.sternwelten.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079109894.756.34.camel@chopin.internal.nit.ca>
In-Reply-To: <1079109894.756.34.camel@chopin.internal.nit.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hello peter,

On Fri, 12 Mar 2004, Peter McCurdy wrote:

> Attached is a patch to convert a few instances of 'char *foo = "bar";'
> into 'char foo[] = "bar";'.  I started off with drivers/net/irda, I'll
> do some more if everything is OK with this one.

good starter, applied and compiled.
but please send in 1 patch / mail inline 
(it's easier to save the hole patch with comment for further usage..)

add the output of size(1) for this kind of patches
some of these are beneficial but not all. :)


> Binary files linux-2.6.4-kj-orig/drivers/net/irda/.irport.c.swp and linux-2.6.4/drivers/net/irda/.irport.c.swp differ

diff has a -X switch for a "dontdiff" file, like this one:
http://developer.osdl.org/rddunlap/scripts/dontdiff-osdl

> diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/ali-ircc.c linux-2.6.4/drivers/net/irda/ali-ircc.c
> --- linux-2.6.4-kj-orig/drivers/net/irda/ali-ircc.c	Fri Mar 12 10:15:01 2004
> +++ linux-2.6.4/drivers/net/irda/ali-ircc.c	Fri Mar 12 10:47:24 2004
> @@ -49,7 +49,7 @@
>  #define CHIP_IO_EXTENT 8
>  #define BROKEN_DONGLE_ID
>  
> -static char *driver_name = "ali-ircc";
> +static char driver_name[] = "ali-ircc";
>  
>  /* Module parameters */
>  static int qos_mtt_bits = 0x07;  /* 1 ms or more */

first line size(1) output is before your patch, 2 line after.

   text    data     bss     dec     hex filename
  17575     784      48   18407    47e7 ali-ircc.o
  17582     784      48   18414    47ee ali-ircc.o

didn't help.

> diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/irport.c linux-2.6.4/drivers/net/irda/irport.c
> --- linux-2.6.4-kj-orig/drivers/net/irda/irport.c	Fri Mar 12 10:15:01 2004
> +++ linux-2.6.4/drivers/net/irda/irport.c	Fri Mar 12 10:47:32 2004
> @@ -72,7 +72,7 @@
>  static unsigned int qos_mtt_bits = 0x03;
>  
>  static struct irport_cb *dev_self[] = { NULL, NULL, NULL, NULL};
> -static char *driver_name = "irport";
> +static char driver_name[] = "irport";
>  
>  static inline void irport_write_wakeup(struct irport_cb *self);
>  static inline int  irport_write(int iobase, int fifo_size, __u8 *buf, int len);


   text    data     bss     dec     hex filename
   7538     536      32    8106    1faa irport.o
   7531     539      32    8102    1fa6 irport.o


looks good to me.


> diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/nsc-ircc.c linux-2.6.4/drivers/net/irda/nsc-ircc.c
> --- linux-2.6.4-kj-orig/drivers/net/irda/nsc-ircc.c	Fri Mar 12 10:15:01 2004
> +++ linux-2.6.4/drivers/net/irda/nsc-ircc.c	Fri Mar 12 10:46:51 2004
> @@ -68,7 +68,7 @@
>  #define CHIP_IO_EXTENT 8
>  #define BROKEN_DONGLE_ID
>  
> -static char *driver_name = "nsc-ircc";
> +static char driver_name[] = "nsc-ircc";
>  
>  /* Module parameters */
>  static int qos_mtt_bits = 0x07;  /* 1 ms or more */

   text    data     bss     dec     hex filename
  14375    1120      60   15555    3cc3 nsc-ircc.o
  14401    1120      60   15581    3cdd nsc-ircc.o

bad.

> diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/via-ircc.c linux-2.6.4/drivers/net/irda/via-ircc.c
> --- linux-2.6.4-kj-orig/drivers/net/irda/via-ircc.c	Fri Mar 12 10:15:01 2004
> +++ linux-2.6.4/drivers/net/irda/via-ircc.c	Fri Mar 12 10:46:40 2004
> @@ -65,7 +65,7 @@
>  #define CHIP_IO_EXTENT 8
>  #define BROKEN_DONGLE_ID
>  
> -static char *driver_name = "via-ircc";
> +static char driver_name[] = "via-ircc";
>  
>  /* Module parameters */
>  static int qos_mtt_bits = 0x07;	/* 1 ms or more */

   text    data     bss     dec     hex filename
  15232     760      16   16008    3e88 via-ircc.o
  15232     760      16   16008    3e88 via-ircc.o

no change.

> diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/w83977af_ir.c linux-2.6.4/drivers/net/irda/w83977af_ir.c
> --- linux-2.6.4-kj-orig/drivers/net/irda/w83977af_ir.c	Fri Mar 12 10:15:01 2004
> +++ linux-2.6.4/drivers/net/irda/w83977af_ir.c	Fri Mar 12 10:47:02 2004
> @@ -69,7 +69,7 @@
>  #define CONFIG_USE_W977_PNP        /* Currently needed */
>  #define PIO_MAX_SPEED       115200 
>  
> -static char *driver_name = "w83977af_ir";
> +static char driver_name[] = "w83977af_ir";
>  static int  qos_mtt_bits = 0x07;   /* 1 ms or more */
>  
>  #define CHIP_IO_EXTENT 8

   text    data     bss     dec     hex filename
   8323     708      16    9047    2357 w83977af_ir.o
   8311     716      16    9043    2353 w83977af_ir.o

this one is ok.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
