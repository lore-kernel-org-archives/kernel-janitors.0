From: maowenan <maowenan@huawei.com>
Date: Wed, 15 Apr 2020 07:52:10 +0000
Subject: Re: [PATCH -next] bpf: remove set but not used variable 'dst_known'
Message-Id: <8855e82a-88d0-8d1e-e5e0-47e781f9653c@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413113703.194287-1-maowenan@huawei.com>
 <C75FACD4-8549-4AD1-BDE6-1F5B47095E4C@fb.com>
 <2b2e0060-ef9b-5541-1108-e28464b47f0a@huawei.com>
 <F68FB33A-1B98-45C1-8056-457EFA52F84F@fb.com>
In-Reply-To: <F68FB33A-1B98-45C1-8056-457EFA52F84F@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Song Liu <songliubraving@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@chromium.org" <kpsingh@chromium.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 2020/4/15 15:23, Song Liu wrote:
> 
> 
>> On Apr 14, 2020, at 6:37 PM, maowenan <maowenan@huawei.com> wrote:
>>
>> On 2020/4/15 6:05, Song Liu wrote:
>>>
>>>
>>>> On Apr 13, 2020, at 4:37 AM, Mao Wenan <maowenan@huawei.com> wrote:
>>>>
>>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>>
>>>> kernel/bpf/verifier.c:5603:18: warning: variable ‘dst_known’
>>>> set but not used [-Wunused-but-set-variable]
>>>>
>>>> It is not used since commit f1174f77b50c ("bpf/verifier:
>>>> rework value tracking")
>>>
>>> The fix makes sense. But I think f1174f77b50c introduced dst_known, 
>>> so this statement is not accurate. 
>>>
>> thanks for review, yes, f1174f77b50c introduced dst_known, and below commit
>> doesn't deference variable dst_known. So I send v2 later?
>> 3f50f132d840 ("bpf: Verifier, do explicit ALU32 bounds tracking")
> 
> I don't think we need to back port this to stable. So it is OK not to 
> include Fixes tag. We can just remove this statement in the commit log.
> 
> bpf-next is not open yet. Please send v2 when bpf-next is open. 
> 
> Thanks,
> Song
> 
OK, I will do that.
