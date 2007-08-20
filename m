From: Christoph Lameter <clameter@sgi.com>
Date: Mon, 20 Aug 2007 18:57:55 +0000
Subject: Re: [PATCH 5/5] mm/... convert #include "linux/..." to #include
Message-Id: <Pine.LNX.4.64.0708201157320.28863@schroedinger.engr.sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561983.4200.145.camel@localhost>
 <Pine.LNX.4.64.0708201106230.25248@schroedinger.engr.sgi.com>
 <1187635766.5963.3.camel@localhost>
In-Reply-To: <1187635766.5963.3.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <dada1@cosmosbay.com>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-mm@kvack.org

On Mon, 20 Aug 2007, Joe Perches wrote:

> Maybe.  I think it's just a simple error.
> 
> mm/slab.c has 2 other includes of
> 
> 	#include <linux/kmalloc_sizes.h>
> 
> cheers, Joe

Ahh. ok.

Then

Acked-by: Christoph Lameter <clameter@sgi.com>

