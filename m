From: Dan Carpenter <error27@gmail.com>
Date: Tue, 19 Oct 2010 05:55:45 +0000
Subject: [patch 0/3] Staging: sst: copy_from_user() changes
Message-Id: <20101019055545.GB5839@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These patches fix some issues with using user space pointers in the sst
ioctl.  It's sort of a larger patch than I normally write and I don't
have the hardware.  I tried to be careful, but please test it.  :)

There are more things left to patch but I wanted to send what I had so
far.

regards,
dan carpenter
