From: Jesper Dangaard Brouer <jbrouer@redhat.com>
Date: Mon, 30 Mar 2020 11:34:42 +0000
Subject: Re: [PATCH net] veth: xdp: use head instead of hard_start
Message-Id: <20200330133442.132bde0c@carbon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200330102631.31286-1-maowenan@huawei.com>
In-Reply-To: <20200330102631.31286-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: davem@davemloft.net, ast@kernel.org, daniel@iogearbox.net, kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, jwi@linux.ibm.com, toshiaki.makita1@gmail.com, jianglidong3@jd.com, edumazet@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 30 Mar 2020 18:26:31 +0800
Mao Wenan <maowenan@huawei.com> wrote:

> xdp.data_hard_start is mapped to the first
> address of xdp_frame, but the pointer hard_start
> is the offset(sizeof(struct xdp_frame)) of xdp_frame,
> it should use head instead of hard_start to
> set xdp.data_hard_start. Otherwise, if BPF program
> calls helper_function such as bpf_xdp_adjust_head, it
> will be confused for xdp_frame_end.

I have noticed this[1] and have a patch in my current patchset for
fixing this.  IMHO is is not so important fix right now, as the effect
is that you currently only lose 32 bytes of headroom.

[1] https://lore.kernel.org/netdev/158446621887.702578.17234304084556809684.stgit@firesoul/

Fixing this now is going to be annoying and cause merge conflicts for
my patchset.  If you insist on fixing this now, you need to improve
commit message and also fix patch, see below.

> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/net/veth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/veth.c b/drivers/net/veth.c
> index d4cbb9e8c63f..5ea550884bf8 100644
> --- a/drivers/net/veth.c
> +++ b/drivers/net/veth.c
> @@ -506,7 +506,7 @@ static struct sk_buff *veth_xdp_rcv_one(struct veth_rq *rq,
>  		struct xdp_buff xdp;
>  		u32 act;
>  
> -		xdp.data_hard_start = hard_start;
> +		xdp.data_hard_start = head;

You also need update/remove the other lines doing this.

>  		xdp.data = frame->data;
>  		xdp.data_end = frame->data + frame->len;
>  		xdp.data_meta = frame->data - frame->metasize;



-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
