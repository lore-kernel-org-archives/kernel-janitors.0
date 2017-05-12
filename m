From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 12 May 2017 11:38:38 +0000
Subject: Re: [PATCH 0/3] GPU-DRM-Radeon: Fine-tuning for three function implementations
Message-Id: <1587529.CdsjPgZMHu@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <74d2df52-f509-e6d2-5b35-e25b7cbd1fbe@users.sourceforge.net>
 <8c4e7dde-06d5-3f13-2322-f661e9d3dbf4@daenzer.net>
 <66a88c64-cc8f-45ed-81c6-f7e2947f1f18@amd.com>
In-Reply-To: <66a88c64-cc8f-45ed-81c6-f7e2947f1f18@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: dri-devel@lists.freedesktop.org
Cc: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org, SF Markus Elfring <elfring@users.sourceforge.net>, Alex Deucher <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

Hi Christian,

On Wednesday 10 May 2017 13:30:37 Christian K=F6nig wrote:
> Am 10.05.2017 um 02:23 schrieb Michel D=E4nzer:
> > On 03/05/17 09:46 PM, Christian K=F6nig wrote:
> >> Am 02.05.2017 um 22:04 schrieb SF Markus Elfring:
> >>> From: Markus Elfring <elfring@users.sourceforge.net>
> >>> Date: Tue, 2 May 2017 22:00:02 +0200
> >>>=20
> >>> Three update suggestions were taken into account
> >>> from static source code analysis.
> >>>=20
> >>> Markus Elfring (3):
> >>>     Use seq_putc() in radeon_sa_bo_dump_debug_info()
> >>>     Use seq_puts() in radeon_debugfs_pm_info()
> >>>     Use seq_puts() in r100_debugfs_cp_csq_fifo()
> >>=20
> >> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> >=20
> > Based on
> > https://lists.freedesktop.org/archives/dri-devel/2017-May/140837.html
> > and followups, I'm afraid we'll have to make sure Markus' patches have
> > been tested adequately before applying them.
>=20
> I can't judge the background of that decision, but at least those tree
> patches for radeon looked trivial to me.
>=20
> I don't see much what could go wrong when merging them.

For what it's worth, I've once applied a patch from Markus for the uvcvideo=
=20
driver that seemed trivial but ended up introducing a breakage that I hadn'=
t=20
caught during review. I recommend rejecting Markus' patches that are not cl=
ear=20
improvements, and carefully testing the others.

> On the other hand you are right that trying to find hardware to test that
> stuff could be challenging.

--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
