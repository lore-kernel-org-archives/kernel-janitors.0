From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:54:58 +0000
Subject: [PATCH 07/14] pcmcia: ds: fix device_register() error handling
Message-Id: <1284900898-24495-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/pcmcia/ds.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/pcmcia/ds.c b/drivers/pcmcia/ds.c
index 100c441..b56f5a6 100644
--- a/drivers/pcmcia/ds.c
+++ b/drivers/pcmcia/ds.c
@@ -582,10 +582,12 @@ static struct pcmcia_device *pcmcia_device_add(struct pcmcia_socket *s,
 	pcmcia_device_query(p_dev);
 
 	if (device_register(&p_dev->dev))
-		goto err_unreg;
+		goto err_put_device;
 
 	return p_dev;
 
+ err_put_device:
+	put_device(&p_dev->dev);
  err_unreg:
 	mutex_lock(&s->ops_mutex);
 	list_del(&p_dev->socket_device_list);
-- 
1.7.0.4

