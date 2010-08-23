From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 23 Aug 2010 11:36:43 +0000
Subject: Re: [patch] i915: return -EFAULT if copy_to_user fails
Message-Id: <89k83a$9d5e6n@azsmga001.ch.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100623170217.GA15424@bicker>
In-Reply-To: <20100623170217.GA15424@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>

On Wed, 23 Jun 2010 19:03:01 +0200, Dan Carpenter <error27@gmail.com> wrote:
> copy_to_user() returns the number of bytes remaining to be copied and
> I'm pretty sure we want to return a negative error code here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

-- 
Chris Wilson, Intel Open Source Technology Centre
