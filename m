From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 17:16:42 +0000
Subject: [PATCH 0/3] Staging: xgifb: More unused code cleanups
Message-Id: <1298308605-31690-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Earlier patches removed dead code in the xgifb staging driver.

This patch-set is a follow on that makes more cleanup removing unused code.

It removes all the references to XGIfb_accel, the spinlock lockaccel in the
video_info struct and fbcon_XGI_sync() function.

The patch-set is composed of the following patches:

[PATCH 1/3] Staging: xgifb: Remove all the references to XGIfb_accel
[PATCH 2/2] Staging: xgifb: Remove unused spinlock in struct video_info
[PATCH 3/3] Staging: xgifb: Remove unused function fbcon_XGI_sync

It asumes that the patch-set 

[PATCH 0/3] Staging: xgifb: Removes dead code and unused spinlock conditional compilation logic

was already applied.
