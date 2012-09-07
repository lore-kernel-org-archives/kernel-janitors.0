From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Fri, 07 Sep 2012 10:44:43 +0000
Subject: Re: [next:akpm 46/246] drivers/block/cciss.c:4270: undefined reference to `check_signature'
Message-Id: <CAC5umyhqFh9Jr-i9YuWF6eQX2WP0H53pN2bD6CO=xh5DqJdeJg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120907085729.GA19974@localhost>
In-Reply-To: <20120907085729.GA19974@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2012/9/7 Fengguang Wu <fengguang.wu@intel.com>:
> Hi Akinobu,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   d28e1f373a79e532eecbe6b17beeb4d2052c1a52
> commit: eb918a7ea0c312c61c3f45d104d71f95f10a5adf [46/246] cciss: use check_signature
> config: i386-randconfig-b997 (attached as .config)
>
> All related error/warning messages:
>
> drivers/built-in.o: In function `CISS_signature_present':
> drivers/block/cciss.c:4270: undefined reference to `check_signature'
>
> The above error looks persistent, at least it still exists several
> commits later, in [50/246] e1f762d block: partition: msdos: provide UUIDs for partitions

Thanks for catching this error.
CONFIG_CHECK_SIGNATURE is missing.
I'm now preparing a patch.

> net/built-in.o: In function `sock_edemux':
> net/core/sock.c:1529: undefined reference to `inet_twsk_put'
>
> The above error is an unrelated one.
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
