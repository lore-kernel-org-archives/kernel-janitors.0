From: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 30 Oct 2020 21:06:41 +0000
Subject: Re: [PATCH] net: cls_api: remove unneeded local variable in tc_dump_chain()
Message-Id: <20201030140641.4fbeb575@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S .
 Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On Wed, 28 Oct 2020 12:35:33 +0100 Lukas Bulwahn wrote:
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

Applied, thanks!
