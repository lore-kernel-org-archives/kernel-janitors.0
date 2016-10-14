From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 14 Oct 2016 09:43:05 +0000
Subject: Re: [patch] irqchip/gicv3: fix a loop timeout
Message-Id: <19e3e31c-aa5d-1386-4e76-cb79befe5361@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161014072534.GA15168@mwanda>
In-Reply-To: <20161014072534.GA15168@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 14/10/16 08:26, Dan Carpenter wrote:
> We expect the loop to exit with "count" set to zero so let's switch it
> from a post-op to a pre-op count down.  Otherwise we don't see the error
> message when this times out.
>

Nice catch.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
