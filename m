From: Daniel Borkmann <daniel@iogearbox.net>
Date: Wed, 02 Sep 2020 18:35:24 +0000
Subject: Re: [PATCH][next] xsk: fix incorrect memory allocation failure check on dma_map->dma_pages
Message-Id: <01a1216b-3b9e-1755-33a2-b491cf48ab8c@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902161332.199961-1-colin.king@canonical.com>
In-Reply-To: <20200902161332.199961-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/2/20 6:13 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The failed memory allocation check for dma_map->dma_pages is incorrect,
> it is null checking dma_map and not dma_map->dma_pages. Fix this.
> 
> Addresses-Coverity: ("Logicall dead code")
> Fixes: 921b68692abb ("xsk: Enable sharing of dma mappings")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, already applied a fix that was sent earlier [0].

   [0] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id6fd78a213ee3874f46bdce083b7a41d208886d
