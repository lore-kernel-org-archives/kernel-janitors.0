From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:35:32 +0000
Subject: [patch 1/2] rocker: add a check for NULL in rocker_probe_ports()
Message-Id: <20150225133532.GU19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@resnulli.us>
Cc: Scott Feldman <sfeldma@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Make sure kmalloc() succeeds.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/rocker/rocker.c b/drivers/net/ethernet/rocker/rocker.c
index 34389b6a..713a13c 100644
--- a/drivers/net/ethernet/rocker/rocker.c
+++ b/drivers/net/ethernet/rocker/rocker.c
@@ -4201,6 +4201,8 @@ static int rocker_probe_ports(struct rocker *rocker)
 
 	alloc_size = sizeof(struct rocker_port *) * rocker->port_count;
 	rocker->ports = kmalloc(alloc_size, GFP_KERNEL);
+	if (!rocker->ports)
+		return -ENOMEM;
 	for (i = 0; i < rocker->port_count; i++) {
 		err = rocker_probe_port(rocker, i);
 		if (err)
