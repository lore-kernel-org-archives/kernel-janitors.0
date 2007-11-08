From: "Mike Frysinger" <vapier.adi@gmail.com>
Date: Thu, 08 Nov 2007 18:59:02 +0000
Subject: Re: [Uclinux-dist-devel] [PATCH] BLACKFIN - remove dead config symbol from BLACKFIN code
Message-Id: <8bd0f97a0711081059o531019e1i4edefbf9d0529578@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Nov 8, 2007 10:01 AM, Jiri Olsa <olsajiri@gmail.com> wrote:
> remove dead config symbols from BLACKFIN code
> Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
>
> ---
>  include/asm-blackfin/mach-bf527/mem_init.h |    9 +--------
>  include/asm-blackfin/mach-bf537/mem_init.h |    9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)

sorry, but we'd prefer the mem_init.h files just sit until we get a
chance to throw it out and redo it
-mike
