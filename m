From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Wed, 03 May 2017 12:46:41 +0000
Subject: Re: [PATCH 0/3] GPU-DRM-Radeon: Fine-tuning for three function implementations
Message-Id: <799fb921-f620-9054-680d-90b14e4c517c@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <74d2df52-f509-e6d2-5b35-e25b7cbd1fbe@users.sourceforge.net>
In-Reply-To: <74d2df52-f509-e6d2-5b35-e25b7cbd1fbe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Am 02.05.2017 um 22:04 schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 22:00:02 +0200
>
> Three update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (3):
>    Use seq_putc() in radeon_sa_bo_dump_debug_info()
>    Use seq_puts() in radeon_debugfs_pm_info()
>    Use seq_puts() in r100_debugfs_cp_csq_fifo()

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

>
>   drivers/gpu/drm/radeon/r100.c      | 6 +++---
>   drivers/gpu/drm/radeon/radeon_pm.c | 5 +++--
>   drivers/gpu/drm/radeon/radeon_sa.c | 9 +++------
>   3 files changed, 9 insertions(+), 11 deletions(-)
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
