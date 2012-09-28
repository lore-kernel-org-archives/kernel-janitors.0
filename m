From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 01:24:17 +0000
Subject: [bluetooth:master 231/247] net/bluetooth/amp.c:150:55: sparse: bad constant expression
Message-Id: <20120928012417.GH5522@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andrei Emeltchenko <andrei.emeltchenko@intel.com>, linux-bluetooth@vger.kernel.org

Hi Dmitry,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   29d8a5909bba10accb82eb805c884a2943d7710f
commit: ba221bbabadd5fc2c80677b52178138fd694cc26 [231/247] Bluetooth: Add function to derive AMP key using hmac

+ net/bluetooth/amp.c:150:55: sparse: bad constant expression
  net/bluetooth/amp.c:130:12: warning: 'hmac_sha256' defined but not used [-Wunused-function]

vim +150 net/bluetooth/amp.c

ba221bba (Dmitry Kasatkin 2012-09-27  144) 	ret = crypto_shash_setkey(tfm, key, ksize);
ba221bba (Dmitry Kasatkin 2012-09-27  145) 	if (ret) {
ba221bba (Dmitry Kasatkin 2012-09-27  146) 		BT_DBG("crypto_ahash_setkey failed: err %d", ret);
ba221bba (Dmitry Kasatkin 2012-09-27  147) 	} else {
ba221bba (Dmitry Kasatkin 2012-09-27  148) 		struct {
ba221bba (Dmitry Kasatkin 2012-09-27  149) 			struct shash_desc shash;
ba221bba (Dmitry Kasatkin 2012-09-27 @150) 			char ctx[crypto_shash_descsize(tfm)];
ba221bba (Dmitry Kasatkin 2012-09-27  151) 		} desc;
ba221bba (Dmitry Kasatkin 2012-09-27  152) 
ba221bba (Dmitry Kasatkin 2012-09-27  153) 		desc.shash.tfm = tfm;
ba221bba (Dmitry Kasatkin 2012-09-27  154) 		desc.shash.flags = CRYPTO_TFM_REQ_MAY_SLEEP;
ba221bba (Dmitry Kasatkin 2012-09-27  155) 
ba221bba (Dmitry Kasatkin 2012-09-27  156) 		ret = crypto_shash_digest(&desc.shash, plaintext, psize,
ba221bba (Dmitry Kasatkin 2012-09-27  157) 					  output);
ba221bba (Dmitry Kasatkin 2012-09-27  158) 	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
