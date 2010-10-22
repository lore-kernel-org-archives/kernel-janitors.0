From: "Koul, Vinod" <vinod.koul@intel.com>
Date: Fri, 22 Oct 2010 04:20:49 +0000
Subject: RE: [patch 2/3] Staging: sst: more dereferencing user pointers
Message-Id: <438BB0150E931F4B9CE701519A44630104BE87ED87@bgsmsx502.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101019055704.GD5839@bicker>
In-Reply-To: <20101019055704.GD5839@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

 
> This is another patch about making a copy of the data into kernel space
> before using it.  It is easy to trigger a kernel oops in the original
> code.  If you passed a NULL to SNDRV_SST_SET_TARGET_DEVICE then it
> called BUG_ON().  And SNDRV_SST_DRIVER_INFO would let you write the
> information to arbitrary memory locations which is a security violation.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked by: Vinod Koul <Vinod.koul@intel.com>

~Vinod
