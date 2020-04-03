From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 03 Apr 2020 21:12:54 +0000
Subject: Re: [PATCH net v2] veth: xdp: use head instead of hard_start
Message-Id: <CAADnVQKs9hLUPB6vW+sC3pe1ivXKU3woJFvT=X2hCqT=NnZF7Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fb5ab568-9bc8-3145-a8db-3e975ccdf846@gmail.com>
 <20200331060641.79999-1-maowenan@huawei.com> <7a1d55ad-1427-67fe-f204-4d4a0ab2c4b1@gmail.com>
 <20200401181419.7acd2aa6@carbon> <ede2f407-839e-d29e-0ebe-aa39dd461bfd@gmail.com>
 <20200402110619.48f31a63@carbon> <CAADnVQKEyv_bRhEfu1Jp=DSggj_O2xjJyd_QZ7a4LJY+dUO2rg@mail.gmail.com>
 <20200403095847.21e1e5ea@carbon>
In-Reply-To: <20200403095847.21e1e5ea@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: Toshiaki Makita <toshiaki.makita1@gmail.com>, Mao Wenan <maowenan@huawei.com>, "David S. Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, jwi@linux.ibm.com, jianglidong3@jd.com, Eric Dumazet <edumazet@google.com>, Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Apr 3, 2020 at 12:59 AM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
>
> I want to wait to ease your life as maintainer. This is part of a
> larger patchset (for XDP frame_sz) and the next patch touch same code
> path and thus depend on these code adjustments.  If we apply them in
> bpf vs bpf-next then you/we will have to handle merge conflicts.  The
> severity of the "fix" is really low, it only means 32 bytes less
> headroom (which I doubt anyone is using).

Ahh. Make sense. That type of fix can wait.
Thanks!
