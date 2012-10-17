From: =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple@vodafone.de>
Date: Wed, 17 Oct 2012 09:26:01 +0000
Subject: Re: drivers/gpu/drm/radeon/radeon_gart.c:580:5: sparse: symbol 'radeon_vm_evict' was not declared. S
Message-Id: <507E79A9.7040604@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017064444.GA17885@localhost>
In-Reply-To: <20121017064444.GA17885@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

yes that's correct the function should be static.

Cheers,
Christian.

On 17.10.2012 08:44, Fengguang Wu wrote:
> Hi Christian,
>
> FYI, there are new sparse warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux mast=
er
> head:   8d2b6b3ae280dcf6f6c7a95623670a57cdf562ed
> commit: 90a51a329258e3c868f6f4c1fb264ca01c590c57 drm/radeon: allocate pag=
e tables on demand v4
> date:   2 days ago
>
> + drivers/gpu/drm/radeon/radeon_gart.c:580:5: sparse: symbol 'radeon_vm_e=
vict' was not declared. Should it be static?
>
> vim +580 drivers/gpu/drm/radeon/radeon_gart.c
>
> 09db8644 Alex Deucher    2012-07-17  569  /**
> 90a51a32 Christian K=F6nig 2012-10-09  570   * radeon_vm_evict - evict pa=
ge table to make room for new one
> 90a51a32 Christian K=F6nig 2012-10-09  571   *
> 90a51a32 Christian K=F6nig 2012-10-09  572   * @rdev: radeon_device point=
er
> 90a51a32 Christian K=F6nig 2012-10-09  573   * @vm: VM we want to allocat=
e something for
> 90a51a32 Christian K=F6nig 2012-10-09  574   *
> 90a51a32 Christian K=F6nig 2012-10-09  575   * Evict a VM from the lru, m=
aking sure that it isn't @vm. (cayman+).
> 90a51a32 Christian K=F6nig 2012-10-09  576   * Returns 0 for success, -EN=
OMEM for failure.
> 90a51a32 Christian K=F6nig 2012-10-09  577   *
> 90a51a32 Christian K=F6nig 2012-10-09  578   * Global and local mutex mus=
t be locked!
> 90a51a32 Christian K=F6nig 2012-10-09  579   */
> 90a51a32 Christian K=F6nig 2012-10-09 @580  int radeon_vm_evict(struct ra=
deon_device *rdev, struct radeon_vm *vm)
> 90a51a32 Christian K=F6nig 2012-10-09  581  {
> 90a51a32 Christian K=F6nig 2012-10-09  582  	struct radeon_vm *vm_evict;
> 90a51a32 Christian K=F6nig 2012-10-09  583
> 90a51a32 Christian K=F6nig 2012-10-09  584  	if (list_empty(&rdev->vm_man=
ager.lru_vm))
> 90a51a32 Christian K=F6nig 2012-10-09  585  		return -ENOMEM;
> 90a51a32 Christian K=F6nig 2012-10-09  586
> 90a51a32 Christian K=F6nig 2012-10-09  587  	vm_evict =3D list_first_entr=
y(&rdev->vm_manager.lru_vm,
> 90a51a32 Christian K=F6nig 2012-10-09  588  				    struct radeon_vm, lis=
t);
>
> Shall we apply the attached diff?
>
> Thanks,
> Fengguang

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
