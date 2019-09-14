From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 14 Sep 2019 05:57:48 +0000
Subject: Re: Problems during compiling in kernel modules
Message-Id: <alpine.DEB.2.21.1909140756470.5193@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913173821.GA5986@SARKAR> <20190913180103.GB5986@SARKAR> <CAOsEZoht6hWU1_pBp-GaRsNSDVj6D+vz0Z9MZRRVqR-HZgJoGg@mail.gmail.com>
In-Reply-To: <CAOsEZoht6hWU1_pBp-GaRsNSDVj6D+vz0Z9MZRRVqR-HZgJoGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Aurabind <jay.aurabind@gmail.com>
Cc: Rohit Sarkar <rohitsarkar5398@gmail.com>, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org



On Sat, 14 Sep 2019, Jay Aurabind wrote:

> Hi Rohit,
>
> The required config options need to the objects in that folder to be
> build. Apparently there is no way to automatically set the required
> configs. You can look at the Kconfig files inside drivers/iio/accel
> and see what are the dependencies for building various drivers.

It looks like some of the drivers are individual files.  So you can also
just compile them one at a time make staging/drivers.iio/accel/foo.o.

julia

>
> On Sat, 14 Sep 2019 at 00:58, Rohit Sarkar <rohitsarkar5398@gmail.com> wrote:
> >
> > On Fri, Sep 13, 2019 at 11:08:21PM +0530, Rohit Sarkar wrote:
> > > Hi,
> > > I was trying to compile a particular folder in my kernel tree.
> > >
> > > AFAIK the way to do this is:
> > > `make drivers/staging/iio/` from the kernel base directory.
> > >
> > > This gives me the following output:
> > > `
> > >   CALL    scripts/checksyscalls.sh
> > >   CALL    scripts/atomic/check-atomics.sh
> > >   DESCEND  objtool
> > > `
> > >
> > > No object files are generated.
> > > I feel like I am missing something.
> > >
> > > Thanks,
> > > Rohit
> >
> > I ran `make clean` in the `drivers/iio/accel` directory which removed
> > all object files in the first place. However running make after that
> > doesnt seem to compile the modules.
> >
> > Thanks,
> > Rohit
>
>
>
> --
>
> Thanks and Regards,
> Jay
>
