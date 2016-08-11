From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 05:17:12 +0000
Subject: [PATCH v2 00/10] staging: ks7010: Fine-tuning for a SDIO card driver
Message-Id: <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
In-Reply-To: <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Joe Perches <joe@perches.com>, Jean Delvare <jdelvare@suse.de>

From: Markus Elfring <elfring@users.sourceforge.net>

Further update suggestions were taken into account
after a patch was applied from static source code analysis.

Markus Elfring (10):
  Delete unnecessary checks before the function call "kfree"
  Delete unnecessary assignments for buffer variables
  Return directly after a failed kmalloc()
  Rename jump labels
  Delete unnecessary uses of the variable "retval"
  Delete unnecessary braces
  Add the macro "pr_fmt"
  Replace three printk() calls by pr_err()
  Delete a variable in write_to_device()
  Delete three unnecessary variable initialisations

 drivers/staging/ks7010/ks7010_sdio.c | 184 ++++++++++++++---------------------
 1 file changed, 73 insertions(+), 111 deletions(-)

-- 
2.9.2


