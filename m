From: Yuehaibing <yuehaibing@huawei.com>
Date: Tue, 20 Aug 2019 11:46:56 +0000
Subject: Re: [PATCH -next] bpf: Use PTR_ERR_OR_ZERO in xsk_map_inc()
Message-Id: <e98df2e2-6b57-6c1c-e80e-732434b177ad@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190820013652.147041-1-yuehaibing@huawei.com>
 <93fafdab-8fb3-0f2b-8f36-0cf297db3cd9@intel.com>
 <20190820085547.GE4451@kadam>
 <CAJ+HfNhRf+=yN6eOOZ1zp8=VicT-k6nHLO6r+f__O5X3M+N=ug@mail.gmail.com>
 <20190820094444.GA3964@kadam>
In-Reply-To: <20190820094444.GA3964@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, "Karlsson, Magnus" <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 2019/8/20 17:44, Dan Carpenter wrote:
> On Tue, Aug 20, 2019 at 11:25:29AM +0200, Bj=F6rn T=F6pel wrote:
>> On Tue, 20 Aug 2019 at 10:59, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
>>>
>>> On Tue, Aug 20, 2019 at 09:28:26AM +0200, Bj=F6rn T=F6pel wrote:
>>>> For future patches: Prefix AF_XDP socket work with "xsk:" and use "PAT=
CH
>>>> bpf-next" to let the developers know what tree you're aiming for.
>>>
>>> There are over 300 trees in linux-next.  It impossible to try remember
>>> everyone's trees.  No one else has this requirement.
>>>
>>
>> Net/bpf are different, and I wanted to point that out to lessen the
>> burden for the maintainers. It's documented in:
>>
>> Documentation/bpf/bpf_devel_QA.rst.
>> Documentation/networking/netdev-FAQ.rst
>=20
> Ah...  I hadn't realized that BPF patches were confusing to Dave.
>=20
> I actually do keep track of net and net-next.  I do quite a bit of extra
> stuff for netdev patches.  So what about if we used [PATCH] for bpf and
> [PATCH net] and [PATCH net-next] for networking?
>=20
> I will do that.

bpf-next is a good choice.

>=20
> regards,
> dan carpenter
>=20
> .
>=20
