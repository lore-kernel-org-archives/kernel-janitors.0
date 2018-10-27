From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 12:16:38 +0000
Subject: [PATCH 0/2] constify v4l2_ctrl_ops structures
Message-Id: <1540642600-25840-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Make const v4l2_ctrl_ops structures that are only stored in a
const field or passed to a function having a const parameter.

Done with the help of Coccinelle.

---

 drivers/media/i2c/ov5645.c                    |    2 +-
 drivers/media/platform/vicodec/vicodec-core.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
