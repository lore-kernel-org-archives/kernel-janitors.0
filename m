From: Laurent Navet <laurent.navet@gmail.com>
Date: Thu, 13 Dec 2012 20:45:39 +0000
Subject: Re: [PATCH] drivers: nouveau: Bool tests don't need comparison
Message-Id: <20121213204538.GA7031@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355320451-23292-1-git-send-email-laurent.navet@gmail.com>
 <20121213081657.GV6568@mwanda>
In-Reply-To: <20121213081657.GV6568@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: bskeggs@redhat.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, kernel-janitors@vger.kernel.org

Bool initializations should use true and false.  Bool tests don't need
comparisons.  Based on contributions from Joe Perches, Rusty Russell
and Bruce W Allan.
The semantic patch that makes this output is available
in scripts/coccinelle/misc/boolinit.cocci.

More information about semantic patching is available at
http://coccinelle.lip6.fr/

Signed-off-by: Laurent Navet <laurent.navet@gmail.com>
---
 drivers/gpu/drm/nouveau/core/subdev/timer/base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/timer/base.c
b/drivers/gpu/drm/nouveau/core/subdev/timer/base.c
index 5d417cc..de6d6b7 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/timer/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/timer/base.c
@@ -72,7 +72,7 @@ nouveau_timer_wait_cb(void *obj, u64 nsec, bool
(*func)(void *), void *data)
 
        time0 = ptimer->read(ptimer);
        do {
-               if (func(data) = true)
+               if (func(data))
                        return true;
        } while (ptimer->read(ptimer) - time0 < nsec);
 
-- 
1.7.10.4
