From: Tomas Winkler <tomas.winkler@intel.com>
Date: Tue, 07 May 2013 18:12:31 +0000
Subject: [char-misc 3.10] mei: fix out of array access to me clients array
Message-Id: <1367950351-23717-1-git-send-email-tomas.winkler@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>, kernel-janitors@vger.kernel.org

The patch 9f81abdac362: "mei: implement mei_cl_connect function"
from Jan 8, 2013, leads to the following static checker warning:
"drivers/misc/mei/main.c:522 mei_ioctl_connect_client()
	 warn: check 'dev->me_clients[]' for negative offsets (-2)"

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/misc/mei/main.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 7c44c8d..053139f 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -489,11 +489,16 @@ static int mei_ioctl_connect_client(struct file *file,
 
 	/* find ME client we're trying to connect to */
 	i = mei_me_cl_by_uuid(dev, &data->in_client_uuid);
-	if (i >= 0 && !dev->me_clients[i].props.fixed_address) {
-		cl->me_client_id = dev->me_clients[i].client_id;
-		cl->state = MEI_FILE_CONNECTING;
+	if (i < 0 || dev->me_clients[i].props.fixed_address) {
+		dev_dbg(&dev->pdev->dev, "Cannot connect to FW Client UUID = %pUl\n",
+				&data->in_client_uuid);
+		rets = -ENODEV;
+		goto end;
 	}
 
+	cl->me_client_id = dev->me_clients[i].client_id;
+	cl->state = MEI_FILE_CONNECTING;
+
 	dev_dbg(&dev->pdev->dev, "Connect to FW Client ID = %d\n",
 			cl->me_client_id);
 	dev_dbg(&dev->pdev->dev, "FW Client - Protocol Version = %d\n",
@@ -527,11 +532,6 @@ static int mei_ioctl_connect_client(struct file *file,
 		goto end;
 	}
 
-	if (cl->state != MEI_FILE_CONNECTING) {
-		rets = -ENODEV;
-		goto end;
-	}
-
 
 	/* prepare the output buffer */
 	client = &data->out_client_properties;
@@ -543,7 +543,6 @@ static int mei_ioctl_connect_client(struct file *file,
 	rets = mei_cl_connect(cl, file);
 
 end:
-	dev_dbg(&dev->pdev->dev, "free connect cb memory.");
 	return rets;
 }
 
-- 
1.8.1.2

