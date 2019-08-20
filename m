From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 20 Aug 2019 09:25:29 +0000
Subject: Re: [PATCH -next] bpf: Use PTR_ERR_OR_ZERO in xsk_map_inc()
Message-Id: <CAJ+HfNhRf+=yN6eOOZ1zp8=VicT-k6nHLO6r+f__O5X3M+N=ug@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190820013652.147041-1-yuehaibing@huawei.com>
 <93fafdab-8fb3-0f2b-8f36-0cf297db3cd9@intel.com> <20190820085547.GE4451@kadam>
In-Reply-To: <20190820085547.GE4451@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, YueHaibing <yuehaibing@huawei.com>, "Karlsson, Magnus" <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 20 Aug 2019 at 10:59, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Aug 20, 2019 at 09:28:26AM +0200, Björn Töpel wrote:
> > For future patches: Prefix AF_XDP socket work with "xsk:" and use "PATCH
> > bpf-next" to let the developers know what tree you're aiming for.
>
> There are over 300 trees in linux-next.  It impossible to try remember
> everyone's trees.  No one else has this requirement.
>

Net/bpf are different, and I wanted to point that out to lessen the
burden for the maintainers. It's documented in:

Documentation/bpf/bpf_devel_QA.rst.
Documentation/networking/netdev-FAQ.rst

> Maybe add it as an option to get_maintainer.pl --tree <hash> then that
> would be very easy.
>

Yes, improved tooling would help.


Cheers,
Björn

> regards,
> dan carpenter
>
