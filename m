From: Toshiaki Makita <toshiaki.makita1@gmail.com>
Date: Tue, 31 Mar 2020 06:16:22 +0000
Subject: Re: [PATCH net v2] veth: xdp: use head instead of hard_start
Message-Id: <7a1d55ad-1427-67fe-f204-4d4a0ab2c4b1@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fb5ab568-9bc8-3145-a8db-3e975ccdf846@gmail.com>
 <20200331060641.79999-1-maowenan@huawei.com>
In-Reply-To: <20200331060641.79999-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, davem@davemloft.net, ast@kernel.org, daniel@iogearbox.net, kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, jwi@linux.ibm.com, jianglidong3@jd.com, edumazet@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2020/03/31 15:06, Mao Wenan wrote:
> xdp.data_hard_start is equal to first address of
> struct xdp_frame, which is mentioned in
> convert_to_xdp_frame(). But the pointer hard_start
> in veth_xdp_rcv_one() is 32 bytes offset of frame,
> so it should use head instead of hard_start to
> set xdp.data_hard_start. Otherwise, if BPF program
> calls helper_function such as bpf_xdp_adjust_head, it
> will be confused for xdp_frame_end.

I think you should discuss this more with Jesper before
submitting v2.
He does not like this to be included now due to merge conflict risk.
Basically I agree with him that we don't need to hurry with this fix.

Toshiaki Makita

> 
> Fixes: 9fc8d518d9d5 ("veth: Handle xdp_frames in xdp napi ring")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>   v2: add fixes tag, as well as commit log.
>   drivers/net/veth.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/veth.c b/drivers/net/veth.c
> index d4cbb9e8c63f..5ea550884bf8 100644
> --- a/drivers/net/veth.c
> +++ b/drivers/net/veth.c
> @@ -506,7 +506,7 @@ static struct sk_buff *veth_xdp_rcv_one(struct veth_rq *rq,
>   		struct xdp_buff xdp;
>   		u32 act;
>   
> -		xdp.data_hard_start = hard_start;
> +		xdp.data_hard_start = head;
>   		xdp.data = frame->data;
>   		xdp.data_end = frame->data + frame->len;
>   		xdp.data_meta = frame->data - frame->metasize;
> 
