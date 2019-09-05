From: David Miller <davem@davemloft.net>
Date: Thu, 05 Sep 2019 07:37:19 +0000
Subject: Re: [PATCH][next] net/sched: cbs: remove redundant assignment to variable port_rate
Message-Id: <20190905.003719.181800411074203471.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190902182637.22167-1-colin.king@canonical.com>
In-Reply-To: <20190902182637.22167-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  2 Sep 2019 19:26:37 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable port_rate is being initialized with a value that is never read
> and is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
