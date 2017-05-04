From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 04 May 2017 20:09:28 +0000
Subject: Re: [PATCH 3/9] drm/i915: Replace 14 seq_printf() calls by seq_puts()
Message-Id: <20170504200928.GL24019@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
 <56ab5065-5a24-47cf-023f-b10c6daf4799@users.sourceforge.net>
In-Reply-To: <56ab5065-5a24-47cf-023f-b10c6daf4799@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, May 04, 2017 at 06:54:16PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 May 2017 13:20:47 +0200
> 
> Some strings which did not contain data format specifications should be put
> into a sequence. Thus use the corresponding function "seq_puts".

debugfs / seq_file is not performance critical. Familiar idiomatic code is
much preferred over continually switching between seq_printf and seq_puts.

And don't even start on converting seq_printf / seq_puts to seq_putc...
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
