From: Rohit Sarkar <rohitsarkar5398@gmail.com>
Date: Sat, 14 Sep 2019 14:37:27 +0000
Subject: Re: Problems during compiling in kernel modules
Message-Id: <20190914142527.GA4158@SARKAR>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913173821.GA5986@SARKAR>
 <20190913180103.GB5986@SARKAR>
 <CAOsEZoht6hWU1_pBp-GaRsNSDVj6D+vz0Z9MZRRVqR-HZgJoGg@mail.gmail.com>
 <alpine.DEB.2.21.1909140756470.5193@hadrien>
In-Reply-To: <alpine.DEB.2.21.1909140756470.5193@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Jay Aurabind <jay.aurabind@gmail.com>, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org

On Sat, Sep 14, 2019 at 07:57:48AM +0200, Julia Lawall wrote:
> 
> 
> On Sat, 14 Sep 2019, Jay Aurabind wrote:
> 
> > Hi Rohit,
> >
> > The required config options need to the objects in that folder to be
> > build. Apparently there is no way to automatically set the required
> > configs. You can look at the Kconfig files inside drivers/iio/accel
> > and see what are the dependencies for building various drivers.
> 
> It looks like some of the drivers are individual files.  So you can also
> just compile them one at a time make staging/drivers.iio/accel/foo.o.
> 
> julia
> 

Hey julia,
I ran a `make clean` on that directory by mistake which I realised I
shouldn't have done. Hence no object files are there.

Giving me this:

`
make drivers/staging/iio/adis16240.o staging/git/remove-include
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND  objtool
make[1]: *** No rule to make target 'drivers/staging/iio/adis16240.o'.  Stop.
Makefile:1772: recipe for target 'drivers/staging/iio/adis16240.o' failed
make: *** [drivers/staging/iio/adis16240.o] Error 2
`

I guess I will have to enable `CONFIG_IIO` and rebuild?
Although what I don't understand is if `CONFIG_IIO` was not enabled how
were there object files in the first place?

Thanks,
Rohit
