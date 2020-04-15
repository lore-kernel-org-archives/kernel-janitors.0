From: maowenan <maowenan@huawei.com>
Date: Wed, 15 Apr 2020 01:37:08 +0000
Subject: Re: [PATCH -next] bpf: remove set but not used variable 'dst_known'
Message-Id: <2b2e0060-ef9b-5541-1108-e28464b47f0a@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413113703.194287-1-maowenan@huawei.com>
 <C75FACD4-8549-4AD1-BDE6-1F5B47095E4C@fb.com>
In-Reply-To: <C75FACD4-8549-4AD1-BDE6-1F5B47095E4C@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Song Liu <songliubraving@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@chromium.org" <kpsingh@chromium.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 2020/4/15 6:05, Song Liu wrote:
> 
> 
>> On Apr 13, 2020, at 4:37 AM, Mao Wenan <maowenan@huawei.com> wrote:
>>
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> kernel/bpf/verifier.c:5603:18: warning: variable ‘dst_known’
>> set but not used [-Wunused-but-set-variable]
>>
>> It is not used since commit f1174f77b50c ("bpf/verifier:
>> rework value tracking")
> 
> The fix makes sense. But I think f1174f77b50c introduced dst_known, 
> so this statement is not accurate. 
> 
thanks for review, yes, f1174f77b50c introduced dst_known, and below commit
doesn't deference variable dst_known. So I send v2 later?
3f50f132d840 ("bpf: Verifier, do explicit ALU32 bounds tracking")

>>
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> 
