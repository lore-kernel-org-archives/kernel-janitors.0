From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 27 Oct 2010 21:30:08 +0000
Subject: Re: [patch] i915: fix impossible BUG_ON() test
Message-Id: <5b55a1$ig5qui@fmsmga002.fm.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101027212534.GM6062@bicker>
In-Reply-To: <20101027212534.GM6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, 27 Oct 2010 23:25:34 +0200, Dan Carpenter <error27@gmail.com> wrote:
> obj_priv->pin_count is unsigned so the BUG_ON(obj_priv->pin_count < 0)
> will never trigger.

I have the same change pending, but not queued for -fixes since it is
impossible.

Thanks,
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
