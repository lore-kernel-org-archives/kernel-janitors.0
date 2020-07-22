From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Jul 2020 13:06:51 +0000
Subject: [PATCH] staging: vchiq: Fix refcounting bug in buffer_from_host()
Message-Id: <20200722130651.GC220681@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Dave Stevenson <dave.stevenson@raspberrypi.org>
Cc: devel@driverdev.osuosl.org, Jacopo Mondi <jacopo@jmondi.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, bcm-kernel-feedback-list@broadcom.com, Stefan Wahren <wahrenst@gmx.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Jamal Shareef <jamal.k.shareef@gmail.com>, linux-rpi-kernel@lists.infradead.org

If we fail to queue the buffer then it can never be dequeued.  This can
lead to a forever loop in stop_streaming() when we wait for everything
to finish.

Fixes: 70ec64ccdaac ("staging: bcm2835-camera: Ensure all buffers are returned on disable")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.  Please review carefully etc.

 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index dc767730db43..65dd2a55b3da 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -441,6 +441,8 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 	ret = vchiq_queue_kernel_message(instance->service_handle, &m,
 					 sizeof(struct mmal_msg_header) +
 					 sizeof(m.u.buffer_from_host));
+	if (ret)
+		atomic_dec(&port->buffers_with_vpu);
 
 	vchiq_release_service(instance->service_handle);
 
-- 
2.27.0
