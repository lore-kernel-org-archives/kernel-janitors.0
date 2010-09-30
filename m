From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 30 Sep 2010 19:23:03 +0000
Subject: Re: [PATCH] staging: ft1000: fix skb, netdev, memory leaks
Message-Id: <20100930192303.GA10342@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285696175-5654-1-git-send-email-segooon@gmail.com>
 <20100930111345.GA9978@kroah.com>
In-Reply-To: <20100930111345.GA9978@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg KH <greg@kroah.com>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, Marek Belisko <marek.belisko@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org

On Thu, Sep 30, 2010 at 04:13 -0700, Greg KH wrote:
> On Tue, Sep 28, 2010 at 09:49:35PM +0400, Vasiliy Kulikov wrote:
> > ft1000_copy_up_pkt() doesn't free skb on errors.
> > init_ft1000_card() doesn't free netdev with free_netdev() but with kfree().
> > init_ft1000_card() doesn't check request_region()'s return value
> > and doesn't free region on error.
> > 
> > Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> > ---
> >  Compile tested.
> 
> No you didn't

No I did:

make -C /home/vasya/linux drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.o
make: Вход в каталог `/home/vasya/dev/linux-next'
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CC      drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.o
drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c: In function ‘ft1000_reset_card’:
drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c:525: warning: passing argument 2 of ‘card_download’ discards qualifiers from pointer target type
drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c:56: note: expected ‘void *’ but argument is of type ‘const u8 * const’
make: Выход из каталога `/home/vasya/dev/linux-next'

However, 

    cd ../drivers/staging/ft1000/ft1000-pcmcia/
    LANG=C make -C ~/linux ft1000_hw.o
    make: Entering directory `/home/vasya/dev/linux-next'
    make: *** No rule to make target `ft1000_hw.o'.  Stop.
    make: Leaving directory `/home/vasya/dev/linux-next'


Is "make" from linux root buggy/not supported for staging/everything?

> 
> >  drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c |   32 +++++++++++++--------
> >  1 files changed, 20 insertions(+), 12 deletions(-)
> 
> This file doesn't build at this point in time, how did you build test
> this?
> 
> I don't mind taking the patch, but please, don't lie.
> 
> thanks,
> 
> greg k-h

-- 
Vasiliy
