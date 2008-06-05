From: "Gross, Mark" <mark.gross@intel.com>
Date: Thu, 05 Jun 2008 22:32:31 +0000
Subject: RE: [PATCH 1/2] Eliminate double kfree
Message-Id: <5389061B65D50446B1783B97DFDB392D0A275662@orsmsx411.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805291504030.26229@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0805291504030.26229@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



>-----Original Message-----
>From: Julia Lawall [mailto:julia@diku.dk]
>Sent: Thursday, May 29, 2008 6:05 AM
>To: jbarnes@virtuousgeek.org; linux-pci@vger.kernel.org; linux-
>kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
>Subject: [PATCH 1/2] Eliminate double kfree
>
>From: Julia Lawall <julia@diku.dk>
>
>The destination of goto error also does a kfree(g_iommus), so it is not
>correct to do one here.
>
>This was found using the following semantic match.
>(http://www.emn.fr/x-info/coccinelle/)
>
>// <smpl>
>@r1@
>expression E;
>position p1,p2;
>@@
>
>kfree@p1(E);
>...
>kfree@p2(E);
>
>@subexps@
>expression E1;
>position r1.p1,p;
>@@
>
>kfree@p1(<+... E1@p ...+>);
>
>@recollect@
>position subexps.p;
>expression E1;
>@@
>
>E1@p
>
>@doublekfree@
>position r1.p1,r1.p2;
>expression recollect.E1,E2,E;
>position p;
>statement S;
>@@
>
>kfree@p1(E);
><+... E1@p=E2 ...+> // the actual semantic match contains other
assignments
>kfree@p2(E);
>
>@notdoublekfree@
>position r1.p1,r1.p2;
>position any doublekfree.p;
>expression E,E1,E2;
>@@
>
>* kfree@p1(E);
>... when !=3D E1@p
>    when !=3D E1@p =3D E2 // needed to match a variable decl
>* kfree@p2(E);
>// </smpl>
>
>Signed-off-by: Julia Lawall <julia@diku.dk>
>---
>
>diff -u -p a/drivers/pci/intel-iommu.c b/drivers/pci/intel-iommu.c
>--- a/drivers/pci/intel-iommu.c	2008-05-15 18:11:35.000000000
+0200
>+++ b/drivers/pci/intel-iommu.c	2008-05-24 21:20:24.000000000
+0200
>@@ -1725,7 +1725,6 @@ int __init init_dmars(void)
> 	deferred_flush =3D kzalloc(g_num_of_iommus *
> 		sizeof(struct deferred_flush_tables), GFP_KERNEL);
> 	if (!deferred_flush) {
>-		kfree(g_iommus);
> 		ret =3D -ENOMEM;
> 		goto error;
> 	}
ACK.

Thanks,

--mgross
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
