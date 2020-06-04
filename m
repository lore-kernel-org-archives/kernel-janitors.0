From: Daniel Borkmann <daniel@iogearbox.net>
Date: Thu, 04 Jun 2020 21:43:25 +0000
Subject: Re: [PATCH v2 bpf-next] bpf: Fix an error code in check_btf_func()
Message-Id: <1834d76c-dfff-20ca-370c-443f42968588@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAADnVQJPwtan12Htu-0VhvuC3M-o_kbnPpN=SXVC-amn9BcZCw@mail.gmail.com>
 <20200604085436.GA943001@mwanda>
 <CAPhsuW7BK+4sJ42YpseWkHf0brW65se5HkQCkq-ONHx--sW4iw@mail.gmail.com>
In-Reply-To: <CAPhsuW7BK+4sJ42YpseWkHf0brW65se5HkQCkq-ONHx--sW4iw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Song Liu <song@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 6/4/20 8:37 PM, Song Liu wrote:
> On Thu, Jun 4, 2020 at 1:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> This code returns success if the "info_aux" allocation fails but it
>> should return -ENOMEM.
>>
>> Fixes: 8c1b6e69dcc1 ("bpf: Compare BTF types of functions arguments with actual types")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Song Liu <songliubraving@fb.com>

Applied, thanks (my personal style preference would have been v1, but fair enough).
