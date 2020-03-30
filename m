From: Toshiaki Makita <toshiaki.makita1@gmail.com>
Date: Mon, 30 Mar 2020 23:35:39 +0000
Subject: Re: [PATCH net] veth: xdp: use head instead of hard_start
Message-Id: <3053de4c-cee6-f6fc-efc2-09c6250f3ef2@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200330102631.31286-1-maowenan@huawei.com>
 <20200330133442.132bde0c@carbon>
In-Reply-To: <20200330133442.132bde0c@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Dangaard Brouer <jbrouer@redhat.com>, Mao Wenan <maowenan@huawei.com>
Cc: davem@davemloft.net, ast@kernel.org, daniel@iogearbox.net, kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, jwi@linux.ibm.com, jianglidong3@jd.com, edumazet@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Mao & Jesper
(Resending with plain text...)

On 2020/03/30 20:34, Jesper Dangaard Brouer wrote:
> On Mon, 30 Mar 2020 18:26:31 +0800
> Mao Wenan <maowenan@huawei.com> wrote:
> 
>> xdp.data_hard_start is mapped to the first
>> address of xdp_frame, but the pointer hard_start
>> is the offset(sizeof(struct xdp_frame)) of xdp_frame,
>> it should use head instead of hard_start to
>> set xdp.data_hard_start. Otherwise, if BPF program
>> calls helper_function such as bpf_xdp_adjust_head, it
>> will be confused for xdp_frame_end.
> 
> I have noticed this[1] and have a patch in my current patchset for
> fixing this.  IMHO is is not so important fix right now, as the effect
> is that you currently only lose 32 bytes of headroom.
> 
> [1] https://lore.kernel.org/netdev/158446621887.702578.17234304084556809684.stgit@firesoul/

You are right, the subtraction is not necessary here.
Thank you for working on this.

Toshiaki Makita
