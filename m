From: Jeremy Fitzhardinge <jeremy@goop.org>
Date: Wed, 29 Oct 2008 12:58:11 +0000
Subject: Re: [PATCH 09/12] x86: Add static initiazlier for descriptors
Message-Id: <49085DE3.4010508@goop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1224904532-9586-1-git-send-email-ice799@gmail.com> <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com> <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com> <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com> <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com> <a4c806abcf7a46c78aaff4e338fdbc1a06a56c88.1224903712.git.ice799@gmail.com> <8834ad1ab5a5ab9b4902ab708160b23f078f3758.1224903712.git.ice799@gmail.com> <4d0ab6d642a4edc3ecc7367df7043ecc8f0a7f98.1224903712.git.ice799@gmail.com> <c53b3a54b3215187055dfe5673e1351d1bd3957a.1224903712.git.ice799@gmail.com> <e1bbf5a92bbf8fcf36dcbb650ee5f22d48d4b0f4.1224903712.git.ice799@gmail.com>
In-Reply-To: <e1bbf5a92bbf8fcf36dcbb650ee5f22d48d4b0f4.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Damato <ice799@gmail.com>
Cc: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Joe Damato wrote:
> Add static initializer for LDT/GDT/TSS descriptors.
>
> Signed-off-by: Joe Damato <ice799@gmail.com>
> ---
>  include/asm-x86/desc_defs.h |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
>
> diff --git a/include/asm-x86/desc_defs.h b/include/asm-x86/desc_defs.h
> index a1c6516..5119051 100644
> --- a/include/asm-x86/desc_defs.h
> +++ b/include/asm-x86/desc_defs.h
> @@ -91,6 +91,20 @@ typedef struct desc_struct tss_desc;
>                  , .dpl = (hi >> 13) & 3 \
>                  , .p   = (hi >> 15) & 1 \
>                  , .base1 = (hi >> 16) & 0xffff }
> +#define __DESC_INITIALIZER(lo,hi) \
> +                { .limit0 = lo & 0xffff \
> +                , .base0  = (lo >> 16) & 0xffff \
> +                , .base1  = hi & 0xff \
> +                , .type   = (hi >> 8) & 0xf \
> +                , .s      = (hi >> 12) & 1 \
> +                , .dpl    = (hi >> 13) & 3 \
> +                , .p      = (hi >> 15) & 1 \
> +                , .limit  = (hi >> 16) & 0xf \
> +                , .avl    = (hi >> 20) & 1 \
> +                , .l      = (hi >> 21) & 1 \
> +                , .d      = (hi >> 22) & 1 \
> +                , .g      = (hi >> 23) & 1 \
> +                ,.base2   = (hi >> 24) & 0xf }
>   

Reasonable as a transition, I guess, but it would be better to just make 
the initializers pass in proper values.  But I think it would be better 
to implement this with a union rather than repacking the packed values.

    J
