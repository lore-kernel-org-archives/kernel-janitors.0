From: Felix Kuehling <felix.kuehling@amd.com>
Date: Fri, 29 May 2020 02:06:14 +0000
Subject: Re: [PATCH][next] drm/amdkfd: fix a dereference of pdd before it is null checked
Message-Id: <dc37cf9d-ddaf-94c7-8fc1-460c8da59d7b@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528222453.536137-1-colin.king@canonical.com>
In-Reply-To: <20200528222453.536137-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mukul Joshi <mukul.joshi@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2020-05-28 18:24, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently pointer pdd is being dereferenced when assigning pointer
> dpm and then pdd is being null checked.  Fix this by checking if
> pdd is null before the dereference of pdd occurs.
>
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 522b89c63370 ("drm/amdkfd: Track SDMA utilization per process")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I applied the patch to our internal amd-staging-drm-next.

Regards,
 =C2=A0 Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_process.c
> index 25636789f3d3..bdc58741b32e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -103,10 +103,11 @@ static void kfd_sdma_activity_worker(struct work_st=
ruct *work)
>   		return;
>  =20
>   	pdd =3D workarea->pdd;
> +	if (!pdd)
> +		return;
>   	dqm =3D pdd->dev->dqm;
>   	qpd =3D &pdd->qpd;
> -
> -	if (!pdd || !dqm || !qpd)
> +	if (!dqm || !qpd)
>   		return;
>  =20
>   	mm =3D get_task_mm(pdd->process->lead_thread);
