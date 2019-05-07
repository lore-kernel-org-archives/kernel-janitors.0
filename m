From: David Miller <davem@davemloft.net>
Date: Tue, 07 May 2019 19:15:50 +0000
Subject: Re: [PATCH][next] taprio: add null check on sched_nest to avoid potential null pointer dereference
Message-Id: <20190507.121550.257256216928661084.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190505215019.4639-1-colin.king@canonical.com>
In-Reply-To: <20190505215019.4639-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun,  5 May 2019 22:50:19 +0100

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

Applied.
