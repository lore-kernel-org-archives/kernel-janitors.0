From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Sep 2017 19:38:08 +0000
Subject: Re: [PATCH] lib/lz4: make arrays static const, reduces object code size
Message-Id: <CAK8P3a3=zDN6pK8+yGO509kSZWBqccVp949PGwS=anfA8Xq5mw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921221939.20820-1-colin.king@canonical.com>
 <5aab65d9-6da6-c770-b5aa-9edbdda31dec@wanadoo.fr> <250fe35e-77d3-a9c0-5613-ce1c65f4cb7f@canonical.com>
 <CAK8P3a1ryR2oXnqrMt+L0_v1G+NggvejX+L31V=QtCBt1cfZWg@mail.gmail.com>
 <1506100881.12311.41.camel@perches.com> <CAK8P3a3KLjuntMkJW3xkgO5a-nTBVZm8LJVnX-RwsWJ084kuOw@mail.gmail.com>
In-Reply-To: <CAK8P3a3KLjuntMkJW3xkgO5a-nTBVZm8LJVnX-RwsWJ084kuOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Colin Ian King <colin.king@canonical.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sven Schmidt <4sschmid@informatik.uni-hamburg.de>, Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Sep 22, 2017 at 9:17 PM, Arnd Bergmann <arnd@arndb.de> wrote:

>              after    before
> gcc-3.4.6 10855 12977
> gcc-4.0.4 11088 11088
> gcc-4.1.3 10973 10973
> gcc-4.2.5 11183 11183
> gcc-4.3.6 15501 17724
> gcc-4.4.7 13337 15693
> gcc-4.5.4 13162 15491
> gcc-4.6.4 14846 17302
> gcc-4.7.4 14187 16294
> gcc-4.8.5 16591 18730
> gcc-4.9.4 19582 21995
> gcc-5.4.1 18294 22510
> gcc-6.1.1 20487 25172
> gcc-6.3.1 20487 25172
> gcc-7.0.0 20351 31789
> gcc-7.0.1 20351 24966
> gcc-7.1.1 20383 24982
> gcc-8.0.0 20686 25065

Here is the same table for 32-bit ARM, showing results that roughly
match my expectations of what we should see here

4.3.6 15318 16574
4.4.7 13364 14388
4.5.4 12856 13912
4.6.4 14596 15124
4.7.4 14942 15850
4.8.5 15454 16074
4.9.4 15994 16742
5.4.1 15930 16686
6.3.1 17302 18154
7.0.0 18042 18958
7.0.1 18278 19098
7.1.1 18302 19106
8.0.0 19710 20490

      Arnd
