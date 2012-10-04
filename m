From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 04 Oct 2012 16:22:44 +0000
Subject: Re: [linus:master 98/99] drivers/base/firmware_class.c:72:28: sparse: incorrect type in argument 2 (
Message-Id: <CA+55aFx29ccQwswePK_kexh7--KApreL++ztXZZd9S7=1TaVRA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121004070623.GA31473@localhost>
In-Reply-To: <20121004070623.GA31473@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 4, 2012 at 12:06 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
>
> Shall we use kernel_read() in place of vfs_read()?

Indeed. Good catch. Thanks,

             Linus
