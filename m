From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 30 Oct 2018 15:31:20 +0000
Subject: [PATCH 0/2] constify vb2_ops structures
Message-Id: <1540913482-22130-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org

The vb2_ops structures can be const as they are only stored in the ops
field of a vb2_queue structure and this field is const.

Done with the help of Coccinelle.

---

 drivers/media/i2c/video-i2c.c           |    2 +-
 drivers/usb/gadget/function/uvc_queue.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
