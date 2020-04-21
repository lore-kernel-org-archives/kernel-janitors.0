From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 21 Apr 2020 10:00:12 +0000
Subject: Re: [V3] amdgpu: remove unnecessary condition check
Message-Id: <aa0a34ce-714f-a637-d1a8-54de94a09e75@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AIsA-wCZCFCxiq0WKb3WjKr*.3.1587458683834.Hmail.bernard@vivo.com>
 <ccd14dee-f275-5de4-b5c1-4f359d155288@amd.com>
In-Reply-To: <ccd14dee-f275-5de4-b5c1-4f359d155288@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, =?UTF-8?B?6LW15Yab5aWO?= <bernard@vivo.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Chunming Zhou <David1.Zhou@amd.com>, opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Coccinelle <cocci@systeme.lip6.fr>

>> But i have to say there are so many code not follow the kernel code-style in amdgpu module.
>> And also the ./scripts/checkpatch.pl did not throw any warning or error.
>
> That is unfortunately true, yes. But we try to push new code through the usual code review and improve things as we go.
>
> On the other hand patches just to fix the coding style are usually seen as an unnecessary interruption and just a waste of time.

Would you become interested in adjusting deviations from known programming guidelines
in an automatic way with the help of corresponding advanced development tools?

Regards,
Markus
