From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Date: Wed, 10 May 2017 00:23:31 +0000
Subject: Re: [PATCH 0/3] GPU-DRM-Radeon: Fine-tuning for three function implementations
Message-Id: <8c4e7dde-06d5-3f13-2322-f661e9d3dbf4@daenzer.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <74d2df52-f509-e6d2-5b35-e25b7cbd1fbe@users.sourceforge.net>
 <799fb921-f620-9054-680d-90b14e4c517c@amd.com>
In-Reply-To: <799fb921-f620-9054-680d-90b14e4c517c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, SF Markus Elfring <elfring@users.sourceforge.net>, Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>

On 03/05/17 09:46 PM, Christian König wrote:
> Am 02.05.2017 um 22:04 schrieb SF Markus Elfring:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Tue, 2 May 2017 22:00:02 +0200
>>
>> Three update suggestions were taken into account
>> from static source code analysis.
>>
>> Markus Elfring (3):
>>    Use seq_putc() in radeon_sa_bo_dump_debug_info()
>>    Use seq_puts() in radeon_debugfs_pm_info()
>>    Use seq_puts() in r100_debugfs_cp_csq_fifo()
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Based on
https://lists.freedesktop.org/archives/dri-devel/2017-May/140837.html
and followups, I'm afraid we'll have to make sure Markus' patches have
been tested adequately before applying them.


-- 
Earthling Michel Dänzer               |               http://www.amd.com
Libre software enthusiast             |             Mesa and X developer
