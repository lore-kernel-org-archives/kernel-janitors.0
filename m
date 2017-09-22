From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Sep 2017 19:17:28 +0000
Subject: Re: [PATCH] lib/lz4: make arrays static const, reduces object code size
Message-Id: <CAK8P3a3KLjuntMkJW3xkgO5a-nTBVZm8LJVnX-RwsWJ084kuOw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921221939.20820-1-colin.king@canonical.com>
 <5aab65d9-6da6-c770-b5aa-9edbdda31dec@wanadoo.fr> <250fe35e-77d3-a9c0-5613-ce1c65f4cb7f@canonical.com>
 <CAK8P3a1ryR2oXnqrMt+L0_v1G+NggvejX+L31V=QtCBt1cfZWg@mail.gmail.com> <1506100881.12311.41.camel@perches.com>
In-Reply-To: <1506100881.12311.41.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Colin Ian King <colin.king@canonical.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sven Schmidt <4sschmid@informatik.uni-hamburg.de>, Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Sep 22, 2017 at 7:21 PM, Joe Perches <joe@perches.com> wrote:
> On Fri, 2017-09-22 at 09:48 +0200, Arnd Bergmann wrote:
>> On Fri, Sep 22, 2017 at 1:11 AM, Colin Ian King

>>    text    data     bss     dec     hex filename
>>   18220     176       0   18396    47dc build/tmp/lib/lz4/lz4_decompress-after.o
>>   22297       0       0   22297    5719 build/tmp/lib/lz4/lz4_decompress-before.o
>
> Perhaps not so much a gcc bug as an opportunity
> for gcc to add an additional optimization.
>
> gcc would have to verify that the const array is
> not initialized with some variable or argument like:
>
> int foo(int a)
> {
>         const int array[] = {1, a};
>         ...
> }

It depends. With a 10KB different in .text size, my guess is that this
is a case where gcc does the right optimization in principle, but
fails to do what was intended in some corner cases.

I just cross-checked by building with clang, there the patch has
no impact on code size, it is 24929 bytes with or without the patch.

Looking at other versions of (x86) gcc, I see .text sizes of

             after    before
gcc-3.4.6 10855 12977
gcc-4.0.4 11088 11088
gcc-4.1.3 10973 10973
gcc-4.2.5 11183 11183
gcc-4.3.6 15501 17724
gcc-4.4.7 13337 15693
gcc-4.5.4 13162 15491
gcc-4.6.4 14846 17302
gcc-4.7.4 14187 16294
gcc-4.8.5 16591 18730
gcc-4.9.4 19582 21995
gcc-5.4.1 18294 22510
gcc-6.1.1 20487 25172
gcc-6.3.1 20487 25172
gcc-7.0.0 20351 31789
gcc-7.0.1 20351 24966
gcc-7.1.1 20383 24982
gcc-8.0.0 20686 25065

It seems whatever happened in early versions of gcc-7 has since
improved, and it probably was a bug since older and newer versions
create similar code size (I have not looked at the actual object code).

The 5K difference in gcc-5 and higher still seems like a lot. It would
also be interesting to look at the decompression performance of
this code witth the different compilers to see if it got better or worse.

Most likely, gcc got better at inlining and unrolling parts of the
algorithm, but sometimes an object file that doubles or triples in
size is an indication that the compiler did something really bad.

       Arnd
