From: Vinod Koul <vinod.koul@intel.com>
Date: Thu, 05 Feb 2015 01:53:28 +0000
Subject: Re: [patch] dmaengine: s3c24xx: missing unlock on an error path
Message-Id: <20150205015328.GL4489@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150130082933.GC21357@mwanda>
In-Reply-To: <20150130082933.GC21357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 30, 2015 at 11:29:33AM +0300, Dan Carpenter wrote:
> We should unlock here before returning -EINVAL.
> 
> Fixes: 39ad46009654 ('dmaengine: s3c24xx: Split device_control')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Applied, thanks

-- 
~Vinod

