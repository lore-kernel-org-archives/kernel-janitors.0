From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 19 Nov 2019 03:48:58 +0000
Subject: Re: [PATCH][next] bpf: fix memory leak on object 'data'
Message-Id: <CAADnVQLhoHvdnJrcG0Gj128e8w0uLvRqg+p9=GJTr=1R8VLS_A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191118114059.37287-1-colin.king@canonical.com>
In-Reply-To: <20191118114059.37287-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Nov 18, 2019 at 3:41 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The error return path on when bpf_fentry_test* tests fail does not
> kfree 'data'. Fix this by adding the missing kfree.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: faeb2dce084a ("bpf: Add kernel test functions for fentry testing")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied. Thanks
