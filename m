From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Fri, 09 May 2008 04:31:36 +0000
Subject: Re: [PATCH] POWERPC: Get rid of leftover printk in isa-bridge.c
Message-Id: <1210307496.1421.134.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1210264877.13845.274.camel@localhost.localdomain>
In-Reply-To: <1210264877.13845.274.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nate Case <ncase@xes-inc.com>
Cc: linuxppc-dev@ozlabs.org, kernel-janitors@vger.kernel.org


On Thu, 2008-05-08 at 11:41 -0500, Nate Case wrote:
> This printk() appears twice in the same function.  Only the latter one
> in the inval_range: section appears to be legitimate.
> 
> Signed-off-by: Nate Case <ncase@xes-inc.com>

Ack.


