From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 28 Sep 2016 15:34:01 +0000
Subject: [PATCH 00/10] md/dm-crypt: Fine-tuning for five function implementations
Message-Id: <7c232017-e291-fd2d-5516-26e5150d90df@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@redhat.com, linux-raid@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 28 Sep 2016 17:25:17 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (10):
  Use kcalloc() in crypt_alloc_tfms()
  Reduce the scope for a variable in crypt_alloc_tfms()
  Rename a jump label in crypt_message()
  Delete an unnecessary variable initialisation in crypt_message()
  Rename a jump label in crypt_set_key()
  Delete an unnecessary variable initialisation in crypt_set_key()
  Rename a jump label in crypt_iv_tcw_whitening()
  Return directly after a failed crypto_alloc_ahash() in crypt_iv_essiv_ctr()
  Two checks and one function call less in crypt_iv_essiv_ctr() after error detection
  Delete unnecessary variable initialisations in crypt_iv_essiv_ctr()

 drivers/md/dm-crypt.c | 51 ++++++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

-- 
2.10.0

