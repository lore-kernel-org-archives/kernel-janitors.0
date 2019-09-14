From: Austin Kim <austindh.kim@gmail.com>
Date: Sat, 14 Sep 2019 09:55:46 +0000
Subject: Re: Problems during compiling in kernel modules
Message-Id: <CADLLry5W-1urBdYDPdYvcw5fwaiKa_G7R1PFPBtzFQ20o=Rn5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913173821.GA5986@SARKAR> <20190913180103.GB5986@SARKAR>
In-Reply-To: <20190913180103.GB5986@SARKAR>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Rohit Sarkar <rohitsarkar5398@gmail.com>
Cc: linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org

Hi,
Would you follow below steps to build kernel source?

1) Download latest linux kernel source tree:
git clone https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git


2) Generate kernel config(allyesconfig):
cd linux-next
make arch=x86_64 allyesconfig

3) Build kernel Source as you mentioned:

2019년 9월 14일 (토) 오전 4:26, Rohit Sarkar <rohitsarkar5398@gmail.com>님이 작성:
>
> On Fri, Sep 13, 2019 at 11:08:21PM +0530, Rohit Sarkar wrote:
> > Hi,
> > I was trying to compile a particular folder in my kernel tree.
> >
> > AFAIK the way to do this is:
> > `make drivers/staging/iio/` from the kernel base directory.
> >
> > This gives me the following output:
> > `
> >   CALL    scripts/checksyscalls.sh
> >   CALL    scripts/atomic/check-atomics.sh
> >   DESCEND  objtool
> > `
> >
> > No object files are generated.
> > I feel like I am missing something.
> >
> > Thanks,
> > Rohit
>
> I ran `make clean` in the `drivers/iio/accel` directory which removed
> all object files in the first place. However running make after that
> doesnt seem to compile the modules.
>
> Thanks,
> Rohit
