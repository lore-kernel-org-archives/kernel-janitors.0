From: Dan Carpenter <error27@gmail.com>
Date: Sat, 16 Oct 2010 18:39:45 +0000
Subject: bug report: ath6kl: use after free
Message-Id: <20101016183944.GR6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Vipin,

There is a use after free bug in ar6000_ioctl_set_channelParams().  I'm
not sure how to fix it.

drivers/staging/ath6kl/os/linux/ioctl.c +374
	ar6000_ioctl_set_channelParams(51) warn: 'cmdp' was already freed.
   370      if (cmd.numChannels > 1) {
   371          kfree(cmdp);
                      ^^^^
	freed here.

   372      }
   373
   374      ar->ap_wmode = cmdp->phyMode;
                           ^^^^^^
	dereferenced here.

regards,
dan carpenter

