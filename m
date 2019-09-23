From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 23 Sep 2019 13:48:37 +0000
Subject: [PATCH net] Bluetooth: SMP: remove set but not used variable 'smp'
Message-Id: <20190923140516.166241-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

net/bluetooth/smp.c: In function 'smp_irk_matches':
net/bluetooth/smp.c:505:18: warning:
 variable 'smp' set but not used [-Wunused-but-set-variable]

net/bluetooth/smp.c: In function 'smp_generate_rpa':
net/bluetooth/smp.c:526:18: warning:
 variable 'smp' set but not used [-Wunused-but-set-variable]

It is not used since commit 28a220aac596 ("bluetooth: switch
to AES library")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/bluetooth/smp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 26e8cfad22b8..6b42be4b5861 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -502,15 +502,12 @@ bool smp_irk_matches(struct hci_dev *hdev, const u8 irk[16],
 		     const bdaddr_t *bdaddr)
 {
 	struct l2cap_chan *chan = hdev->smp_data;
-	struct smp_dev *smp;
 	u8 hash[3];
 	int err;
 
 	if (!chan || !chan->data)
 		return false;
 
-	smp = chan->data;
-
 	BT_DBG("RPA %pMR IRK %*phN", bdaddr, 16, irk);
 
 	err = smp_ah(irk, &bdaddr->b[3], hash);
@@ -523,14 +520,11 @@ bool smp_irk_matches(struct hci_dev *hdev, const u8 irk[16],
 int smp_generate_rpa(struct hci_dev *hdev, const u8 irk[16], bdaddr_t *rpa)
 {
 	struct l2cap_chan *chan = hdev->smp_data;
-	struct smp_dev *smp;
 	int err;
 
 	if (!chan || !chan->data)
 		return -EOPNOTSUPP;
 
-	smp = chan->data;
-
 	get_random_bytes(&rpa->b[3], 3);
 
 	rpa->b[5] &= 0x3f;	/* Clear two most significant bits */
