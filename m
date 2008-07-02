From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 02 Jul 2008 01:37:27 +0000
Subject: [PATCH]  drivers/net/wireless/iwlwifi/iwl-3945.c
Message-Id: <1214962647.18261.15.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: ipw2100-admin@linux.intel.com, yi.zhu@intel.com, reinette.chatre@intel.com

G'day people

Coverity CID: 2265 NEGATIVE_RETURNS

"rate" is of an unsigned type, and the code requires a signed type.
The following patch makes it so.

Only compile tested.

=EF=BB=BFSigned-off-by: Darren Jenkins <darrenrjenkins@gmailcom>

diff --git a/drivers/net/wireless/iwlwifi/iwl-3945.c b/drivers/net/wireless=
/iwlwifi/iwl-3945.c
index 62a3d8f..31d38cd 100644
--- a/drivers/net/wireless/iwlwifi/iwl-3945.c
+++ b/drivers/net/wireless/iwlwifi/iwl-3945.c
@@ -449,7 +449,7 @@ static void iwl3945_dbg_report_frame(struct iwl3945_pri=
v *priv,
=20
 	if (print_summary) {
 		char *title;
-		u32 rate;
+		int rate;
=20
 		if (hundred)
 			title =3D "100Frames";


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
