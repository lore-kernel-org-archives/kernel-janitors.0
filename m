From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 20 Feb 2011 16:53:16 +0000
Subject: [PATCH 0/2] Staging: xgifb: Remove CRIT[FLAGS | BEGIN | END] defines nd conditional spinlock compila
Message-Id: <1298220798-2942-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Bill Pemberton <wfp5p@virginia.edu>, Arnaud Patard <apatard@mandriva.com>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

xgifb staging driver uses a set of defines that hides the synchronization
mechanism used to access critical sections. Also, the use of spinlocks
can be disabled in compile time.

Since the spinlocks ABI only are used in contexts were critical section exists
(UP with preemption enabled and SMP machines), I think we should always have
the spinlocks enabled and let the spinlock ABI choose to include the spinlocks
or not. In the other hand if the driver doesn't need locking at all, then
maybe we should just delete the spinlock logic.

This patchset first replaces all the defines used with explicit definitions,
then removes all the defines and the spinlocks optional compilation logic.

The patchset is composed of the following patches:

[PATCH 1/2] Staging: xgifb: Remove CRIT[FLAGS | BEGIN | END] defines usage
[PATCH 2/2] Staging: xgifb: Removes CRIT[FLAGS | BEGIN | END] defines and conditional spinlock compilation logic
