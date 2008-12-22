From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:16:23 +0000
Subject: [PATCH 10/27] drivers/net/enic: fix sparse warning: make symbol static
Message-Id: <20081222191622.11807.9132.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:

  drivers/net/enic/vnic_dev.c:288:5: warning: symbol 'vnic_dev_capable' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/enic/vnic_dev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/enic/vnic_dev.c b/drivers/net/enic/vnic_dev.c
index 08a37b0..1170857 100644
--- a/drivers/net/enic/vnic_dev.c
+++ b/drivers/net/enic/vnic_dev.c
@@ -285,7 +285,7 @@ int vnic_dev_cmd(struct vnic_dev *vdev, enum vnic_devcmd_cmd cmd,
 	return -ETIMEDOUT;
 }
 
-int vnic_dev_capable(struct vnic_dev *vdev, enum vnic_devcmd_cmd cmd)
+static int vnic_dev_capable(struct vnic_dev *vdev, enum vnic_devcmd_cmd cmd)
 {
 	u64 a0 = (u32)cmd, a1 = 0;
 	int wait = 1000;

