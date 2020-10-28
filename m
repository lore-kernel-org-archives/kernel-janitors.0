From: Tom Rix <trix@redhat.com>
Date: Wed, 28 Oct 2020 13:59:03 +0000
Subject: Re: [PATCH] net: cls_api: remove unneeded local variable in tc_dump_chain()
Message-Id: <d956a5a5-c064-3fd4-5e78-809638ba14ef@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech


On 10/28/20 4:35 AM, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
>
> net/sched/cls_api.c:2964:3: warning: Value stored to 'parent' is never read
>   [clang-analyzer-deadcode.DeadStores]
>                 parent = 0;
>                 ^
>
> net/sched/cls_api.c:2977:4: warning: Value stored to 'parent' is never read
>   [clang-analyzer-deadcode.DeadStores]
>                         parent = q->handle;
>                         ^
>
> Commit 32a4f5ecd738 ("net: sched: introduce chain object to uapi")
> introduced tc_dump_chain() and this initial implementation already
> contained these unneeded dead stores.
>
> Simplify the code to make clang-analyzer happy.
>
> As compilers will detect these unneeded assignments and optimize this
> anyway, the resulting binary is identical before and after this change.
>
> No functional change. No change in object code.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master and next-20201028
>
> Jamal, Cong, Jiri, please ack.
> David, Jakub, please pick this minor non-urgent clean-up patch.
>
>  net/sched/cls_api.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
> index faeabff283a2..8ce830ca5f92 100644
> --- a/net/sched/cls_api.c
> +++ b/net/sched/cls_api.c
> @@ -2940,7 +2940,6 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  	struct tcf_chain *chain;
>  	long index_start;
>  	long index;
> -	u32 parent;
>  	int err;
>  
>  	if (nlmsg_len(cb->nlh) < sizeof(*tcm))
> @@ -2955,13 +2954,6 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  		block = tcf_block_refcnt_get(net, tcm->tcm_block_index);
>  		if (!block)
>  			goto out;
> -		/* If we work with block index, q is NULL and parent value
> -		 * will never be used in the following code. The check
> -		 * in tcf_fill_node prevents it. However, compiler does not
> -		 * see that far, so set parent to zero to silence the warning
> -		 * about parent being uninitialized.
> -		 */
> -		parent = 0;
>  	} else {
>  		const struct Qdisc_class_ops *cops;
>  		struct net_device *dev;
> @@ -2971,13 +2963,11 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  		if (!dev)
>  			return skb->len;
>  
> -		parent = tcm->tcm_parent;
> -		if (!parent) {
> +		if (!tcm->tcm_parent)
>  			q = dev->qdisc;
> -			parent = q->handle;

This looks like a an unused error handler.

and the later call to

if (TC_H_MIN(tcm->tcm_parent)

maybe should be

if (TC_H_MIN(parent))

so I am skeptical that this change is ok because the code around it looks buggy.

Tom

> -		} else {
> +		else
>  			q = qdisc_lookup(dev, TC_H_MAJ(tcm->tcm_parent));
> -		}
> +
>  		if (!q)
>  			goto out;
>  		cops = q->ops->cl_ops;
