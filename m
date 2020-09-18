From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 18 Sep 2020 16:39:45 +0000
Subject: Re: [PATCH][next] drm/panel: fix null pointer dereference on pointer mode
Message-Id: <32528660-a9b0-75b2-264d-26d6dc90180c@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918155136.28958-1-colin.king@canonical.com>
 <20200918162249.GA292461@bogon.m.sigxcpu.org>
In-Reply-To: <20200918162249.GA292461@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <guido.gunther@puri.sm>
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

On 18/09/2020 17:22, Guido G=C3=BCnther wrote:
> Hi,
> On Fri, Sep 18, 2020 at 04:51:36PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently a null pointer check on pointer mode is passing mode to
>> function drm_mode_vrefresh and this causes a null pointer dereference
>> on mode.  Fix this by not calling drm_mode_vrefresh since the call
>> is only required for error reporting.
>>
>> Addresses-Coverity: ("Dereference after null check")
>> Fixes: 72967d5616d3 ("drm/panel: Add panel driver for the Mantix MLAF057=
WE51-X DSI panel")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/=
gpu/drm/panel/panel-mantix-mlaf057we51.c
>> index 3482e28e30fc..be4761a643f9 100644
>> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>> @@ -202,9 +202,8 @@ static int mantix_get_modes(struct drm_panel *panel,
>> =20
>>  	mode =3D drm_mode_duplicate(connector->dev, &default_mode);
>>  	if (!mode) {
>> -		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
>> -			default_mode.hdisplay, default_mode.vdisplay,
>> -			drm_mode_vrefresh(mode));
>> +		dev_err(ctx->dev, "Failed to add mode %ux%u\n",
>> +			default_mode.hdisplay, default_mode.vdisplay);
>>  		return -ENOMEM;
>>  	}
>=20
> drm_mode_vrefresh(&default_mode) gives some more clue what's going on -
> I have had a fix queued up in my tree already but if you send a v2
> that's fine.

I'll defer to your queued up fix.
>=20
> Thanks!
>  -- Guido
>=20
>> =20
>> --=20
>> 2.27.0
>>
