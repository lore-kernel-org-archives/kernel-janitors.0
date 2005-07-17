From: Jim Cromie <jcromie@divsol.com>
Date: Sun, 17 Jul 2005 02:38:13 +0000
Subject: [KJ] RFC - trailing whitespace cleanup script
Message-Id: <42D9C495.2090405@divsol.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen, all,

Ive considered running following 1-lineer and submitting per-subsystem 
cleanup patches.

cp -al $tree $tree-clean; perl -pi.bak -e 's/\s+\n//' `find $tree-clean 
-print` > mega-patch


the problem with doing so is that lots of whitespace has already been 
cleaned,
and rc3-kj has presumably been superseded by more whitespace fixes,
which would result in needless rejects.

So, what Id propose is:

a. just prior to releasing rc4-kj, do an rc4-kj-pre
b. run script against pre tree.
c. diff -rup pre pre-clean > mega-patch
d. manually edit/chop up mega-patch on subsystem boundaries
e. apply each to pre, release rc4-kj

f. repeat periodically
g. get janitors to recognize that they should do harder fixes, and leave 
whitespace
for the robo-janitor / whitespace-roomba

BTW

when were kj patches last merged into mainline ?
how often (on average) does this happen ?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
