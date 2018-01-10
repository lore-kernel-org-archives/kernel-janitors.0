From: Daniel Borkmann <daniel@iogearbox.net>
Date: Wed, 10 Jan 2018 10:39:14 +0000
Subject: Re: [PATCH][bpf-next] bpf: fix spelling mistake: "obusing" -> "abusing"
Message-Id: <753b49bf-57e3-a559-6275-880cca2d426d@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180110092054.23345-1-colin.king@canonical.com>
In-Reply-To: <20180110092054.23345-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/10/2018 10:20 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in error message text.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/bpf/verifier.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 97bbef3eecdf..e388f30c4168 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -5336,7 +5336,7 @@ static int fixup_bpf_calls(struct bpf_verifier_env *env)
>  			 */
>  			map_ptr = env->insn_aux_data[i + delta].map_ptr;
>  			if (map_ptr = BPF_MAP_PTR_POISON) {
> -				verbose(env, "tail_call obusing map_ptr\n");
> +				verbose(env, "tail_call abusing map_ptr\n");
>  				return -EINVAL;
>  			}
>  			if (!map_ptr->unpriv_array)
> 

This is not in bpf-next tree yet, but only in bpf tree. I will let this sit
for a bit in patchwork until bpf-next has all the stuff from bpf merged back,
and then apply it into bpf-next.

Thanks,
Daniel
