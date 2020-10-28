From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 28 Oct 2020 17:38:45 +0000
Subject: Re: [PATCH] net: cls_api: remove unneeded local variable in tc_dump_chain()
Message-Id: <CAM_iQpUfE2f3QBFY6r0_D2mzFK_SsmFXdA-1p3h7yquM8912fg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201028113533.26160-1-lukas.bulwahn@gmail.com> <d956a5a5-c064-3fd4-5e78-809638ba14ef@redhat.com>
In-Reply-To: <d956a5a5-c064-3fd4-5e78-809638ba14ef@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rix <trix@redhat.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Linux Kernel Network Developers <netdev@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On Wed, Oct 28, 2020 at 6:59 AM Tom Rix <trix@redhat.com> wrote:
>
>
> On 10/28/20 4:35 AM, Lukas Bulwahn wrote:
> > @@ -2971,13 +2963,11 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
> >               if (!dev)
> >                       return skb->len;
> >
> > -             parent = tcm->tcm_parent;
> > -             if (!parent) {
> > +             if (!tcm->tcm_parent)
> >                       q = dev->qdisc;
> > -                     parent = q->handle;
>
> This looks like a an unused error handler.
>
> and the later call to
>
> if (TC_H_MIN(tcm->tcm_parent)
>
> maybe should be
>
> if (TC_H_MIN(parent))

When tcm->tcm_parent is 0, TC_H_MIN(tcm->tcm_parent) is also 0,
so we will not hit that if branch.

So, I think Lukas' patch is correct.

Thanks.
