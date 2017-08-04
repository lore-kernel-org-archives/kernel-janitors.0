From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 04 Aug 2017 12:09:43 +0000
Subject: [PATCH 0/5] constify videobuf_queue_ops structures
Message-Id: <1501848588-22628-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-usb@vger.kernel.org

These videobuf_queue_ops structures are only passed as the second
argument to videobuf_queue_vmalloc_init, which is declared as const.
Thus the videobuf_queue_ops structures themselves can be const.

Done with the help of Coccinelle.

---

 drivers/media/pci/cx18/cx18-streams.c                     |    2 +-
 drivers/media/usb/cx231xx/cx231xx-417.c                   |    2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c                 |    2 +-
 drivers/media/usb/tm6000/tm6000-video.c                   |    2 +-
 drivers/media/usb/zr364xx/zr364xx.c                       |    2 +-
 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c |    4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)
