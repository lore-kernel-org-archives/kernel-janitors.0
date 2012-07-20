From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jul 2012 14:35:25 +0000
Subject: Re: [patch] drm/radeon: check for allocation failure in radeon_ring_backup()
Message-Id: <20120720143525.GE16291@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120720111700.GB22245@elgon.mountain>
	<500960F8.6060906@vodafone.de>
In-Reply-To: <500960F8.6060906@vodafone.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christian =?iso-8859-1?Q?K=F6nig?= <deathsimple@vodafone.de>
Cc: kernel-janitors@vger.kernel.org, Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

On Fri, Jul 20, 2012 at 03:45:28PM +0200, Christian K=F6nig wrote:
> On 20.07.2012 13:17, Dan Carpenter wrote:
> >Static checkers complain if this we don't check for allocation failure.
> >Also we can use the new kmalloc_array() function here as a cleanup.
> >
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> What's the benefit of using kmalloc_array instead of just kmalloc?
>=20

It has built in integer overflow protection.  Whenever I see
multiplication in kmalloc(), I automatically start to audit for
overflows, but now, ha ha, just change it to kmalloc_array() and
forget about it.  (There weren't any integer overflow problems
in the original code, btw).

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
