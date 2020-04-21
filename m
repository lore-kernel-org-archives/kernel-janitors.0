From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 21 Apr 2020 03:23:28 +0000
Subject: Re: [PATCH bpf-next v2] bpf: remove set but not used variable 'dst_known'
Message-Id: <20200421032328.fglmpdmnwnjts375@ast-mbp.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8855e82a-88d0-8d1e-e5e0-47e781f9653c@huawei.com>
 <20200418013735.67882-1-maowenan@huawei.com>
 <C7067847-8EDB-49B5-8DDF-C8504BB82962@fb.com>
In-Reply-To: <C7067847-8EDB-49B5-8DDF-C8504BB82962@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Song Liu <songliubraving@fb.com>
Cc: Mao Wenan <maowenan@huawei.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@chromium.org" <kpsingh@chromium.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, kernel-team@fb.com

On Sat, Apr 18, 2020 at 06:13:48AM +0000, Song Liu wrote:
> 
> 
> > On Apr 17, 2020, at 6:37 PM, Mao Wenan <maowenan@huawei.com> wrote:
> > 
> > Fixes gcc '-Wunused-but-set-variable' warning:
> > 
> > kernel/bpf/verifier.c:5603:18: warning: variable ‘dst_known’
> > set but not used [-Wunused-but-set-variable], delete this
> > variable.
> > 
> > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> 
> Acked-by: Song Liu <songliubraving@fb.com>
> 
> With one nit below. 
> 
> > ---
> > v2: remove fixes tag in commit log. 
> > kernel/bpf/verifier.c | 4 +---
> > 1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 04c6630cc18f..c9f50969a689 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -5600,7 +5600,7 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> > {
> > 	struct bpf_reg_state *regs = cur_regs(env);
> > 	u8 opcode = BPF_OP(insn->code);
> > -	bool src_known, dst_known;
> > +	bool src_known;
> 
> This is not a hard rule, but we prefer to keep variable definition in 
> "reverse Christmas tree" order. Since we are on this function, let's 
> reorder these definitions to something like:
> 
>         u64 insn_bitness = (BPF_CLASS(insn->code) = BPF_ALU64) ? 64 : 32;
>         struct bpf_reg_state *regs = cur_regs(env);
>         u8 opcode = BPF_OP(insn->code);
>         u32 dst = insn->dst_reg;
>         s64 smin_val, smax_val;
>         u64 umin_val, umax_val;
>         bool src_known;
>         int ret;

I don't want folks to keep re-sorting variables and making patches difficult
to backport, do git blame, causing bpf vs bpf-next conflicts, etc.

reverse xmas tree is not mandatory. It's a style preference.
I personally do it for new code, but very rarely for fixes.
And certainly not for this kind of cleanup.

Applied. Thanks
