From: Dan Carpenter <error27@gmail.com>
Date: Wed, 11 Aug 2010 18:00:09 +0000
Subject: [patch] rocket: add a mutex_unlock()
Message-Id: <20100811180009.GA645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This path needs a mutex_unlock().  This is stuff from the bkl to mutex
transition.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/rocket.c b/drivers/char/rocket.c
index 79c3bc6..7c79d24 100644
--- a/drivers/char/rocket.c
+++ b/drivers/char/rocket.c
@@ -1244,6 +1244,7 @@ static int set_config(struct tty_struct *tty, struct r_port *info,
 		}
 		info->flags = ((info->flags & ~ROCKET_USR_MASK) | (new_serial.flags & ROCKET_USR_MASK));
 		configure_r_port(tty, info, NULL);
+		mutex_unlock(&info->port.mutex);
 		return 0;
 	}
 
