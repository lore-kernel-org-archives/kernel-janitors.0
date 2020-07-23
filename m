From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 23 Jul 2020 05:19:04 +0000
Subject: Re: [PATCH] drm/amdkfd: Put ACPI table after using it
Message-Id: <00444eb2-4bf4-bbe2-1727-d2f9eff110e2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hanjun Guo <guohanjun@huawei.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

…
> and in kfd_create_vcrat_image_cpu(), the acpi_table is only used to
> get the OEM info, so those table mappings need to be release after
…

1. Please avoid a typo for this change description.

2. An imperative wording can be preferred here, can't it?

3. Will the tag “Fixes” become helpful for the commit message?

Regards,
Markus
