From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 18 Jul 2012 13:54:47 +0000
Subject: [modsign:modsign 12/27] sparse: symbol 'pgp_pubkey_hash' was not declared. Should it be static?
Message-Id: <20120718135447.GA8256@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git modsign
head:   84d2387379da278fa8e8639e37125c72f930743a
commit: 4f49a5fc6553686e5cb8cc6f09f9342307d2fe07 [12/27] KEYS: PGP-based public key signature verification

All sparse warnings:

+ security/keys/crypto/pgp_sig_verify.c:23:3: sparse: symbol 'pgp_pubkey_hash' was not declared. Should it be static?

vim +23 security/keys/crypto/pgp_sig_verify.c
    20	
    21	const struct {
    22		enum pkey_hash_algo algo : 8;
  > 23	} pgp_pubkey_hash[PGP_HASH__LAST] = {
    24		[PGP_HASH_MD5].algo		= PKEY_HASH_MD5,
    25		[PGP_HASH_SHA1].algo		= PKEY_HASH_SHA1,
    26		[PGP_HASH_RIPE_MD_160].algo	= PKEY_HASH_RIPE_MD_160,

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
