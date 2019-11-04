From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Mon, 04 Nov 2019 16:29:38 +0000
Subject: Re: [PATCH bpf] bpf: offload: unlock on error in bpf_offload_dev_create()
Message-Id: <20191104082938.351c1f07@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104091536.GB31509@mwanda>
In-Reply-To: <20191104091536.GB31509@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 4 Nov 2019 12:15:36 +0300, Dan Carpenter wrote:
> We need to drop the bpf_devs_lock on error before returning.
> 
> Fixes: 9fd7c5559165 ("bpf: offload: aggregate offloads per-device")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
