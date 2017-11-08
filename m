From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Nov 2017 08:39:46 +0000
Subject: [PATCH] Input: uinput - unlock on allocation failure in ioctl
Message-Id: <20171108083946.vbsixgkodhw6jh4q@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

We have to unlock before returning if input_allocate_device() fails.

Fixes: 04ce40a61a91 ("Input: uinput - remove uinput_allocate_device()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 7b41aad7ec27..39ddd9a73feb 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -857,8 +857,10 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 
 	if (!udev->dev) {
 		udev->dev = input_allocate_device();
-		if (!udev->dev)
-			return -ENOMEM;
+		if (!udev->dev) {
+			retval = -ENOMEM;
+			goto out;
+		}
 	}
 
 	switch (cmd) {
