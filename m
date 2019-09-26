From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Sep 2019 12:45:53 +0000
Subject: [PATCH] usb: ftdi-elan: move a couple of statements to next line
Message-Id: <20190926124553.15177-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of statements that follow the end brace
of while loops that should be moved to the next line to clean
up the coding style. Cleans up style warnings from smatch.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/misc/ftdi-elan.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
index cdee3af33ad7..8a3d9c0c8d8b 100644
--- a/drivers/usb/misc/ftdi-elan.c
+++ b/drivers/usb/misc/ftdi-elan.c
@@ -333,7 +333,8 @@ static void ftdi_elan_abandon_completions(struct usb_ftdi *ftdi)
 		*respond->result = -ESHUTDOWN;
 		*respond->value = 0;
 		complete(&respond->wait_completion);
-	} mutex_unlock(&ftdi->u132_lock);
+	}
+	mutex_unlock(&ftdi->u132_lock);
 }
 
 static void ftdi_elan_abandon_targets(struct usb_ftdi *ftdi)
@@ -763,7 +764,8 @@ static int ftdi_elan_total_command_size(struct usb_ftdi *ftdi, int command_size)
 		struct u132_command *command = &ftdi->command[COMMAND_MASK &
 							      i++];
 		total_size += 5 + command->follows;
-	} return total_size;
+	}
+	return total_size;
 }
 
 static int ftdi_elan_command_engine(struct usb_ftdi *ftdi)
-- 
2.20.1
