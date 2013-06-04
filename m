From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Jun 2013 13:13:25 +0000
Subject: [patch] staging: alarm-dev: information leak in alarm_compat_ioctl()
Message-Id: <20130604131325.GB13788@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130603090231.GB16171@debian>
In-Reply-To: <20130603090231.GB16171@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If we pass an invalid clock type then "ts" is never set.  We need to
check for errors earlier, otherwise we end up passing uninitialized
stack data to userspace.

Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/android/alarm-dev.c b/drivers/staging/android/alarm-dev.c
index c8600d9..6dc27da 100644
--- a/drivers/staging/android/alarm-dev.c
+++ b/drivers/staging/android/alarm-dev.c
@@ -297,6 +297,8 @@ static long alarm_compat_ioctl(struct file *file, unsigned int cmd,
 	}
 
 	rv = alarm_do_ioctl(file, cmd, &ts);
+	if (rv)
+		return rv;
 
 	switch (ANDROID_ALARM_BASE_CMD(cmd)) {
 	case ANDROID_ALARM_GET_TIME(0): /* NOTE: we modified cmd above */
@@ -305,7 +307,7 @@ static long alarm_compat_ioctl(struct file *file, unsigned int cmd,
 		break;
 	}
 
-	return rv;
+	return 0;
 }
 #endif
 
