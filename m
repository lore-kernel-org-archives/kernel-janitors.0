From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 12:49:03 +0000
Subject: [PATCH 0/2] constify structures stored in fields of v4l2_subdev_ops structure
Message-Id: <1540644545-26184-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The fields of a v4l2_subdev_ops structure are all const, so the
structures that are stored there and are not used elsewhere can be
const as well.

Done with the help of Coccinelle.

---

 drivers/media/i2c/ov7740.c                |    4 ++--
 drivers/media/platform/vimc/vimc-sensor.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
