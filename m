From: Jarod Wilson <jarod@redhat.com>
Date: Mon, 14 Mar 2011 20:04:04 +0000
Subject: Re: [patch 1/2] Staging: crystalhd: change GFP_ATOMIC to GFP_KERNEL
Message-Id: <20110314200404.GC23071@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110314093125.GL2008@bicker>
In-Reply-To: <20110314093125.GL2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Mar 14, 2011 at 12:33:37PM +0300, Dan Carpenter wrote:
> These two allocations are only called from the probe() path and there
> aren't any locks held for probe().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> These apply on top of Alexander Beregalov's patches. 

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com

