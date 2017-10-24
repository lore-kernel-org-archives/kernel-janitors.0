From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 14:40:10 +0000
Subject: Re: drm/i915/gvt: Use common error handling code in shadow_workload_ring_buffer()
Message-Id: <22f5cdc7-fb58-1d62-0d5e-a3465297bb00@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f563de94-afaa-ecde-2907-d6baaad65939@users.sourceforge.net>
 <87efpsiu7r.fsf@intel.com>
 <636f6272-9074-53dc-2c90-cbb4a7cd0901@users.sourceforge.net>
 <1A433E6A-DE06-4407-9E33-3CBBA4ADF01B@gmail.com>
 <20171024142615.t3y5atz6nulkq55h@mwanda>
In-Reply-To: <20171024142615.t3y5atz6nulkq55h@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Cc: Garry Hurley <garry.hurley.jr@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>

> This isn't the case here.

I find your view interesting for further clarification somehow.


> Instead of making the code more readable, we're making it more convoluted.

Can the shown software refactoring usually help here?


> It's just that two out of three error messages happened to be the same

This is true.


> and Markus wants to save a bit of memory by using the same string.

And also the same executable code (besides an identical error message).


> The memory savings is not so big that it's worth making the code less readable.

How does such a feedback fit to information for the deletion of questionable
messages at other source code places?

Regards,
Markus
