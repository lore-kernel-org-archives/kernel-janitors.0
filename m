From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Jun 2015 15:30:51 +0000
Subject: Re: [PATCH] drm/amdgpu: Delete an unnecessary check before the function call "kfree"
Message-Id: <CADnq5_PnwYdzE-KfiTim-cvreTp-+wv-qCVFm8ToHJWJDJTrpQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
	<alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
	<530A086E.8010901@users.sourceforge.net>
	<alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
	<530A72AA.3000601@users.sourceforge.net>
	<alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
	<530B5FB6.6010207@users.sourceforge.net>
	<alpine.DEB.2.10.1402241710370.2074@hadrien>
	<530C5E18.1020800@users.sourceforge.net>
	<alpine.DEB.2.10.1402251014170.2080@hadrien>
	<530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<558FB427.80103@users.sourceforge.net>
In-Reply-To: <558FB427.80103@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, Jun 28, 2015 at 4:45 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 28 Jun 2015 10:27:35 +0200
>
> The kfree() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I already have the same patch from Maninder Singh.

Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index fec487d..a85cd08 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1575,8 +1575,7 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>         amdgpu_fence_driver_fini(adev);
>         amdgpu_fbdev_fini(adev);
>         r = amdgpu_fini(adev);
> -       if (adev->ip_block_enabled)
> -               kfree(adev->ip_block_enabled);
> +       kfree(adev->ip_block_enabled);
>         adev->ip_block_enabled = NULL;
>         adev->accel_working = false;
>         /* free i2c buses */
> --
> 2.4.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
