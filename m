From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 10:30:26 +0000
Subject: Re: GPU-DRM-GMA500: Use kmalloc_array() in mid_get_vbt_data_r10()
Message-Id: <947cb23d-ee5a-b1cb-8699-f38a1478d58d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
 <fa298938-9e98-9f8e-524e-f43ebb2137ca@users.sourceforge.net>
 <87vaxqlwb8.fsf@intel.com>
In-Reply-To: <87vaxqlwb8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> A multiplication for the size determination of a memory allocation
>> indicated that an array data structure should be processed.
>> Thus use the corresponding function "kmalloc_array".
>>
>> This issue was detected by using the Coccinelle software.
> 
> Did you test this running on the hardware?

No. - My "test computer" does not provide the corresponding hardware for the
affected driver source files.

Regards,
Markus
