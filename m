From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Fri, 22 Feb 2013 18:06:30 +0000
Subject: [PATCH 0/2] [comedi] fix for DMA buffers on stack
Message-Id: <1361556392-32501-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abbotti@mev.co.uk
Cc: fmhess@users.sourceforge.net, gregkh@linuxfoundation.org, hsweeten@visionengravers.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch series fixes couple of instances of DMA buffers on stack(being passed
to usb_control_msg) for comedi USB drivers. Found using smatch.

Kumar Amit Mehta (2):
  staging: comedi: drivers: usbdux.c: fix DMA buffers on stack
  staging: comedi: drivers: usbduxfast.c: fix for DMA buffers on stack

 drivers/staging/comedi/drivers/usbdux.c     |   31 ++++++++++++++++-----------
 drivers/staging/comedi/drivers/usbduxfast.c |   30 +++++++++++++++-----------
 2 files changed, 37 insertions(+), 24 deletions(-)

-- 
1.7.9.5

