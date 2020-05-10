From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 10 May 2020 09:54:54 +0000
Subject: Re: [PATCH] iio: sca3000: Remove an erroneous 'get_device()'
Message-Id: <20200510105454.505c5d1c@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506035206.192173-1-christophe.jaillet@wanadoo.fr>
        <CAHp75Vdi+ZYpQPHgoREQ6LTaUHTPmNkR7ULZaVNTJr7Bvh-q9Q@mail.gmail.com>
        <0a8cd600-2b21-2076-1355-8c97d7ceb709@wanadoo.fr>
        <20200508140221.0000018d@Huawei.com>
In-Reply-To: <20200508140221.0000018d@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Andy Shevchenko <andy.shevchenko@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, linux-iio <linux-iio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 8 May 2020 14:02:21 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Wed, 6 May 2020 19:31:38 +0200
> Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
> > Le 06/05/2020 à 12:38, Andy Shevchenko a écrit :  
> > > On Wed, May 6, 2020 at 6:55 AM Christophe JAILLET
> > > <christophe.jaillet@wanadoo.fr> wrote:    
> > >> This looks really unusual to have a 'get_device()' hidden in a 'dev_err()'
> > >> call.
> > >> Remove it.
> > >>
> > >> While at it add a missing \n at the end of the message.
> > >>    
> > > It should have Fixes tag because it is a quite an issue (get_device()
> > > breaks reference counting with all problems we may expect).    
> > 
> > Agreed and I usually do, but here, I've lost track when this driver has 
> > gone out of staging.
> > 
> > Based on:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/iio/accel/sca3000.c
> > The issue was already there on 2016/10/23, but when I try to go one step 
> > further:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/staging/iio/accel/sca3000.c?id=2ccf61442ff142d2dde7c47471c2798a4d78b0ad
> > ^^^^         ^^^^^^^
> > works but if I try to see the log for that:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/staging/iio/accel/sca3000.c
> > ^^^         ^^^^^^^
> > is empty.
> > 
> > Most of the time, when I do it like that it works just fine, but not on 
> > this file.  
> 
> Oddity of the web interface. Edit the url to get a log form a commit
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/staging/iio/accel/sca3000.c?id=2ccf61442ff142d2dde7c47471c2798a4d78b0ad
>                                                                     ^^^
> Then for more fun you have to deal with another rename
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/staging/iio/accel/?id=ced5c03d360aeebaac6faa7dd8d6d0a77733ab16
> 
> Next bit of log...
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/staging/iio/accel/sca3000_ring.c?id=ced5c03d360aeebaac6faa7dd8d6d0a77733ab16 
> 
> It goes all the way..
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/staging/iio/accel/sca3000_core.c?id=574fb258d63658e4564c32c1940068a3bad666a0
> 
> Fixes: 574fb258d636 ("Staging: IIO: VTI sca3000 series accelerometer driver (spi)")
> 
> Which was in the initial IIO patch set nearly 11 years ago in the merge window for 2.6.32.
> 
> What can I say - I was young and just as capable of writing dumb bugs as I am today :)
> 
> I'll get this queued up when I'm on the right computer...

Applied to the fixes-togreg branch of iio.git.

Thanks,

Jonathan

> 
> Thanks,
> 
> Jonathan
> 
> 
> > 
> > Any other way to navigate in history of moved file would be appreciated.
> > 
> > CJ
> >   
> > >    
> > >> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > >> ---
> > >> This patch is purely speculative.
> > >> I've looked a bit arround and see no point for this get_device() but other
> > >> eyes are welcomed :)
> > >> ---
> > >>   drivers/iio/accel/sca3000.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> > >> index 66d768d971e1..6e429072e44a 100644
> > >> --- a/drivers/iio/accel/sca3000.c
> > >> +++ b/drivers/iio/accel/sca3000.c
> > >> @@ -980,7 +980,7 @@ static int sca3000_read_data(struct sca3000_state *st,
> > >>          st->tx[0] = SCA3000_READ_REG(reg_address_high);
> > >>          ret = spi_sync_transfer(st->us, xfer, ARRAY_SIZE(xfer));
> > >>          if (ret) {
> > >> -               dev_err(get_device(&st->us->dev), "problem reading register");
> > >> +               dev_err(&st->us->dev, "problem reading register\n");
> > >>                  return ret;
> > >>          }
> > >>
> > >> --
> > >> 2.25.1
> > >>    
> > >    
> 
> 
