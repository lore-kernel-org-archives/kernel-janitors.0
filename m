From: Yonghong Song <yhs@fb.com>
Date: Tue, 24 Mar 2020 16:19:54 +0000
Subject: Re: [PATCH v2] bpf: fix build warning - missing prototype
Message-Id: <993c9ee8-86b4-5aa0-ce96-ae0621f7ed22@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7c27e51f-6a64-7374-b705-450cad42146c@fb.com>
 <20200324072231.5780-1-jpmenil@gmail.com>
In-Reply-To: <20200324072231.5780-1-jpmenil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Philippe Menil <jpmenil@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org



On 3/24/20 12:22 AM, Jean-Philippe Menil wrote:
> Fix build warnings when building net/bpf/test_run.o with W=1 due
> to missing prototype for bpf_fentry_test{1..6}.
> 
> Declare prototypes in order to silence warnings.
> 
> Signed-off-by: Jean-Philippe Menil <jpmenil@gmail.com>

Acked-by: Yonghong Song <yhs@fb.com>
