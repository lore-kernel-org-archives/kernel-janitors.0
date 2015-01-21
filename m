From: David Rientjes <rientjes@google.com>
Date: Wed, 21 Jan 2015 23:01:18 +0000
Subject: Re: [PATCH 1/2] mm/slub: fix typo
Message-Id: <alpine.DEB.2.10.1501211459370.2716@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150120140142.cd2e32d83d66459562bd1717@freescale.com>
In-Reply-To: <20150120140142.cd2e32d83d66459562bd1717@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kim Phillips <kim.phillips@freescale.com>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 20 Jan 2015, Kim Phillips wrote:

> 
> Signed-off-by: Kim Phillips <kim.phillips@freescale.com>

Acked-by: David Rientjes <rientjes@google.com>

Although the patch description or title should probably say this is a typo 
in the comment of __slab_free().  It's good to differentiate typos in code 
vs comments for commit message readers who have to decide if they have to 
backport something.
