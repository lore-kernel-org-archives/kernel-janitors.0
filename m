From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 13:17:47 +0000
Subject: Re: drm/i915/gvt: Use common error handling code in shadow_workload_ring_buffer()
Message-Id: <636f6272-9074-53dc-2c90-cbb4a7cd0901@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f563de94-afaa-ecde-2907-d6baaad65939@users.sourceforge.net>
 <87efpsiu7r.fsf@intel.com>
In-Reply-To: <87efpsiu7r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Add a jump target so that a call of the function "gvt_vgpu_err" is stored
>> only once at the end of this function implementation.
>> Replace two calls by goto statements.
>>
>> This issue was detected by using the Coccinelle software.
> 
> I don't think this is an issue or an improvement.

Do you care for the detail how often an error message is stored in the code?

Regards,
Markus
