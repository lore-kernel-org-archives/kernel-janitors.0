From: Borislav Petkov <borislav.petkov@amd.com>
Date: Mon, 21 Dec 2009 15:18:19 +0000
Subject: Re: drivers/edac/ move a kfree() to after last use
Message-Id: <20091221151819.GA16432@aftab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261370306.11354.52.camel@ICE-BOX>
In-Reply-To: <1261370306.11354.52.camel@ICE-BOX>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dougthompson@xmission.com, bluesmoke-devel@lists.sourceforge.net

On Mon, Dec 21, 2009 at 03:38:26PM +1100, Darren Jenkins wrote:
>=20
> Move a kfree() below the last use of the memory
>=20
> Coverity CID: 13142
>=20
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

Thanks for catching that. Here's a better version that does all the
freeing at the end of the function.

--
From: Borislav Petkov <borislav.petkov@amd.com>
Date: Mon, 21 Dec 2009 15:15:59 +0100
Subject: [PATCH] amd64_edac: fix driver instance freeing

Fix use-after-free errors by pushing all memory-freeing calls to the end
of amd64_remove_one_instance().

Reported-by: Darren Jenkins <darrenrjenkins@gmail.com>
Signed-off-by: Borislav Petkov <borislav.petkov@amd.com>
---
 drivers/edac/amd64_edac.c |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 784cc5a..fb0d36b 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2929,16 +2929,15 @@ static void __devexit amd64_remove_one_instance(str=
uct pci_dev *pdev)
=20
 	amd64_free_mc_sibling_devices(pvt);
=20
-	kfree(pvt);
-	mci->pvt_info =3D NULL;
-
-	mci_lookup[pvt->mc_node_id] =3D NULL;
-
 	/* unregister from EDAC MCE */
 	amd_report_gart_errors(false);
 	amd_unregister_ecc_decoder(amd64_decode_bus_error);
=20
 	/* Free the EDAC CORE resources */
+	mci->pvt_info =3D NULL;
+	mci_lookup[pvt->mc_node_id] =3D NULL;
+
+	kfree(pvt);
 	edac_mc_free(mci);
 }
=20
--=20
1.6.5.4


--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Germany
 Research | Gesch=E4ftsf=FChrer: Andrew Bowd, Thomas M. McCoy, Giuliano Mer=
oni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
