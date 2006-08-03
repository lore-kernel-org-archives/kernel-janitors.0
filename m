From: Paul Mundt <paul.mundt@renesas.com>
Date: Thu, 03 Aug 2006 20:43:47 +0000
Subject: Re: [KJ] [linuxsh-dev] [PATCH] sh: fix proc file removal
Message-Id: <1154637827.8280.0.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060803191828.GA5004@localhost.localdomain>
 <20060803124235.67bb664b.akpm@osdl.org>
 <20060803201857.GC5004@localhost.localdomain>
In-Reply-To: <20060803201857.GC5004@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>
Cc: Andrew Morton <akpm@osdl.org>, kernel-janitors@lists.osdl.org, lethal@linux-sh.org, kkojima@rr.iij4u.or.jp, linuxsh-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Thu, 2006-08-03 at 16:18 -0400, Neil Horman wrote:
> Patch to clean up proc file removal in sq module for superh arch.  currently on
> a failed module load or on module unload a proc file is left registered which
> can cause a random memory execution or oopses if read after unload.  This patch
> cleans up that deregistration.
> 
Looks good, thanks Neil.

Acked-by: Paul Mundt <paul.mundt@renesas.com>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
