From: Domen Puncer <domen@coderock.org>
Date: Wed, 17 Mar 2004 01:24:40 +0000
Subject: Re: [Kernel-janitors] Patch to change char * into char[]
Message-Id: <200403170224.40781.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079109894.756.34.camel@chopin.internal.nit.ca>
In-Reply-To: <1079109894.756.34.camel@chopin.internal.nit.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 16 of March 2004 21:18, you wrote:
> On Tue, 16 Mar 2004, Domen Puncer wrote:
> 
> > On Tuesday 16 of March 2004 09:25, maximilian attems wrote:
> > >    text    data     bss     dec     hex filename
> > >   17575     784      48   18407    47e7 ali-ircc.o
> > >   17582     784      48   18414    47ee ali-ircc.o
> > > 
> > > didn't help.
> > 
> >    text    data     bss     dec     hex filename
> >   11669     152      48   11869    2e5d drivers/net/irda/ali-ircc.o # char 
*driver_name
> >   11660     152      48   11860    2e54 drivers/net/irda/ali-ircc.o # char 
driver_name[]
> >   11669     152      48   11869    2e5d drivers/net/irda/ali-ircc.o # 
const char driver_name[]
> > 
> > Did help! :-) (gcc version 3.3.3, compiled with make drivers/net/irda/
ali-ircc.o)
> 
> woow
> just double checked my own values,
> compared to yours incredible size difference!!   
Yeah, amazing.

> but the overall trend seems the same.
heh? mine shows improvements with the patch, yours regressions.
> 
> > If you want, i can check others too.
> 
> yeeah
> these 2 patches from current kj-patchset should be 
> double checked with size(1)
> i can look at them tomorrow morning, but if you like
> in between?
Just enough drunk to do this now :-)

> add/	keyboard_ptr_to_string.patch
> 	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
before:
   text    data     bss     dec     hex filename
   7113    1364     492    8969    2309 drivers/char/keyboard.o
after:
   7116    1364     492    8972    230c drivers/char/keyboard.o

> add/	string_form_drivers.patch
> 	From: maximilian attems <janitor@sternwelten.at>
   text    data     bss     dec     hex filename
  48230     487    4592   53309    d03d drivers/cdrom/sbpcd.o
  48232     455    4592   53279    d01f drivers/cdrom/sbpcd.o
  44535     897     240   45672    b268 drivers/message/fusion/mptscsi
  44537     897     240   45674    b26a drivers/message/fusion/mptscsi
   6057     112      84    6253    186d drivers/net/appletalk/cops.o
   6047     112      84    6243    1863 drivers/net/appletalk/cops.o
  13770     496      26   14292    37d4 drivers/net/irda/smsc-ircc2.o
  13757     464      26   14247    37a7 drivers/net/irda/smsc-ircc2.o
   4562      36      16    4614    1206 drivers/net/ni5010.o
   4498      91      16    4605    11fd drivers/net/ni5010.o


Mostly this is an improvoment, but wtf not allways? How can one pointer less 
take up more space? What am i missing?


	Domen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
