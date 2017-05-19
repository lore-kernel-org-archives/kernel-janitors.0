From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 17:51:12 +0000
Subject: [PATCH 4/4] ueagle-atm: Adjust three checks for null pointers
Message-Id: <b111dc9c-58c3-bfe0-3c36-6cf090c48cdf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
In-Reply-To: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthieu Castet <castet.matthieu@free.fr>, Stanislaw Gruszka <stf_xl@wp.pl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 19:29:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/atm/ueagle-atm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 0ca4ff3e6683..5c9517bfb82c 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -955,7 +955,7 @@ static void uea_load_page_e1(struct work_struct *work)
 		sc->dsp_firm = NULL;
 	}
 
-	if (sc->dsp_firm = NULL && request_dsp(sc) < 0)
+	if (!sc->dsp_firm && request_dsp(sc) < 0)
 		return;
 
 	p = sc->dsp_firm->data;
@@ -1076,7 +1076,7 @@ static void uea_load_page_e4(struct work_struct *work)
 		sc->dsp_firm = NULL;
 	}
 
-	if (sc->dsp_firm = NULL && request_dsp(sc) < 0)
+	if (!sc->dsp_firm && request_dsp(sc) < 0)
 		return;
 
 	p = (struct l1_code *) sc->dsp_firm->data;
@@ -1596,7 +1596,7 @@ static void cmvs_file_name(struct uea_softc *sc, char *const cmv_name, int ver)
 
 	kernel_param_lock(THIS_MODULE);
 	/* set proper name corresponding modem version and line type */
-	if (cmv_file[sc->modem_index] = NULL) {
+	if (!cmv_file[sc->modem_index]) {
 		if (UEA_CHIP_VERSION(sc) = ADI930)
 			file_arr[3] = '9';
 		else if (UEA_CHIP_VERSION(sc) = EAGLE_IV)
-- 
2.13.0

