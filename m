From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 11:04:10 +0000
Subject: kernel/module_signing.c:195:2: warning: format '%lu' expects argument of type 'long unsigned int', b
Message-Id: <20121020110410.GE5714@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux master
head:   31fd84b95eb211d5db460a1dda85e004800a7b52
commit: caabe240574aec05b2f5667414ce80f9075c2ba1 MODSIGN: Move the magic string to the end of a module and eliminate the search
date:   8 hours ago
config: i386-allyesconfig # make ARCH=i386 allyesconfig

All warnings:

kernel/module_signing.c: In function 'mod_verify_sig':
kernel/module_signing.c:195:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' [-Wformat]

vim +195 kernel/module_signing.c

48ba2462 David Howells 2012-09-26  179  	pr_devel("<=%s() = 0 [%x]\n", __func__, key_serial(key_ref_to_ptr(key)));
48ba2462 David Howells 2012-09-26  180  	return key_ref_to_ptr(key);
48ba2462 David Howells 2012-09-26  181  }
48ba2462 David Howells 2012-09-26  182  
48ba2462 David Howells 2012-09-26  183  /*
106a4ee2 Rusty Russell 2012-09-26  184   * Verify the signature on a module.
106a4ee2 Rusty Russell 2012-09-26  185   */
caabe240 David Howells 2012-10-20  186  int mod_verify_sig(const void *mod, unsigned long *_modlen)
106a4ee2 Rusty Russell 2012-09-26  187  {
48ba2462 David Howells 2012-09-26  188  	struct public_key_signature *pks;
48ba2462 David Howells 2012-09-26  189  	struct module_signature ms;
48ba2462 David Howells 2012-09-26  190  	struct key *key;
caabe240 David Howells 2012-10-20  191  	const void *sig;
caabe240 David Howells 2012-10-20  192  	size_t modlen = *_modlen, sig_len;
48ba2462 David Howells 2012-09-26  193  	int ret;
48ba2462 David Howells 2012-09-26  194  
caabe240 David Howells 2012-10-20 @195  	pr_devel("=>%s(,%lu)\n", __func__, modlen);
48ba2462 David Howells 2012-09-26  196  
caabe240 David Howells 2012-10-20  197  	if (modlen <= sizeof(ms))
48ba2462 David Howells 2012-09-26  198  		return -EBADMSG;
48ba2462 David Howells 2012-09-26  199  
caabe240 David Howells 2012-10-20  200  	memcpy(&ms, mod + (modlen - sizeof(ms)), sizeof(ms));
caabe240 David Howells 2012-10-20  201  	modlen -= sizeof(ms);
48ba2462 David Howells 2012-09-26  202  
48ba2462 David Howells 2012-09-26  203  	sig_len = be32_to_cpu(ms.sig_len);

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
