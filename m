From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 01 Nov 2016 23:36:35 +0000
Subject: Re: [PATCH] cxl: Fix error handling
Message-Id: <CA+r1ZhiJW6xQ1VwgLudFzFBxkKzkURv7MZhWtmSevRHc9aUyxA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
 <87wpgp13ki.fsf@concordia.ellerman.id.au>
In-Reply-To: <87wpgp13ki.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, Oct 30, 2016 at 10:37 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
>
>> 'cxl_dev_context_init()' returns an error pointer in case of error, not
>> NULL. So test it with IS_ERR.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> un-compiled because I don't have the required  cross build environment.
>
> Do you run Ubuntu or Fedora? If so it's just a dnf/apt-get away:
>
> $ sudo dnf install gcc-c++-powerpc64-linux-gnu binutils-powerpc64-linux-gnu gcc-powerpc64-linux-gnu
> or
> $ sudo apt-get install gcc-powerpc64le-linux-gnu gcc-powerpc-linux-gnu libc-dev-powerpc-cross libc-dev-ppc64el-cross
>
> More here:
>
> https://github.com/linuxppc/linux/wiki/Building-powerpc-kernels

Cool; the little-endian build worked fine, but

jim@krebstar:~/linux-rc$ make ARCH=powerpc
CROSS_COMPILE=powerpc64-linux-gnu- vmlinux
make: powerpc64-linux-gnu-gcc: Command not found
make: powerpc64-linux-gnu-gcc: Command not found
scripts/kconfig/conf  --silentoldconfig Kconfig
make: powerpc64-linux-gnu-gcc: Command not found

This is on Ubuntu 16.04; there's a /usr/bin/powerpc64le-linux-gnu-gcc
from installing gcc-powerpc64le-linux-gnu, and a
/usr/bin/powerpc-linux-gnu-gcc from installing gcc-powerpc-linux-gnu,
but no /usr/bin/powerpc64-linux-gnu-gcc.

-- 
Jim
