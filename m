From: "Koul, Vinod" <vinod.koul@intel.com>
Date: Thu, 21 Oct 2010 14:31:53 +0000
Subject: RE: [patch 1/3] Staging: sst: dereferencing user pointers
Message-Id: <438BB0150E931F4B9CE701519A44630104BE8125B8@bgsmsx502.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101019055624.GC5839@bicker>
In-Reply-To: <20101019055624.GC5839@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> This code dereferences user supplied pointers directly instead of doing
> a copy_from_user().  Some kernel configs put user and kernel memory in
> different address spaces so this code isn't portable.  Also the user
> memory could be swapped out or in this case the pointer could just be
> NULL leading to an oops.
> 
> Another thing is that it makes permission tests like this sort of
> meaningless.
> 	if (minor = STREAM_MODULE && rec_mute->stream_id = 0) {
> 		retval = -EPERM;
> 		break;
> 	}
> The user could set stream_id to 1 for the test and then change it later.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Vinod Koul <vinod.koul@intel.com>

