From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 09:09:04 +0000
Subject: [PATCH 0/3] Staging: xgifb: Removes dead code and unused spinlock conditional compilation logic
Message-Id: <1298279347-8825-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In an earlier patch-set I was replacing a set of defines in staging xgifb driver
that hides the synchronization mechanism used to access critical sections.

As Dan Carpenter pointed me, this code depende on the accelerator engine being
activated (XGIfb_accel != 0), but in current driver this seems to be always
deactivated (XGIfb_accel = 0). 

So this patchset removes all the unused code and this spinlock conditional
compilation logic only used in the acceleration mode code.

The patch-set is composed of the following patches:

[PATCH 1/3] Staging: xgifb: Removes dead code
[PATCH 2/3] Staging: xgifb: Remove unused functions
[PATCH 3/3] Staging: xgifb: Remove unused spinlock conditional compilation logic
