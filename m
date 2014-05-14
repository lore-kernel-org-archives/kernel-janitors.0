From: David Rientjes <rientjes@google.com>
Date: Wed, 14 May 2014 20:10:19 +0000
Subject: Re: [patch] mm: fix some indenting in cmpxchg_double_slab()
Message-Id: <alpine.DEB.2.02.1405141310080.9496@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140514161644.GF18082@mwanda>
In-Reply-To: <20140514161644.GF18082@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christoph Lameter <cl@linux-foundation.org>, Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Wed, 14 May 2014, Dan Carpenter wrote:

> The return statement goes with the cmpxchg_double() condition so it
> needs to be indented another tab.
> 
> Also these days the fashion is to line function parameters up, and it
> looks nicer that way because then the "freelist_new" is not at the same
> indent level as the "return 1;".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: David Rientjes <rientjes@google.com>
