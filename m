From: Joerg Roedel <joerg.roedel@amd.com>
Date: Mon, 04 May 2009 08:13:46 +0000
Subject: Re: amd_iommu_init.c: possible problem with IVHD_FLAG_HT_TUN_EN
Message-Id: <20090504081345.GD6780@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0905021519390.9563@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0905021519390.9563@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 02, 2009 at 03:20:23PM +0200, Julia Lawall wrote:
> The file arch/x86/kernel/amd_iommu_init.c contains the following code:
>=20
> (starting at line 586 in a recent linux-next)
>=20
> 	h->flags & IVHD_FLAG_HT_TUN_EN ?
> 		iommu_feature_enable(iommu, CONTROL_HT_TUN_EN) :
> 		iommu_feature_disable(iommu, CONTROL_HT_TUN_EN);
>=20
> 	h->flags & IVHD_FLAG_PASSPW_EN ?
> 		iommu_feature_enable(iommu, CONTROL_PASSPW_EN) :
> 		iommu_feature_disable(iommu, CONTROL_PASSPW_EN);
>=20
> 	h->flags & IVHD_FLAG_RESPASSPW_EN ?
> 		iommu_feature_enable(iommu, CONTROL_RESPASSPW_EN) :
> 		iommu_feature_disable(iommu, CONTROL_RESPASSPW_EN);
>=20
> 	h->flags & IVHD_FLAG_ISOC_EN ?
> 		iommu_feature_enable(iommu, CONTROL_ISOC_EN) :
> 		iommu_feature_disable(iommu, CONTROL_ISOC_EN);
>=20
> The only possible value of IVHD_FLAG_HT_TUN_EN, however, seems to be 0, as
> defined in the same file, and thus the first test is never true.  Is this
> what is intended, or should the test be expressed in another way?

Very true. Another bug because I mixed up bit shifts with bit masks :-(
Thanks for reporting this. I will send a patch to fix it.

Joerg

--=20
           | Advanced Micro Devices GmbH
 Operating | Karl-Hammerschmidt-Str. 34, 85609 Dornach bei M=FCnchen
 System    |=20
 Research  | Gesch=E4ftsf=FChrer: Jochen Polster, Thomas M. McCoy, Giuliano=
 Meroni
 Center    | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
           | Registergericht M=FCnchen, HRB Nr. 43632

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
