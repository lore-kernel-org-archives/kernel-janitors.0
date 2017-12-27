From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 27 Dec 2017 20:11:56 +0000
Subject: Re: [PATCH 11/12] drm/amd/powerplay: drop unneeded newline
Message-Id: <alpine.DEB.2.20.1712272111390.2118@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-482809422-1514405516=:2118"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
 <1514386305-7402-12-git-send-email-Julia.Lawall@lip6.fr>
 <0378ac3c-752c-12b4-6f7c-046b208ff6d7@daenzer.net>
In-Reply-To: <0378ac3c-752c-12b4-6f7c-046b208ff6d7@daenzer.net>
To: =?ISO-8859-15?Q?Michel_D=E4nzer?= <michel@daenzer.net>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>

--8323329-482809422-1514405516=:2118
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Wed, 27 Dec 2017, Michel Dänzer wrote:

> On 2017-12-27 03:51 PM, Julia Lawall wrote:
> > PP_ASSERT_WITH_CODE prints a newline at the end of the message string,
> > so the message string does not need to include a newline explicitly.
> > Done using Coccinelle.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> >
> > I couldn't figure out how to configure the kernel to get any of this code
> > to compile.
>
> Just enabling CONFIG_DRM_AMDGPU should be enough AFAICT.

That seems to work.  Thanks.

julia
--8323329-482809422-1514405516=:2118--
