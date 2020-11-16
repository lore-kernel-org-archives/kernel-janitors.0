From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 16 Nov 2020 17:24:39 +0000
Subject: Re: [PATCH] dmaengine: ioatdma: remove unused function missed during dma_v2 removal
Message-Id: <20201116171239.GX7499@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113081248.26416-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201113081248.26416-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Maciej Sosnowski <maciej.sosnowski@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org

On 13-11-20, 09:12, Lukas Bulwahn wrote:
> Commit 7f832645d0e5 ("dmaengine: ioatdma: remove ioatdma v2 registration")
> missed to remove dca2_tag_map_valid() during its removal. Hence, since
> then, dca2_tag_map_valid() is unused and make CC=clang W=1 warns:
> 
>   drivers/dma/ioat/dca.c:44:19:
>     warning: unused function 'dca2_tag_map_valid' [-Wunused-function]
> 
> So, remove this unused function and get rid of a -Wused-function warning.

Applied, thanks

-- 
~Vinod
