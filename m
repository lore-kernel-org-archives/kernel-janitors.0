From: Daniel Borkmann <daniel@iogearbox.net>
Date: Wed, 06 Nov 2019 23:23:18 +0000
Subject: Re: [PATCH bpf] bpf: offload: unlock on error in bpf_offload_dev_create()
Message-Id: <7c831580-49e5-6582-16df-86e70bad242e@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104091536.GB31509@mwanda>
In-Reply-To: <20191104091536.GB31509@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/4/19 10:15 AM, Dan Carpenter wrote:
> We need to drop the bpf_devs_lock on error before returning.
> 
> Fixes: 9fd7c5559165 ("bpf: offload: aggregate offloads per-device")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
