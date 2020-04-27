From: Daniel Borkmann <daniel@iogearbox.net>
Date: Mon, 27 Apr 2020 21:22:48 +0000
Subject: Re: [PATCH bpf-next v3 2/2] libbpf: Return err if bpf_object__load failed
Message-Id: <5c730cda-8177-3049-51c5-65e2f22958c5@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426063635.130680-1-maowenan@huawei.com>
 <20200426063635.130680-3-maowenan@huawei.com>
In-Reply-To: <20200426063635.130680-3-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, ast@kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org, andrii.nakryiko@gmail.com, dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/26/20 8:36 AM, Mao Wenan wrote:
> bpf_object__load() has various return code, when it failed to load
> object, it must return err instead of -EINVAL.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> Acked-by: Andrii Nakryiko <andriin@fb.com>

Applied, thanks!
