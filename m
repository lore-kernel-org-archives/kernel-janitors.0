From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 17 Aug 2017 22:20:41 +0000
Subject: Re: [Nouveau] [PATCH][V2] drm/nouveau: perform null check on msto[i] rathern than msto
Message-Id: <53264562-fddf-8214-859c-0f491b2ca42a@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DBVLFdRPwIQc5I3JTrLAjHBg39jIr68E1"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817220323.26717-1-colin.king@canonical.com>
 <CAKb7Uvh0G_KyVjh=p59R_qLF8qz+j0_s93WhscAhMYcV1-Z1AA@mail.gmail.com>
 <83ec451a-ceaa-5d62-948e-c34bbd670c0e@canonical.com>
In-Reply-To: <83ec451a-ceaa-5d62-948e-c34bbd670c0e@canonical.com>
To: Colin Ian King <colin.king@canonical.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DBVLFdRPwIQc5I3JTrLAjHBg39jIr68E1
Content-Type: multipart/mixed; boundary="VR4rKfLFW8tJJHK0sXxGQJSpeUC0w6B7j";
 protected-headers="v1"
From: Ben Skeggs <skeggsb@gmail.com>
To: Colin Ian King <colin.king@canonical.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>
Cc: David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Message-ID: <53264562-fddf-8214-859c-0f491b2ca42a@gmail.com>
Subject: Re: [Nouveau] [PATCH][V2] drm/nouveau: perform null check on msto[i]
 rathern than msto
References: <20170817220323.26717-1-colin.king@canonical.com>
 <CAKb7Uvh0G_KyVjh=p59R_qLF8qz+j0_s93WhscAhMYcV1-Z1AA@mail.gmail.com>
 <83ec451a-ceaa-5d62-948e-c34bbd670c0e@canonical.com>
In-Reply-To: <83ec451a-ceaa-5d62-948e-c34bbd670c0e@canonical.com>

--VR4rKfLFW8tJJHK0sXxGQJSpeUC0w6B7j
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/18/2017 08:16 AM, Colin Ian King wrote:
> On 17/08/17 23:07, Ilia Mirkin wrote:
>> On Thu, Aug 17, 2017 at 6:03 PM, Colin King <colin.king@canonical.com>=
 wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The null check on the array msto is incorrect since msto is never
>>> null. The null check should be instead on msto[i] since this is
>>> being dereferenced in the call to drm_mode_connector_attach_encoder.
>>>
>>> Thanks to Emil Velikov for pointing out the mistake in my original
>>> fix and for suggesting the correct fix.
>>>
>>> Detected by CoverityScan, CID#1375915 ("Array compared against 0")
>>>
>>> Fixes: f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1.=
2 multi-stream")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>  drivers/gpu/drm/nouveau/nv50_display.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm=
/nouveau/nv50_display.c
>>> index f7b4326a4641..ed444ecd9e85 100644
>>> --- a/drivers/gpu/drm/nouveau/nv50_display.c
>>> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
>>> @@ -3141,7 +3141,7 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct dr=
m_dp_mst_port *port,
>>>         mstc->connector.funcs->reset(&mstc->connector);
>>>         nouveau_conn_attach_properties(&mstc->connector);
>>>
>>> -       for (i =3D 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto; i++)
>>> +       for (i =3D 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto[i]; i+=
+)
>>
>> Ben will have to rule on which way is correct, but another
>> interpretation is that it should be
>>
>> for (...; i < ARRAY_SIZE; i++)
>>   if (mstm->msto[i])
>>     do_stuff()
>=20
> Yes, I suspect that is a better generic solution top cope with potentia=
l
> "holes".
>>
>> I haven't the faintest clue whether the msto array can have "holes" or=
 not.
>=20
> Indeed. Let's see what Ben says.
No, there can't be holes here.  I believe the V2 patch to be correct.

Ben.
>=20
>=20
>>
>>>                 drm_mode_connector_attach_encoder(&mstc->connector, &=
mstm->msto[i]->encoder);
>>>
>>>         drm_object_attach_property(&mstc->connector.base, dev->mode_c=
onfig.path_property, 0);
>>> --
>>> 2.11.0
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janit=
ors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--VR4rKfLFW8tJJHK0sXxGQJSpeUC0w6B7j--

--DBVLFdRPwIQc5I3JTrLAjHBg39jIr68E1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAlmWFrkACgkQdgucYlCS
kfs/fBAAqDOVQyqSspy+dvm4yQNewnFCOtjMw1HKqsEMGAIRmazweKM7Qy6UUA30
/+3C1PhJz5Lw2RpUKtl8QbawaeSxBrnhsV5T4CE5QjjDyylQI/IZXOlO4wdRf9uR
mWstYbG9J7lljynsxhC5uFnpQewp00NVgNVyqKPUrNjds6Ga1gtwf11jLHVn3NeL
z+FhG1OHdjYIC+nNJO48aZD6zXaaxBGzj+kKBOP1y6C7eC92O5oiaRsrGBmzQaOt
nm4QMdgpSlQ4zZpNNPtmZ5+uSSiYA3xdvk6ICidX2e7YfeRpcH9mHMzzlBqRXISQ
hoaEOZ9yl1M2EhZqQPVcTj3yr2genjjd77iYRqyoIx2KyD1AwezZEiJa9T9oiFln
6gQ6hWwJkJbbpfVGNwq28nAKOFlwrYjSYPSay/q1FCv74TBjrPlaWjFf8yqCMKRz
KvNO9wycURLbozQdZ+mbZ4nxdJ12C/WsknYBhZ9oq3JG/xF1UhnVIxPtnRbBUEat
wddYiqV6z8xMFc4VhWbCYSdchNlwr8AA65VmRgcxCVNnO0uale1eVhosw4hZ+dP4
BlsLRj0rM/DOLAmNIVnbvlhQ9g9jk/MU+r9u/MxRocf+8ZtilFJx55AeBVBuylaF
VkLif4PG8ksgIc/Vl4KJayn2AsBOl5KxF7K9xRWlPmwIYTszIPU=
=zffv
-----END PGP SIGNATURE-----

--DBVLFdRPwIQc5I3JTrLAjHBg39jIr68E1--
