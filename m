From: Jeff Garzik <jeff@garzik.org>
Date: Wed, 13 Jun 2007 20:17:20 +0000
Subject: [KJ] Re: [PATCH]is_power_of_2-myri10ge/myri10ge.c
Message-Id: <467050D0.6090600@garzik.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181624462.3109.22.camel@merlin.linuxcoe.com>
In-Reply-To: <1181624462.3109.22.camel@merlin.linuxcoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vignesh.babu@wipro.com
Cc: akpm <akpm@linux-foundation.org>, netdev@vger.kernel.org, Kernel Janitors List <kernel-janitors@lists.osdl.org>

vignesh babu wrote:
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2
> 
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>

Patches look OK, but please

* CC relevant driver maintainers, and
* combined all drivers/net/* patches of this nature into a single patch


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
