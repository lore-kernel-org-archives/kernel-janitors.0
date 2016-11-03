From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 03 Nov 2016 09:55:55 +0000
Subject: Re: [PATCH] cxl: Fix error handling
Message-Id: <87wpgknaz8.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
 <87wpgp13ki.fsf@concordia.ellerman.id.au>
 <CA+r1ZhiJW6xQ1VwgLudFzFBxkKzkURv7MZhWtmSevRHc9aUyxA@mail.gmail.com>
 <87eg2unnil.fsf@concordia.ellerman.id.au>
 <CA+r1ZhixdKcgKDR3_No_5=M7BFo25M9mwfyxcVMLjfi=8Dtdmg@mail.gmail.com>
In-Reply-To: <CA+r1ZhixdKcgKDR3_No_5=M7BFo25M9mwfyxcVMLjfi=8Dtdmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Davis <jim.epost@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>

Jim Davis <jim.epost@gmail.com> writes:

> On Wed, Nov 2, 2016 at 4:12 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Jim Davis <jim.epost@gmail.com> writes:
>>
>>> On Sun, Oct 30, 2016 at 10:37 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>>> More here:
>>>>
>>>> https://github.com/linuxppc/linux/wiki/Building-powerpc-kernels
>>>
>>> Cool; the little-endian build worked fine, but
>>
>> Yay, thanks for trying.
>>
>>> jim@krebstar:~/linux-rc$ make ARCH=powerpc
>>> CROSS_COMPILE=powerpc64-linux-gnu- vmlinux
>>> make: powerpc64-linux-gnu-gcc: Command not found
>>> make: powerpc64-linux-gnu-gcc: Command not found
>>> scripts/kconfig/conf  --silentoldconfig Kconfig
>>> make: powerpc64-linux-gnu-gcc: Command not found
>
> But I cleverly tried to run the Fedora command on Ubuntu... when I run
> the right command for Ubuntu, the build worked just fine.  D'oh!
>
> Nit: make distclean missed a few files

Ah thanks. I literally never do that, but it is supposed work. Have
filed a bug for it.

cheers
