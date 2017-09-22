From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Sep 2017 07:48:25 +0000
Subject: Re: [PATCH] lib/lz4: make arrays static const, reduces object code size
Message-Id: <CAK8P3a1ryR2oXnqrMt+L0_v1G+NggvejX+L31V=QtCBt1cfZWg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921221939.20820-1-colin.king@canonical.com>
 <5aab65d9-6da6-c770-b5aa-9edbdda31dec@wanadoo.fr> <250fe35e-77d3-a9c0-5613-ce1c65f4cb7f@canonical.com>
In-Reply-To: <250fe35e-77d3-a9c0-5613-ce1c65f4cb7f@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sven Schmidt <4sschmid@informatik.uni-hamburg.de>, Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Sep 22, 2017 at 1:11 AM, Colin Ian King
<colin.king@canonical.com> wrote:
> On 22/09/17 00:09, Christophe JAILLET wrote:
>> Le 22/09/2017 à 00:19, Colin King a écrit :
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Don't populate the read-only arrays dec32table and dec64table on the
>>> stack, instead make them both static const.  Makes the object code
>>> smaller by over 10K bytes:
>> 10k? Wouaouh! This is way much more than what you usually win with such
>> patches.
>
> Yes, I had to triple check it because it was an unbelievable win.
>

I wonder whether this should be reported as a gcc bug. I tried reproducing
it here with gcc-7.1.1 and gcc-8.0.0, but I only see a 4K difference:

   text    data     bss     dec     hex filename
  18220     176       0   18396    47dc build/tmp/lib/lz4/lz4_decompress-after.o
  22297       0       0   22297    5719
build/tmp/lib/lz4/lz4_decompress-before.o

I tried x86 defconfig and allmodconfig on a slightly patched mainline kernel.

        Arnd
