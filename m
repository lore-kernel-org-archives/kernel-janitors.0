From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 15:01:53 +0000
Subject: Re: drm/i915/gvt: Use common error handling code in shadow_workload_ring_buffer()
Message-Id: <9cab8303-6141-3f8b-5f2e-9ba0e9f34c1d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f563de94-afaa-ecde-2907-d6baaad65939@users.sourceforge.net>
 <87efpsiu7r.fsf@intel.com>
 <636f6272-9074-53dc-2c90-cbb4a7cd0901@users.sourceforge.net>
 <1A433E6A-DE06-4407-9E33-3CBBA4ADF01B@gmail.com>
 <20171024142615.t3y5atz6nulkq55h@mwanda>
 <1508856148.1955.12.camel@perches.com>
 <d92e1137-3d4c-8735-ceb4-4664a5803cdf@users.sourceforge.net>
 <1508856971.1955.13.camel@perches.com>
In-Reply-To: <1508856971.1955.13.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Cc: Garry Hurley <garry.hurley.jr@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

>> Do you prefer to delegate the proposed software refactoring
>> only to a corresponding optimiser?
> 
> yes.

Will any applications around the semantic patch language
(Coccinelle software) fit also in the preferred tool category?

Regards,
Markus
