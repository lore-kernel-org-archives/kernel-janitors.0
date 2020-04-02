From: Toshiaki Makita <toshiaki.makita1@gmail.com>
Date: Thu, 02 Apr 2020 00:47:03 +0000
Subject: Re: [PATCH net v2] veth: xdp: use head instead of hard_start
Message-Id: <ede2f407-839e-d29e-0ebe-aa39dd461bfd@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fb5ab568-9bc8-3145-a8db-3e975ccdf846@gmail.com>
 <20200331060641.79999-1-maowenan@huawei.com>
 <7a1d55ad-1427-67fe-f204-4d4a0ab2c4b1@gmail.com>
 <20200401181419.7acd2aa6@carbon>
In-Reply-To: <20200401181419.7acd2aa6@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: Mao Wenan <maowenan@huawei.com>, davem@davemloft.net, ast@kernel.org, daniel@iogearbox.net, kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, jwi@linux.ibm.com, jianglidong3@jd.com, edumazet@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2020/04/02 1:15, Jesper Dangaard Brouer wrote:
...
> [PATCH RFC net-next] veth: adjust hard_start offset on redirect XDP frames
> 
> When native XDP redirect into a veth device, the frame arrives in the
> xdp_frame structure. It is then processed in veth_xdp_rcv_one(),
> which can run a new XDP bpf_prog on the packet. Doing so requires
> converting xdp_frame to xdp_buff, but the tricky part is that
> xdp_frame memory area is located in the top (data_hard_start) memory
> area that xdp_buff will point into.
> 
> The current code tried to protect the xdp_frame area, by assigning
> xdp_buff.data_hard_start past this memory. This results in 32 bytes
> less headroom to expand into via BPF-helper bpf_xdp_adjust_head().
> 
> This protect step is actually not needed, because BPF-helper
> bpf_xdp_adjust_head() already reserve this area, and don't allow
> BPF-prog to expand into it. Thus, it is safe to point data_hard_start
> directly at xdp_frame memory area.
> 
> Cc: Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>

FYI: This mail address is deprecated.

> Fixes: 9fc8d518d9d5 ("veth: Handle xdp_frames in xdp napi ring")
> Reported-by: Mao Wenan <maowenan@huawei.com>
> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>

FWIW,

Acked-by: Toshiaki Makita <toshiaki.makita1@gmail.com>
