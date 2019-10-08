From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Tue, 08 Oct 2019 19:13:08 +0000
Subject: Re: [PATCH] nfp: bpf: make array exp_mask static, makes object smaller
Message-Id: <20191008121308.121c2748@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007115239.1742-1-colin.king@canonical.com>
In-Reply-To: <20191007115239.1742-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, oss-drivers@netronome.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon,  7 Oct 2019 12:52:39 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array exp_mask on the stack but instead make it
> static. Makes the object code smaller by 224 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   77832	   2290	      0	  80122	  138fa	ethernet/netronome/nfp/bpf/jit.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   77544	   2354	      0	  79898	  1381a	ethernet/netronome/nfp/bpf/jit.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
