From: Toshiaki Makita <toshiaki.makita1@gmail.com>
Date: Tue, 31 Mar 2020 05:45:26 +0000
Subject: Re: [PATCH net] veth: xdp: use head instead of hard_start
Message-Id: <fb5ab568-9bc8-3145-a8db-3e975ccdf846@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200330102631.31286-1-maowenan@huawei.com>
 <20200330133442.132bde0c@carbon>
 <3053de4c-cee6-f6fc-efc2-09c6250f3ef2@gmail.com>
 <e7cf1271-2953-a5aa-ab25-c4b4a3843ee1@huawei.com>
In-Reply-To: <e7cf1271-2953-a5aa-ab25-c4b4a3843ee1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: maowenan <maowenan@huawei.com>, Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc: davem@davemloft.net, ast@kernel.org, daniel@iogearbox.net, kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, jwi@linux.ibm.com, jianglidong3@jd.com, edumazet@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2020/03/31 12:56, maowenan wrote:
> On 2020/3/31 7:35, Toshiaki Makita wrote:
>> Hi Mao & Jesper
>> (Resending with plain text...)
>>
>> On 2020/03/30 20:34, Jesper Dangaard Brouer wrote:
>>> On Mon, 30 Mar 2020 18:26:31 +0800
>>> Mao Wenan <maowenan@huawei.com> wrote:
>>>
>>>> xdp.data_hard_start is mapped to the first
>>>> address of xdp_frame, but the pointer hard_start
>>>> is the offset(sizeof(struct xdp_frame)) of xdp_frame,
>>>> it should use head instead of hard_start to
>>>> set xdp.data_hard_start. Otherwise, if BPF program
>>>> calls helper_function such as bpf_xdp_adjust_head, it
>>>> will be confused for xdp_frame_end.
>>>
>>> I have noticed this[1] and have a patch in my current patchset for
>>> fixing this.=C2=A0 IMHO is is not so important fix right now, as the ef=
fect
>>> is that you currently only lose 32 bytes of headroom.
>>>
> I consider that it is needed because bpf_xdp_adjust_head() just a common =
helper function,
> veth as one driver application should keep the same as 32 bytes of headro=
om as other driver.
> And convert_to_xdp_frame set() also store info in top of packet, and set:
> 	xdp_frame =3D xdp->data_hard_start;
>=20
>>> [1] https://lore.kernel.org/netdev/158446621887.702578.1723430408455680=
9684.stgit@firesoul/
>>
>> You are right, the subtraction is not necessary here.
> I guess you mean that previous subtraction is not necessary ? this line :=
 void *head =3D hard_start - sizeof(struct xdp_frame); ?

No I just mean subtraction of headroom is not necessary, and I noticed this=
=20
description was confusing. Sorry about that.
You can use "head" for data_hard_start.

Toshiaki Makita
