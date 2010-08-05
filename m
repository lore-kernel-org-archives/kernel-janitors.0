From: Francisco Jerez <currojerez@riseup.net>
Date: Thu, 05 Aug 2010 00:27:11 +0000
Subject: Re: [patch v2] nouveau: unwind on load errors
Message-Id: <87y6clhpk0.fsf@riseup.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100729180231.GV26313@bicker> <20100729193948.GA4821@joi.lan>
	<20100730150432.GC26313@bicker> <20100730202000.GA4194@joi.lan>
In-Reply-To: <20100730202000.GA4194@joi.lan> (Marcin Slusarz's message of
	"Fri, 30 Jul 2010 22:20:00 +0200")
To: Dan Carpenter <error27@gmail.com>
Cc: nouveau@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Grant Likely <grant.likely@secretlab.ca>, Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz@gmail.com> writes:

> On Fri, Jul 30, 2010 at 05:04:32PM +0200, Dan Carpenter wrote:
>> nuveau_load() just returned directly if there was an error instead of=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
>   ^^^^^^ typo
>
>> releasing resources.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
>>=20
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>> ---
>> V2: updated to the nouveau git tree.
>
> Thanks.
> Reviewed-by: Marcin Slusarz <marcin.slusarz@gmail.com>

Thanks, pushed to the nouveau kernel tree.

>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/n=
ouveau/nouveau_state.c
>> index ee3729e..cf16bfb 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
>> @@ -739,8 +739,10 @@ int nouveau_load(struct drm_device *dev, unsigned l=
ong flags)
>>  	int ret;
>>=20=20
>>  	dev_priv =3D kzalloc(sizeof(*dev_priv), GFP_KERNEL);
>> -	if (!dev_priv)
>> -		return -ENOMEM;
>> +	if (!dev_priv) {
>> +		ret =3D -ENOMEM;
>> +		goto err_out;
>> +	}
>>  	dev->dev_private =3D dev_priv;
>>  	dev_priv->dev =3D dev;
>>=20=20
>> @@ -750,8 +752,10 @@ int nouveau_load(struct drm_device *dev, unsigned l=
ong flags)
>>  		 dev->pci_vendor, dev->pci_device, dev->pdev->class);
>>=20=20
>>  	dev_priv->wq =3D create_workqueue("nouveau");
>> -	if (!dev_priv->wq)
>> -		return -EINVAL;
>> +	if (!dev_priv->wq) {
>> +		ret =3D -EINVAL;
>> +		goto err_priv;
>> +	}
>>=20=20
>>  	/* resource 0 is mmio regs */
>>  	/* resource 1 is linear FB */
>> @@ -764,7 +768,8 @@ int nouveau_load(struct drm_device *dev, unsigned lo=
ng flags)
>>  	if (!dev_priv->mmio) {
>>  		NV_ERROR(dev, "Unable to initialize the mmio mapping. "
>>  			 "Please report your setup to " DRIVER_EMAIL "\n");
>> -		return -EINVAL;
>> +		ret =3D -EINVAL;
>> +		goto err_wq;
>>  	}
>>  	NV_DEBUG(dev, "regs mapped ok at 0x%llx\n",
>>  					(unsigned long long)mmio_start_offs);
>> @@ -812,7 +817,8 @@ int nouveau_load(struct drm_device *dev, unsigned lo=
ng flags)
>>  		break;
>>  	default:
>>  		NV_INFO(dev, "Unsupported chipset 0x%08x\n", reg0);
>> -		return -EINVAL;
>> +		ret =3D -EINVAL;
>> +		goto err_mmio;
>>  	}
>>=20=20
>>  	NV_INFO(dev, "Detected an NV%2x generation card (0x%08x)\n",
>> @@ -820,7 +826,7 @@ int nouveau_load(struct drm_device *dev, unsigned lo=
ng flags)
>>=20=20
>>  	ret =3D nouveau_remove_conflicting_drivers(dev);
>>  	if (ret)
>> -		return ret;
>> +		goto err_mmio;
>>=20=20
>>  	/* Map PRAMIN BAR, or on older cards, the aperture withing BAR0 */
>>  	if (dev_priv->card_type >=3D NV_40) {
>> @@ -834,7 +840,8 @@ int nouveau_load(struct drm_device *dev, unsigned lo=
ng flags)
>>  				dev_priv->ramin_size);
>>  		if (!dev_priv->ramin) {
>>  			NV_ERROR(dev, "Failed to PRAMIN BAR");
>> -			return -ENOMEM;
>> +			ret =3D -ENOMEM;
>> +			goto err_mmio;
>>  		}
>>  	} else {
>>  		dev_priv->ramin_size =3D 1 * 1024 * 1024;
>> @@ -842,7 +849,8 @@ int nouveau_load(struct drm_device *dev, unsigned lo=
ng flags)
>>  					  dev_priv->ramin_size);
>>  		if (!dev_priv->ramin) {
>>  			NV_ERROR(dev, "Failed to map BAR0 PRAMIN.\n");
>> -			return -ENOMEM;
>> +			ret =3D -ENOMEM;
>> +			goto err_mmio;
>>  		}
>>  	}
>>=20=20
>> @@ -857,9 +865,21 @@ int nouveau_load(struct drm_device *dev, unsigned l=
ong flags)
>>  	/* For kernel modesetting, init card now and bring up fbcon */
>>  	ret =3D nouveau_card_init(dev);
>>  	if (ret)
>> -		return ret;
>> +		goto err_ramin;
>>=20=20
>>  	return 0;
>> +
>> +err_ramin:
>> +	iounmap(dev_priv->ramin);
>> +err_mmio:
>> +	iounmap(dev_priv->mmio);
>> +err_wq:
>> +	destroy_workqueue(dev_priv->wq);
>> +err_priv:
>> +	kfree(dev_priv);
>> +	dev->dev_private =3D NULL;
>> +err_out:
>> +	return ret;
>>  }
>>=20=20
>>  void nouveau_lastclose(struct drm_device *dev)

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkxaBWAACgkQg5k4nX1Sv1siiwD8CHB7dZXyvciMCPTywPe9PO3d
LivC72IeUgpGsXm9NT8A+wbikvbc+drB8tE/deU0ECVz7zO1Wf+OY1IxleEnPHgB
=K1Oj
-----END PGP SIGNATURE-----
--==-=-=--
