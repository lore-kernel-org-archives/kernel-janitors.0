From: Denys Vlasenko <vda.linux@googlemail.com>
Date: Mon, 24 Sep 2012 08:11:57 +0000
Subject: Re: [next:akpm 339/377] fs/binfmt_elf.c:1378:56: error: unknown type name 'compat_siginfo_t'
Message-Id: <CAK1hOcPtawAY=O5vdfVkN9uxhPJ=T+ucgzr095gG9FptPdfb-g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120924012949.GA9140@localhost>
In-Reply-To: <20120924012949.GA9140@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 24, 2012 at 3:29 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> commit: 50abbe878f885ac855d56b30f0bf08fd208dc87d [339/377] coredump: add a new elf note with siginfo of the signal
> config: tile-tilegx_defconfig
>
> All related error/warning messages:
>
> In file included from fs/compat_binfmt_elf.c:22:0:
> arch/tile/include/asm/sigframe.h:28:18: error: field 'uc' has incomplete type
> In file included from fs/compat_binfmt_elf.c:140:0:
> fs/binfmt_elf.c:1378:56: error: unknown type name 'compat_siginfo_t'
> fs/binfmt_elf.c:1703:2: error: unknown type name 'compat_siginfo_t'

Yes, I know... some additional work will be needed to unify
exposition of compat_siginfo_t across eight architectures :(
I'm working on it right now.

-- 
vda
