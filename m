From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 03 Oct 2012 07:07:17 +0000
Subject: Re: usr/include/linux/kvm_para.h:26: included file 'asm-m68k/kvm_para.h' is not exported
Message-Id: <CAMuHMdXZe+cESgU21uB5-QbJa62=Qt8Z7d67-B1-onmUoFAKTQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003014416.GA10769@localhost>
In-Reply-To: <20121003014416.GA10769@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On Wed, Oct 3, 2012 at 3:44 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> FYI, something goes wrong since
>
> commit: 2bbc89a8e9c652ee71c6c3b2e0679b7ecedb1a09  m68k: Use Kbuild logic to import asm-generic headers
> config: m68k-allmodconfig
>
> All error/warnings:
>
> usr/include/linux/kexec.h:49: userspace cannot reference function or variable defined in the kernel
> usr/include/linux/kvm_para.h:26: included file 'asm-m68k/kvm_para.h' is not exported
> usr/include/linux/soundcard.h:1054: userspace cannot reference function or variable defined in the kernel

Yes, this is a known issue, cfr. e.g. https://lkml.org/lkml/2012/9/16/77
The kvm and kbuild people have to get their act together and agree on
a solution.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
