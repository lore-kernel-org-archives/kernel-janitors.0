From: Domen Puncer <domen@coderock.org>
Date: Tue, 16 Mar 2004 19:23:54 +0000
Subject: Re: [Kernel-janitors] Patch to change char * into char[]
Message-Id: <200403162023.54785.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079109894.756.34.camel@chopin.internal.nit.ca>
In-Reply-To: <1079109894.756.34.camel@chopin.internal.nit.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 16 of March 2004 09:25, maximilian attems wrote:
> hello peter,
> 
> On Fri, 12 Mar 2004, Peter McCurdy wrote:
> > diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/ali-ircc.c linux-2.6.4/drivers/net/irda/ali-ircc.c
> > --- linux-2.6.4-kj-orig/drivers/net/irda/ali-ircc.c	Fri Mar 12 10:15:01 2004
> > +++ linux-2.6.4/drivers/net/irda/ali-ircc.c	Fri Mar 12 10:47:24 2004
> > @@ -49,7 +49,7 @@
> >  #define CHIP_IO_EXTENT 8
> >  #define BROKEN_DONGLE_ID
> >  
> > -static char *driver_name = "ali-ircc";
> > +static char driver_name[] = "ali-ircc";
> >  
> >  /* Module parameters */
> >  static int qos_mtt_bits = 0x07;  /* 1 ms or more */
> 
> first line size(1) output is before your patch, 2 line after.
> 
>    text    data     bss     dec     hex filename
>   17575     784      48   18407    47e7 ali-ircc.o
>   17582     784      48   18414    47ee ali-ircc.o
> 
> didn't help.

   text    data     bss     dec     hex filename
  11669     152      48   11869    2e5d drivers/net/irda/ali-ircc.o # char *driver_name
  11660     152      48   11860    2e54 drivers/net/irda/ali-ircc.o # char driver_name[]
  11669     152      48   11869    2e5d drivers/net/irda/ali-ircc.o # const char driver_name[]

Did help! :-) (gcc version 3.3.3, compiled with make drivers/net/irda/ali-ircc.o)
If you want, i can check others too.

Any idea why const version is longer?


	Domen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
