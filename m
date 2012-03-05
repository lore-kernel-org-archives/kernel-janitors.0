From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Mar 2012 08:59:41 +0000
Subject: [patch v2] edac i5000, i5400: fix pointer math in i5000_get_mc_regs()
Message-Id: <20120305090109.GM22598@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="M2Pxvdb9QxnGd/3e"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302065441.GB24508@elgon.mountain>
 <4F508C16.30900@bfs.de>
In-Reply-To: <4F508C16.30900@bfs.de>
To: walter harms <wharms@bfs.de>
Cc: Eric Wollesen <ericw@xmtp.net>, Doug Thompson <dougthompson@xmission.com>, list-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--M2Pxvdb9QxnGd/3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

"pvt->ambase" is a u64 datatype.  The intent here is to fill the first
half in the first call to pci_read_config_dword() and the other half in
the second.  Unfortunately the pointer math is wrong so we set the wrong
data.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Redid it as with a union as Walter Harms suggested.
    Fixed the same bug in i5400_edac.c as well.

I don't have this hardware, so please review carefully.

diff --git a/drivers/edac/i5400_edac.c b/drivers/edac/i5400_edac.c
index 74d6ec34..083e80a 100644
--- a/drivers/edac/i5400_edac.c
+++ b/drivers/edac/i5400_edac.c
@@ -343,7 +343,13 @@ struct i5400_pvt {
 	struct pci_dev *branch_1;		/* 22.0 */
=20
 	u16 tolm;				/* top of low memory */
-	u64 ambase;				/* AMB BAR */
+	union {
+		u64 ambase;				/* AMB BAR */
+		struct {
+			u32 ambase_bottom;
+			u32 ambase_top;
+		} u;
+	};
=20
 	u16 mir0, mir1;
=20
@@ -1024,9 +1030,9 @@ static void i5400_get_mc_regs(struct mem_ctl_info *mc=
i)
 	pvt =3D mci->pvt_info;
=20
 	pci_read_config_dword(pvt->system_address, AMBASE,
-			(u32 *) &pvt->ambase);
+			&pvt->u.ambase_bottom);
 	pci_read_config_dword(pvt->system_address, AMBASE + sizeof(u32),
-			((u32 *) &pvt->ambase) + sizeof(u32));
+			&pvt->u.ambase_top);
=20
 	maxdimmperch =3D pvt->maxdimmperch;
 	maxch =3D pvt->maxch;
diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index 4dc3ac2..ecc2401 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -343,7 +343,13 @@ struct i5000_pvt {
 	struct pci_dev *branch_1;	/* 22.0 */
=20
 	u16 tolm;		/* top of low memory */
-	u64 ambase;		/* AMB BAR */
+	union {
+		u64 ambase;		/* AMB BAR */
+		struct {
+			u32 ambase_bottom;
+			u32 ambase_top;
+		} u;
+	};
=20
 	u16 mir0, mir1, mir2;
=20
@@ -1128,9 +1134,9 @@ static void i5000_get_mc_regs(struct mem_ctl_info *mc=
i)
 	pvt =3D mci->pvt_info;
=20
 	pci_read_config_dword(pvt->system_address, AMBASE,
-			(u32 *) & pvt->ambase);
+			&pvt->u.ambase_bottom);
 	pci_read_config_dword(pvt->system_address, AMBASE + sizeof(u32),
-			((u32 *) & pvt->ambase) + sizeof(u32));
+			&pvt->u.ambase_top);
=20
 	maxdimmperch =3D pvt->maxdimmperch;
 	maxch =3D pvt->maxch;

--M2Pxvdb9QxnGd/3e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPVIDVAAoJEOnZkXI/YHqRCEUP/RZtrlCrWp/d2etTvYOQNhHA
K7s4E7Q1oUl5twQKXRtu0+rBckmLCD7A3pY/qaxwO7CV72OKGOdMJJOfjzxCVhJg
r6tPzwGF6yGv7Rix6B3aANJsTXsii4sAhTCA4tz4ieJdIiGFlbb93BV+awpgOBg0
ys3tJxk/rICxDfkC+yreKEK2n+Bi7wgi/ArmTHpjQMs7Ra+okwrTav27nK0HJkMz
mjqKu3sXMv35LubLXOwKrfZizOyBNexSML1a3DshPP0/sUusrPiR39aCmPDtP5sL
MXgc+HOKhpAq4xM6ihimFPZSaai8ICrUaRbhRLXpeKV7ZFSn1IV65GnwaQbqi6Ue
vRtesqxP6T+0d5UE5ygRlb06v8Vx0ADSgrjTuojsBlCd27j3CzoEbLkZYES/yX3D
G0piqtXbOIrRJJWfnx1aSkDAr7TKtCrT02DOvaYZ3lQC+11k2picGMCrl8czLDLu
ivrvU0Stxo7TMyT6huY17vy2mP0yJDi//EF3Dv6YIGUnTGC9xB889YWE9v6z7RdV
5+ZYPkAjOgNxYVaOIP8V1nBqcPASuTs2UTWsFEY2nJW/bKoYRE1jhyekVyIb6BqU
JzCGLpmvNy2JwocgI1EnedkM9iEhr4386YdnXIm72q3n67q6y2duMCV7X4tnaUjB
5S1ID3SgErY3TZBE4IxB
=gXTC
-----END PGP SIGNATURE-----

--M2Pxvdb9QxnGd/3e--
