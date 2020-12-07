From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 07 Dec 2020 16:28:15 +0000
Subject: Re: [PATCH] bpf: propagate __user annotations properly
Message-Id: <CAKXUXMxy92jnARL-ibh1BDqSE3VvzKFMpo8YsC+40JMjFpcSHg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207123720.19111-1-lukas.bulwahn@gmail.com> <480e9a0f-0a27-aec2-e8c6-a73b46069ba8@fb.com>
In-Reply-To: <480e9a0f-0a27-aec2-e8c6-a73b46069ba8@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yonghong Song <yhs@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, kernel-janitors@vger.kernel.org

On Mon, Dec 7, 2020 at 5:12 PM Yonghong Song <yhs@fb.com> wrote:
>
>
>
> On 12/7/20 4:37 AM, Lukas Bulwahn wrote:
> > __htab_map_lookup_and_delete_batch() stores a user pointer in the local
> > variable ubatch and uses that in copy_{from,to}_user(), but ubatch misses a
> > __user annotation.
> >
> > So, sparse warns in the various assignments and uses of ubatch:
> >
> >    kernel/bpf/hashtab.c:1415:24: warning: incorrect type in initializer
> >      (different address spaces)
> >    kernel/bpf/hashtab.c:1415:24:    expected void *ubatch
> >    kernel/bpf/hashtab.c:1415:24:    got void [noderef] __user *
> >
> >    kernel/bpf/hashtab.c:1444:46: warning: incorrect type in argument 2
> >      (different address spaces)
> >    kernel/bpf/hashtab.c:1444:46:    expected void const [noderef] __user *from
> >    kernel/bpf/hashtab.c:1444:46:    got void *ubatch
> >
> >    kernel/bpf/hashtab.c:1608:16: warning: incorrect type in assignment
> >      (different address spaces)
> >    kernel/bpf/hashtab.c:1608:16:    expected void *ubatch
> >    kernel/bpf/hashtab.c:1608:16:    got void [noderef] __user *
> >
> >    kernel/bpf/hashtab.c:1609:26: warning: incorrect type in argument 1
> >      (different address spaces)
> >    kernel/bpf/hashtab.c:1609:26:    expected void [noderef] __user *to
> >    kernel/bpf/hashtab.c:1609:26:    got void *ubatch
> >
> > Add the __user annotation to repair this chain of propagating __user
> > annotations in __htab_map_lookup_and_delete_batch().
>
> Add fix tag?
>
> Fixes: 057996380a42 ("bpf: Add batch ops to all htab bpf map")
>

Fixes tag can be added by the maintainers when they pick it, but I
personally am not a fan of adding a Fixes tag for such a minor fix
here.

It is purely a syntactic change and change for the sparse semantic
parser, but it really does not need to be backported and nothing
observable in the binary was broken.

That is my rationale for not adding a Fixes: tag here. It is your final call.

> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
> Thanks for the fix. LGTM. I guess either bpf or bpf-next tree is fine
> since this is not a correctness issue.
>

Agree, and it is no functional change, nor a change in the object
code. So risks of regressions are very, very low (zero).

Thanks for the review,

Lukas
