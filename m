From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 22 Sep 2012 00:47:39 +0000
Subject: [modsign:modsign-post-KS 23/26] kernel/module_signing.c:57:2: error: implicit declaration of functio
Message-Id: <20120922004739.GJ5959@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git modsign-post-KS
head:   c563cc3b00d61b65762c9040689f4ddf416b0557
commit: 2d5ea48ef9e8bf8beac19ca2641bd9a93b6aa035 [23/26] MODSIGN: Provide Kconfig options
config: cris-allyesconfig

[error]
kernel/module_signing.c:57:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
kernel/module_signing.c:58:3: error: implicit declaration of function 'PTR_ERR' [-Werror=implicit-function-declaration]
kernel/module_signing.c:58:3: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
kernel/module_signing.c:58:3: error: implicit declaration of function 'ERR_CAST' [-Werror=implicit-function-declaration]

[warning]
kernel/module_signing.c:58:3: warning: return makes pointer from integer without a cast [enabled by default]

vim +57 kernel/module_signing.c
    41	static struct public_key_signature *mod_make_digest(enum pkey_hash_algo hash,
    42							    const void *mod,
    43							    unsigned long modlen)
    44	{
    45		struct public_key_signature *pks;
    46		struct crypto_shash *tfm;
    47		struct shash_desc *desc;
    48		size_t digest_size, desc_size;
    49		int ret;
    50	
    51		pr_devel("=>%s()\n", __func__);
    52		
    53		/* Allocate the hashing algorithm we're going to need and find out how
    54		 * big the hash operational data will be.
    55		 */
    56		tfm = crypto_alloc_shash(pkey_hash_algo[hash], 0, 0);
  > 57		if (IS_ERR(tfm))
    58			return (PTR_ERR(tfm) = -ENOENT) ? ERR_PTR(-ENOPKG) : ERR_CAST(tfm);
    59	
    60		desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
    61		digest_size = crypto_shash_digestsize(tfm);
    62	
    63		/* We allocate the hash operational data storage on the end of our
    64		 * context data and the digest output buffer on the end of that.
    65		 */

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
