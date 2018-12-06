From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Dec 2018 09:34:20 +0000
Subject: Re: [PATCH] powerpc/ipic: Fix a bounds check in ipic_set_priority()
Message-Id: <20181206093420.GL3073@unbuntlaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203144834.ocxntjflfz2idxrb@kili.mountain>
 <87sgzchcw8.fsf@concordia.ellerman.id.au>
In-Reply-To: <87sgzchcw8.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Kim Phillips <kim.phillips@freescale.com>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Wed, Dec 05, 2018 at 02:26:47PM +1100, Michael Ellerman wrote:
> Can smatch help us find things like this that are defined non-static but
> never used?
> 

It's too tricky because it depends on the .config as well.

regards,
dan carpenter
