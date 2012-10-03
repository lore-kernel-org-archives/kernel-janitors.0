From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Date: Wed, 03 Oct 2012 13:35:32 +0000
Subject: RE: [drm:drm-next 169/234] drivers/gpu/drm/radeon/radeon_acpi.c:128:3: warning: format '%lu' expects
Message-Id: <A3397C8B8B789E45844E7EC5DEAD89D02C436DE8@sausexdag03.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003011822.GD8750@localhost>
In-Reply-To: <20121003011822.GD8750@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Luca Tettamanti [mailto:kronos.it@gmail.com]
> Sent: Wednesday, October 03, 2012 9:03 AM
> To: Fengguang Wu
> Cc: Yuanhan Liu; kernel-janitors@vger.kernel.org; Deucher, Alexander
> Subject: Re: [drm:drm-next 169/234]
> drivers/gpu/drm/radeon/radeon_acpi.c:128:3: warning: format '%lu' expects
> argument of type 'long unsigned int', but argument 2 has type 'size_t'
> 
> On Wed, Oct 03, 2012 at 09:18:22AM +0800, Fengguang Wu wrote:
> > All warnings:
> >
> > drivers/gpu/drm/radeon/radeon_acpi.c: In function
> 'radeon_atif_verify_interface':
> > drivers/gpu/drm/radeon/radeon_acpi.c:128:3: warning: format '%lu'
> expects argument of type 'long unsigned int', but argument 2 has type
> 'size_t' [-Wformat]
> 
> Yup, %lu is wrong on 32bit. There's also another occurence in that file,
> attached patch agains drm-next fixes both.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>



