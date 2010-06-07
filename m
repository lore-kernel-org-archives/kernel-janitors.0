From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 20:59:57 +0000
Subject: [patch 0/7] selinux: return proper error codes instead of -1
Message-Id: <20100607205957.GP5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is a janitor patch to fix some error codes in selinux.  -1 is
-EPERM and it's not a good default error code to return.  Also there was
one place which translated the -1 returns into -EINVAL and that is sort
of messy.

This probably doesn't affect anyone.  I was just reading the code and
decided to fix it.  This is for the next merge window obviously.

regards,
dan carpenter
