From: David Rientjes <rientjes@google.com>
Date: Wed, 26 Sep 2012 04:13:56 +0000
Subject: Re: [PATCH] mm/slab: Fix typo _RET_IP -> _RET_IP_
Message-Id: <alpine.DEB.2.00.1209252113010.28360@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348571229-844-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1348571229-844-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mm@kvack.org, fengguang.wu@intel.com, Pekka Enberg <penberg@kernel.org>

On Tue, 25 Sep 2012, Ezequiel Garcia wrote:

> The bug was introduced by commit 7c0cb9c64f83
> "mm, slab: Replace 'caller' type, void* -> unsigned long".
> 

That commit SHA1 may not remain consistent, so it's better to just mention 
the name of the patch.  I also didn't see this in linux-next and had to 
look at Pekka's slab/next tree to find it since it wasn't indicated in the 
patch.

> Cc: Pekka Enberg <penberg@kernel.org>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>

Acked-by: David Rientjes <rientjes@google.com>
