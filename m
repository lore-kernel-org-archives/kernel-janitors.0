From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 16 Mar 2012 16:35:58 +0000
Subject: [PATCH] [media] staging: Return -EINTR in s2250_probe() if fails to get lock.
Message-Id: <1331915038-11231-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201203161732.17246.oliver@neukum.org>
In-Reply-To: <201203161732.17246.oliver@neukum.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org
Cc: gregkh@linuxfoundation.org, khoroshilov@ispras.ru, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

In s2250_probe(), If locking attempt is interrupted by a signal then
it should return -EINTR after unregistering audio device and making free
the allocated memory.

At present, if locking is interrupted by signal it will display message
"initialized successfully" and return success.  This is wrong.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/staging/media/go7007/s2250-board.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/media/go7007/s2250-board.c b/drivers/staging/media/go7007/s2250-board.c
index 014d384..2823bbf 100644
--- a/drivers/staging/media/go7007/s2250-board.c
+++ b/drivers/staging/media/go7007/s2250-board.c
@@ -657,6 +657,10 @@ static int s2250_probe(struct i2c_client *client,
 			kfree(data);
 		}
 		mutex_unlock(&usb->i2c_lock);
+	} else {
+		i2c_unregister_device(audio);
+		kfree(state);
+		return -EINTR;
 	}
 
 	v4l2_info(sd, "initialized successfully\n");
-- 
1.7.4.4

