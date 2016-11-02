From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 02 Nov 2016 19:01:37 +0000
Subject: Re: [PATCH] cxl: Fix error handling
Message-Id: <CA+r1ZhixdKcgKDR3_No_5=M7BFo25M9mwfyxcVMLjfi=8Dtdmg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
 <87wpgp13ki.fsf@concordia.ellerman.id.au>
 <CA+r1ZhiJW6xQ1VwgLudFzFBxkKzkURv7MZhWtmSevRHc9aUyxA@mail.gmail.com>
 <87eg2unnil.fsf@concordia.ellerman.id.au>
In-Reply-To: <87eg2unnil.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Nov 2, 2016 at 4:12 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> Jim Davis <jim.epost@gmail.com> writes:
>
>> On Sun, Oct 30, 2016 at 10:37 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>> More here:
>>>
>>> https://github.com/linuxppc/linux/wiki/Building-powerpc-kernels
>>
>> Cool; the little-endian build worked fine, but
>
> Yay, thanks for trying.
>
>> jim@krebstar:~/linux-rc$ make ARCH=powerpc
>> CROSS_COMPILE=powerpc64-linux-gnu- vmlinux
>> make: powerpc64-linux-gnu-gcc: Command not found
>> make: powerpc64-linux-gnu-gcc: Command not found
>> scripts/kconfig/conf  --silentoldconfig Kconfig
>> make: powerpc64-linux-gnu-gcc: Command not found

But I cleverly tried to run the Fedora command on Ubuntu... when I run
the right command for Ubuntu, the build worked just fine.  D'oh!

Nit: make distclean missed a few files

jim@krebstar:~/linux-rc$ make distclean; git clean -fdx
  CLEAN   .
  CLEAN   drivers/tty/vt
  CLEAN   drivers/video/logo
  CLEAN   firmware
  CLEAN   kernel
  CLEAN   lib
  CLEAN   usr
  CLEAN   .tmp_versions
  CLEAN   scripts/basic
  CLEAN   scripts/dtc
  CLEAN   scripts/genksyms
  CLEAN   scripts/kconfig
  CLEAN   scripts/mod
  CLEAN   scripts
  CLEAN   include/config include/generated arch/powerpc/include/generated
  CLEAN   .config .version Module.symvers
Removing arch/powerpc/kernel/systbl_chk.i
Removing arch/powerpc/kernel/vdso32/vdso32.lds
Removing arch/powerpc/kernel/vdso32/vdso32.so
Removing arch/powerpc/kernel/vdso32/vdso32.so.dbg
Removing arch/powerpc/kernel/vdso64/vdso64.lds
Removing arch/powerpc/kernel/vdso64/vdso64.so
Removing arch/powerpc/kernel/vdso64/vdso64.so.dbg
Removing arch/powerpc/kernel/vmlinux.lds

-- 
Jim
