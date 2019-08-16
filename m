From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 16 Aug 2019 05:24:33 +0000
Subject: Re: [PATCH -next v2] btf: fix return value check in btf_vmlinux_init()
Message-Id: <CAADnVQK_NTZVXosgLDBg-in+HBDaK5d24heaR0HSkEw2L0g=6w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815142432.101401-1-weiyongjun1@huawei.com> <20190816024044.139761-1-weiyongjun1@huawei.com>
In-Reply-To: <20190816024044.139761-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 15, 2019 at 7:36 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function kobject_create_and_add() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Fixes: 341dfcf8d78e ("btf: expose BTF info through sysfs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Andrii Nakryiko <andriin@fb.com>

Applied. Thanks.

Please spell out [PATCH v2 bpf-next] in the subject next time.
