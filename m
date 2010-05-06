From: Dan Carpenter <error27@gmail.com>
Date: Thu, 06 May 2010 10:07:05 +0000
Subject: Re: [PATCH] net: emaclite: Use resource_size
Message-Id: <20100506100704.GK27064@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273133540-6894-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1273133540-6894-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Since you're doing this, here are some smatch warnings with potential
off-by-one bugs:

drivers/net/3c507.c +454 el16_probe1(88) warn: consider using resource_size() here
drivers/scsi/aic7xxx_old.c +8430 aic7xxx_alloc(30) warn: consider using resource_size() here
drivers/scsi/aic7xxx_old.c +9685 aic7xxx_detect(706) warn: consider using resource_size() here
drivers/scsi/aic7xxx_old.c +9698 aic7xxx_detect(719) warn: consider using resource_size() here
drivers/scsi/aic7xxx_old.c +9706 aic7xxx_detect(727) warn: consider using resource_size() here
drivers/scsi/aic7xxx_old.c +9751 aic7xxx_detect(772) warn: consider using resource_size() here
drivers/scsi/aic7xxx_old.c +10950 aic7xxx_release(14) warn: consider using resource_size() here

regards,
dan carpenter
