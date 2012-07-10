From: wfg@linux.intel.com
Date: Tue, 10 Jul 2012 02:02:36 +0000
Subject: [net-next:master 64/65] drivers/net/ethernet/realtek/r8169.c:6756:35: sparse: incorrect type in
Message-Id: <20120710020236.GA8103@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Hayes,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master
head:   061a5c316b6526dbc729049a16243ec27937cc31
commit: c558386b836ee97762e12495101c6e373f20e69d [64/65] r8169: support RTL8168G

All sparse warnings:

+ drivers/net/ethernet/realtek/r8169.c:6756:35: sparse: incorrect type in argument 1 (different address spaces)
  drivers/net/ethernet/realtek/r8169.c:6756:35:    expected struct rtl8169_private *tp
  drivers/net/ethernet/realtek/r8169.c:6756:35:    got void [noderef] <asn:2>*ioaddr
  drivers/net/ethernet/realtek/r8169.c:6763:35: sparse: incorrect type in argument 1 (different address spaces)
  drivers/net/ethernet/realtek/r8169.c:6763:35:    expected struct rtl8169_private *tp
  drivers/net/ethernet/realtek/r8169.c:6763:35:    got void [noderef] <asn:2>*ioaddr

vim +6756 drivers/net/ethernet/realtek/r8169.c
  6753		msleep(1);
  6754		RTL_W8(MCU, RTL_R8(MCU) & ~NOW_IS_OOB);
  6755	
> 6756		data = r8168_mac_ocp_read(ioaddr, 0xe8de);
  6757		data &= ~(1 << 14);
  6758		r8168_mac_ocp_write(tp, 0xe8de, data);
  6759	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
