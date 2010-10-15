From: "Koul, Vinod" <vinod.koul@intel.com>
Date: Fri, 15 Oct 2010 04:36:59 +0000
Subject: RE: [patch 2/2] Staging: intel_sst: cleanup naming a little
Message-Id: <438BB0150E931F4B9CE701519A44630104BE763343@bgsmsx502.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015034458.GJ6614@bicker>
In-Reply-To: <20101015034458.GJ6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

 
> &sst_drv_ctx->streams[str_id].lock and &stream->lock are the same.
> The mutex_lock() uses &stream->lock so this makes things consistent and
> it's nicer to read as well.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Vinod Koul <vinod.koul@intel.com>

