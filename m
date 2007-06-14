From: Stelian Pop <stelian@popies.net>
Date: Thu, 14 Jun 2007 21:09:03 +0000
Subject: [KJ] Re: [PATCH]is_power_of_2-kernel/kfifo.c
Message-Id: <20070614210903.GA18833@sd291.sivit.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181817306.2474.22.camel@merlin.linuxcoe.com>
In-Reply-To: <1181817306.2474.22.camel@merlin.linuxcoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vignesh babu <vignesh.babu@wipro.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>

On Thu, Jun 14, 2007 at 04:05:06PM +0530, vignesh babu wrote:
> 
> 
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2
> 
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>

Signed-off-by: Stelian Pop <stelian@popies.net>

Thanks,

Stelian.
-- 
Stelian Pop <stelian@popies.net>    
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
