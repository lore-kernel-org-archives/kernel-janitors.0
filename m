From: Martin Lau <kafai@fb.com>
Date: Mon, 29 Apr 2019 15:40:54 +0000
Subject: Re: [PATCH net-next] bpf: Use PTR_ERR_OR_ZERO in bpf_fd_sk_storage_update_elem()
Message-Id: <20190429154052.7qtxsqex5xure4a3@kafai-mbp.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190429135611.72640-1-yuehaibing@huawei.com>
 <20190429154017.j5yotcmvtw4fcbuo@kafai-mbp.dhcp.thefacebook.com>
In-Reply-To: <20190429154017.j5yotcmvtw4fcbuo@kafai-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Apr 29, 2019 at 08:40:17AM -0700, Martin KaFai Lau wrote:
> On Mon, Apr 29, 2019 at 01:56:11PM +0000, YueHaibing wrote:
> > Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> Acked-by: Martin KaFai Lau <kafai@fb.com>
btw, that should go to the bpf-next branch.
