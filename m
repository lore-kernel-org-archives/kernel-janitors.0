From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 06 May 2019 17:34:28 +0000
Subject: Re: [PATCH][next] taprio: add null check on sched_nest to avoid potential null pointer dereference
Message-Id: <CAM_iQpWZUjJS31cmW81C34DTfy1SV6ajBxFyo-yAmGppksKrHA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190505215019.4639-1-colin.king@canonical.com>
In-Reply-To: <20190505215019.4639-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, Linux Kernel Network Developers <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, May 5, 2019 at 2:50 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The call to nla_nest_start_noflag can return a null pointer and currently
> this is not being checked and this can lead to a null pointer dereference
> when the null pointer sched_nest is passed to function nla_nest_end. Fix
> this by adding in a null pointer check.
>
> Addresses-Coverity: ("Dereference null return value")
> Fixes: a3d43c0d56f1 ("taprio: Add support adding an admin schedule")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Cong Wang <xiyou.wangcong@gmail.com>

Thanks.
