From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Date: Wed, 17 Oct 2012 16:41:52 +0000
Subject: RE: drivers/gpu/drm/radeon/radeon_gart.c:580:5: sparse: symbol 'radeon_vm_evict' was not declared. S
Message-Id: <A3397C8B8B789E45844E7EC5DEAD89D02DA97EF9@sausexdag04.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017064444.GA17885@localhost>
In-Reply-To: <20121017064444.GA17885@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Fengguang,

  Do you want to send a formal patch, or should I just fix in my next radeo=
n -fixes pull request?

Alex

> -----Original Message-----
> From: Christian K=F6nig [mailto:deathsimple@vodafone.de]
> Sent: Wednesday, October 17, 2012 5:26 AM
> To: Fengguang Wu
> Cc: kernel-janitors@vger.kernel.org; Deucher, Alexander; Cherkasov, Dmitr=
ii
> Subject: Re: drivers/gpu/drm/radeon/radeon_gart.c:580:5: sparse: symbol
> 'radeon_vm_evict' was not declared. Should it be static?
>=20
> Hi Fengguang,
>=20
> yes that's correct the function should be static.
>=20
> Cheers,
> Christian.
>=20
> On 17.10.2012 08:44, Fengguang Wu wrote:
> > Hi Christian,
> >
> > FYI, there are new sparse warnings show up in
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux ma=
ster
> > head:   8d2b6b3ae280dcf6f6c7a95623670a57cdf562ed
> > commit: 90a51a329258e3c868f6f4c1fb264ca01c590c57 drm/radeon: allocate
> page tables on demand v4
> > date:   2 days ago
> >
> > + drivers/gpu/drm/radeon/radeon_gart.c:580:5: sparse: symbol
> 'radeon_vm_evict' was not declared. Should it be static?
> >
> > vim +580 drivers/gpu/drm/radeon/radeon_gart.c
> >
> > 09db8644 Alex Deucher    2012-07-17  569  /**
> > 90a51a32 Christian K=F6nig 2012-10-09  570   * radeon_vm_evict - evict =
page
> table to make room for new one
> > 90a51a32 Christian K=F6nig 2012-10-09  571   *
> > 90a51a32 Christian K=F6nig 2012-10-09  572   * @rdev: radeon_device poi=
nter
> > 90a51a32 Christian K=F6nig 2012-10-09  573   * @vm: VM we want to alloc=
ate
> something for
> > 90a51a32 Christian K=F6nig 2012-10-09  574   *
> > 90a51a32 Christian K=F6nig 2012-10-09  575   * Evict a VM from the lru,=
 making
> sure that it isn't @vm. (cayman+).
> > 90a51a32 Christian K=F6nig 2012-10-09  576   * Returns 0 for success, -
> ENOMEM for failure.
> > 90a51a32 Christian K=F6nig 2012-10-09  577   *
> > 90a51a32 Christian K=F6nig 2012-10-09  578   * Global and local mutex m=
ust be
> locked!
> > 90a51a32 Christian K=F6nig 2012-10-09  579   */
> > 90a51a32 Christian K=F6nig 2012-10-09 @580  int radeon_vm_evict(struct
> radeon_device *rdev, struct radeon_vm *vm)
> > 90a51a32 Christian K=F6nig 2012-10-09  581  {
> > 90a51a32 Christian K=F6nig 2012-10-09  582  	struct radeon_vm *vm_evict;
> > 90a51a32 Christian K=F6nig 2012-10-09  583
> > 90a51a32 Christian K=F6nig 2012-10-09  584  	if (list_empty(&rdev-
> >vm_manager.lru_vm))
> > 90a51a32 Christian K=F6nig 2012-10-09  585  		return -ENOMEM;
> > 90a51a32 Christian K=F6nig 2012-10-09  586
> > 90a51a32 Christian K=F6nig 2012-10-09  587  	vm_evict > list_first_entr=
y(&rdev->vm_manager.lru_vm,
> > 90a51a32 Christian K=F6nig 2012-10-09  588
> struct radeon_vm, list);
> >
> > Shall we apply the attached diff?
> >
> > Thanks,
> > Fengguang
>=20


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
