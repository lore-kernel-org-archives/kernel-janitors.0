From: Daniel Borkmann <daniel@iogearbox.net>
Date: Sat, 28 Mar 2020 17:15:37 +0000
Subject: Re: [PATCH v4] bpf: fix build warning - missing prototype
Message-Id: <8ec5aa95-4a3c-b2e1-7af2-6a4a2a6c0a5e@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3164e566-d54e-2254-32c4-d7fee47c37ea@iogearbox.net>
 <20200327204713.28050-1-jpmenil@gmail.com>
In-Reply-To: <20200327204713.28050-1-jpmenil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Philippe Menil <jpmenil@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/27/20 9:47 PM, Jean-Philippe Menil wrote:
> Fix build warnings when building net/bpf/test_run.o with W=1 due
> to missing prototype for bpf_fentry_test{1..6}.
> 
> Instead of declaring prototypes, turn off warnings with
> __diag_{push,ignore,pop} as pointed by Alexei.
> 
> Signed-off-by: Jean-Philippe Menil <jpmenil@gmail.com>

Applied, thanks!
