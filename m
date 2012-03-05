From: David Miller <davem@davemloft.net>
Date: Mon, 05 Mar 2012 21:51:05 +0000
Subject: Re: [PATCH 1/3] qla3xxx: ethernet: Fix bogus interrupt state flag.
Message-Id: <20120305.165105.1278606832898736557.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330700945-18195-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1330700945-18195-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: jitendra.kalsaria@qlogic.com, ron.mercer@qlogic.com, linux-driver@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri,  2 Mar 2012 20:39:05 +0530

> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> In 'ql_adapter_initialize'
> the first call for 'spin_unlock_irqrestore()' is with hw_flags = 0,
> which is as good as 'spin_unlock_irq()' (unconditional interrupt
> enabling). If this is intended, then for better performance
> 'spin_unlock_irqrestore()' can be replaced with 'spin_unlock_irq()'
> and 'spin_lock_irqsave()' can be replaced by 'spin_lock_irq()
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>

This change is definitely correct, applied, thanks.
