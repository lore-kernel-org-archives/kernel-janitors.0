From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 16:31:53 +0000
Subject: [nfc:nfc-next 34/34] drivers/nfc/pn544/pn544.c:717:6: sparse: symbol 'pn544_hci_event_received' was
Message-Id: <20121003163153.GA14674@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="envbJBWh7q8WU6mo"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/sameo/nfc-3.0.git nfc-next
head:   f97d5073425f5a5a8113cb3cb2e49f833513a5b6
commit: f97d5073425f5a5a8113cb3cb2e49f833513a5b6 [34/34] NFC: Separate pn544 hci driver in HW dependant and independant parts


vim +717 drivers/nfc/pn544/pn544.c

566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27 @717) void pn544_hci_event_received(struct nfc_hci_dev *hdev, u8 gate, u8 event,
566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27  718) 				struct sk_buff *skb)
566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27  719) {
566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27  720) 	struct sk_buff *rgb_skb = NULL;
566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27  721) 	int r = 0;
566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27  722) 
566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27  723) 	pr_debug("hci event %d", event);
566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27  724) 	switch (event) {
566bfae6 drivers/nfc/pn544_hci.c (Arron Wang    2012-09-27  725) 	case PN544_HCI_EVT_ACTIVATED:

The code at line 717 was first introduced by commit:
566bfae NFC: Pass hardware specific HCI event to driver

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--envbJBWh7q8WU6mo
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-f97d507.diff"

diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index cf34445..d5c835f 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -714,7 +714,7 @@ static int pn544_hci_check_presence(struct nfc_hci_dev *hdev,
 	return 0;
 }
 
-void pn544_hci_event_received(struct nfc_hci_dev *hdev, u8 gate, u8 event,
+static void pn544_hci_event_received(struct nfc_hci_dev *hdev, u8 gate, u8 event,
 				struct sk_buff *skb)
 {
 	struct sk_buff *rgb_skb = NULL;

--envbJBWh7q8WU6mo--
