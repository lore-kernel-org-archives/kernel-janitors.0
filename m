From: Joe Perches <joe@perches.com>
Date: Sat, 23 Sep 2017 01:33:30 +0000
Subject: Re: [PATCH] lib/lz4: make arrays static const, reduces object code size
Message-Id: <1506130410.12311.50.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921221939.20820-1-colin.king@canonical.com>
         <5aab65d9-6da6-c770-b5aa-9edbdda31dec@wanadoo.fr>
         <250fe35e-77d3-a9c0-5613-ce1c65f4cb7f@canonical.com>
         <CAK8P3a1ryR2oXnqrMt+L0_v1G+NggvejX+L31V=QtCBt1cfZWg@mail.gmail.com>
         <1506100881.12311.41.camel@perches.com>
         <CAK8P3a3KLjuntMkJW3xkgO5a-nTBVZm8LJVnX-RwsWJ084kuOw@mail.gmail.com>
         <CAK8P3a3fyu4gjbiviC93Usaxn=6Ud8YWpiH-va5NTUJwLqDx0g@mail.gmail.com>
In-Reply-To: <CAK8P3a3fyu4gjbiviC93Usaxn=6Ud8YWpiH-va5NTUJwLqDx0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Colin Ian King <colin.king@canonical.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sven Schmidt <4sschmid@informatik.uni-hamburg.de>, Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, 2017-09-22 at 23:39 +0200, Arnd Bergmann wrote:
> On Fri, Sep 22, 2017 at 9:17 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Sep 22, 2017 at 7:21 PM, Joe Perches <joe@perches.com> wrote:
> > > On Fri, 2017-09-22 at 09:48 +0200, Arnd Bergmann wrote:
> > > > On Fri, Sep 22, 2017 at 1:11 AM, Colin Ian King
> > > >    text    data     bss     dec     hex filename
> > > >   18220     176       0   18396    47dc build/tmp/lib/lz4/lz4_decompress-after.o
> > > >   22297       0       0   22297    5719 build/tmp/lib/lz4/lz4_decompress-before.o
> > > 
> > > Perhaps not so much a gcc bug as an opportunity
> > > for gcc to add an additional optimization.
> > > 
> > > gcc would have to verify that the const array is
> > > not initialized with some variable or argument like:
> > > 
> > > int foo(int a)
> > > {
> > >         const int array[] = {1, a};
> > >         ...
> > > }
> > 
> > It depends. With a 10KB different in .text size, my guess is that this
> > is a case where gcc does the right optimization in principle, but
> > fails to do what was intended in some corner cases.
> 
> I found the problem: "gcc -fsanitze=kernel-address --param asan-stack=1"
> produces lots of expensive checks here with gcc-5 or higher.
> 
> Disabling it makes a big difference:
> 
> upstream:
> gcc-7.0.0 --fsanitze=kernel-address --param asan-stack=1: 31789 bytes
> gcc-7.0.0: 16535 bytes
> 
> patched:
> gcc-7.0.0 --fsanitze=kernel-address --param asan-stack=1: 20351 bytes
> gcc-7.0.0: 14490 bytes

I think you are looking at a different issue.

There seems still a difference in size between
current and Colin's patch in compiled object size.



>       Arnd
