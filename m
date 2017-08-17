From: Edward Cree <ecree@solarflare.com>
Date: Thu, 17 Aug 2017 12:53:33 +0000
Subject: Re: [bug report] bpf/verifier: track liveness for pruning
Message-Id: <1ba0b3b0-c63e-8073-9118-7b8306a9ded7@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817074415.s24acvnsrask6ue2@mwanda>
In-Reply-To: <20170817074415.s24acvnsrask6ue2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 17/08/17 13:00, Daniel Borkmann wrote:
> On 08/17/2017 09:44 AM, Dan Carpenter wrote:
>> Hello Edward Cree,
>>
>> The patch dc503a8ad984: "bpf/verifier: track liveness for pruning"
>> from Aug 15, 2017, leads to the following static checker warning:
>>
>>     kernel/bpf/verifier.c:3463 do_propagate_liveness()
>>     error: buffer overflow 'parent->regs' 11 <= 63
>
> This should be the below. Will submit a proper one after some tests.
>
> Thanks for spotting!
>
> From 385a1a9f16bf70e0139b38a68252380d6380e003 Mon Sep 17 00:00:00 2001
> Message-Id: <385a1a9f16bf70e0139b38a68252380d6380e003.1502971079.git.daniel@iogearbox.net>
> From: Daniel Borkmann <daniel@iogearbox.net>
> Date: Thu, 17 Aug 2017 13:57:38 +0200
> Subject: [PATCH net-next] bpf: fix liveness propagation to parent in stack slots
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Edward Cree <ecree@solarflare.com>
> ---
>  kernel/bpf/verifier.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 958ba84..40f669d 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -3460,7 +3460,7 @@ static bool do_propagate_liveness(const struct bpf_verifier_state *state,
>          if (parent->spilled_regs[i].live & REG_LIVE_READ)
>              continue;
>          if (state->spilled_regs[i].live = REG_LIVE_READ) {
> -            parent->regs[i].live |= REG_LIVE_READ;
> +            parent->spilled_regs[i].live |= REG_LIVE_READ;
>              touched = true;
>          }
>      }
The information contained in this message is confidential and is intended for the addressee(s) only. If you have received this message in error, please notify the sender immediately and delete the message. Unless you are an addressee (or authorized to receive for an addressee), you may not use, copy or disclose to anyone this message or any information contained in this message. The unauthorized use, disclosure, copying or alteration of this message is strictly prohibited.
