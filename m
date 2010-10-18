From: "Harsha, Priya" <priya.harsha@intel.com>
Date: Mon, 18 Oct 2010 15:43:08 +0000
Subject: RE: [patch 3/2] Staging: sst: more copy_to_user() changes
Message-Id: <98769532B4BB14429434178695419EAE053605A67C@bgsmsx501.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015191044.GM6614@bicker>
In-Reply-To: <20101015191044.GM6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> Vinod wanted the copy_to_user() calls in this format:
> 	if (copy_to_user())
> 		retval = -EFAULT;
> instead of this:
> 	retval = copy_to_user();
> 	if (retval)
> 		retval = -EFAULt;
> 
> I've done that for the whole intel_sst_app_interface.c file.  In the
> process I noticed a couple more places that returned -EBUSY or -EAGAIN
> instead of -EFAULT.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
Acked-by: Harsha Priya <priya.harsha@intel.com>
