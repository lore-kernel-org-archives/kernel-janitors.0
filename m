From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 20 Jun 2020 12:56:45 +0000
Subject: Re: [PATCH v2] drm/amdkfd: Fix memory leaks according to error branches
Message-Id: <8527c6b5-c3ed-340d-4ba0-6396d6cc5da2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0e76e678-94b1-8f69-d52c-2b67608d5ef8@web.de>
 <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Bernard Zhao <bernard@vivo.com>, opensource.kernel@vivo.com, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

>> I suggest to improve this change description.
>>
>> * Can an other wording variant be nicer?
>
> Markus's suggestion is as usual extremely imprecise.

I pointed a general possibility out. I did not propose an exact wording
alternative as it happened for other patches.


> However, I also find the message quite unclear.

I find this response interesting.


> It would be good to always use English words.

I am curious how this review will evolve further with such information
also after the third patch version.
https://lore.kernel.org/lkml/20200620091152.11206-1-bernard@vivo.com/
https://lore.kernel.org/patchwork/patch/1260303/

Regards,
Markus
