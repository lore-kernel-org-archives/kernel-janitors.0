From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Wed, 10 May 2017 11:30:37 +0000
Subject: Re: [PATCH 0/3] GPU-DRM-Radeon: Fine-tuning for three function implementations
Message-Id: <66a88c64-cc8f-45ed-81c6-f7e2947f1f18@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <74d2df52-f509-e6d2-5b35-e25b7cbd1fbe@users.sourceforge.net>
 <799fb921-f620-9054-680d-90b14e4c517c@amd.com>
 <8c4e7dde-06d5-3f13-2322-f661e9d3dbf4@daenzer.net>
In-Reply-To: <8c4e7dde-06d5-3f13-2322-f661e9d3dbf4-otUistvHUpPR7s880joybQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>, SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Am 10.05.2017 um 02:23 schrieb Michel Dänzer:
> On 03/05/17 09:46 PM, Christian König wrote:
>> Am 02.05.2017 um 22:04 schrieb SF Markus Elfring:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Tue, 2 May 2017 22:00:02 +0200
>>>
>>> Three update suggestions were taken into account
>>> from static source code analysis.
>>>
>>> Markus Elfring (3):
>>>     Use seq_putc() in radeon_sa_bo_dump_debug_info()
>>>     Use seq_puts() in radeon_debugfs_pm_info()
>>>     Use seq_puts() in r100_debugfs_cp_csq_fifo()
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Based on
> https://lists.freedesktop.org/archives/dri-devel/2017-May/140837.html
> and followups, I'm afraid we'll have to make sure Markus' patches have
> been tested adequately before applying them.

I can't judge the background of that decision, but at least those tree 
patches for radeon looked trivial to me.

I don't see much what could go wrong when merging them. On the other 
hand you are right that trying to find hardware to test that stuff could 
be challenging.

Christian.

