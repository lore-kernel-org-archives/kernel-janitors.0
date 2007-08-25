From: David Miller <davem@davemloft.net>
Date: Sat, 25 Aug 2007 05:28:07 +0000
Subject: Re: [kj] is_power_of_2 in net/core/neighbour.c
Message-Id: <20070824.222807.102129512.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187010227.7273.16.camel@merlin.linuxcoe.com>
In-Reply-To: <1187010227.7273.16.camel@merlin.linuxcoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vigneshbabu@gmail.com, vignesh.babu@wipro.com
Cc: roque@di.fc.ul.pt, kuznet@ms2.inr.ac.ru, netdev@vger.kernel.org, kernel-janitors@lists.osdl.org

From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 18:33:47 +0530

> Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)
> 
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>

Patch applied, thanks.
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
