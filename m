From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 23 Aug 2010 11:37:31 +0000
Subject: Re: [patch] i915: return -EFAULT if copy_to_user fails
Message-Id: <89k77n$oo9f4d@fmsmga001.fm.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100619131251.GB5467@bicker>
In-Reply-To: <20100619131251.GB5467@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Sat, 19 Jun 2010 15:12:51 +0200, Dan Carpenter <error27@gmail.com> wrote:
> copy_to_user returns the number of bytes remaining to be copied, but we
> want to return a negative error code here.  These are returned to
> userspace.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

-- 
Chris Wilson, Intel Open Source Technology Centre
