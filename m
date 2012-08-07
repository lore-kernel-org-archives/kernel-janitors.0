From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 07 Aug 2012 00:43:23 +0000
Subject: [wireless-testing:master 37/59] drivers/net/wireless/b43/phy_n.c:535:1-56: code aligned with followi
Message-Id: <20120807004323.GA9903@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Rafa=C5=82,

FYI, there are new coccinelle warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-tes=
ting.git master
head:   e73930134aafdf703d77043a429e46d254176ac8
commit: 572d37a48557e7d38a5d9b5857627bc29f33a26c [37/59] b43: N-PHY: init 0=
x2057 radio

All coccinelle warnings:

+ drivers/net/wireless/b43/phy_n.c:535:1-56: code aligned with following co=
de on line 536

git checkout 572d37a48557e7d38a5d9b5857627bc29f33a26c
vim +535 drivers/net/wireless/b43/phy_n.c
   532		b43_radio_write(dev, R2057_RCCAL_START_R1_Q1_P1, 0x55);
   533		if (!b43_radio_wait_value(dev, R2057_RCCAL_DONE_OSCCAP, 1, 1, 500,
   534					  5000000))
 > 535		b43_radio_write(dev, R2057_RCCAL_START_R1_Q1_P1, 0x15);
   536		if (special) {
   537			b43_radio_write(dev, R2057_RCCAL_MASTER, 0x73);
   538			b43_radio_write(dev, R2057_RCCAL_X1, 0x28);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
