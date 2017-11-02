From: Daniel Borkmann <daniel@iogearbox.net>
Date: Thu, 02 Nov 2017 22:20:34 +0000
Subject: Re: [PATCH][net-next] net: sched: cls_bpf: use bitwise & rather than logical && on gen_flags
Message-Id: <59FB9A32.10802@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171102200412.16757-1-colin.king@canonical.com>
In-Reply-To: <20171102200412.16757-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/02/2017 09:04 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently gen_flags is being operated on by a logical && operator rather
> than a bitwise & operator. This looks incorrect as these should be bit
> flag operations. Fix this.
>
> Detected by CoverityScan, CID#1460305 ("Logical vs. bitwise operator")
>
> Fixes: 3f7889c4c79b ("net: sched: cls_bpf: call block callbacks for offload)
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
