From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 19 Dec 2008 11:34:27 +0000
Subject: [PATCH v2 6/6] drm/i915: un-EXPORT and make 'intelfb_panic' static
Message-Id: <494b8afb.0aa5660a.589f.fffffd82@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200812181540.08366.jbarnes@virtuousgeek.org>
In-Reply-To: <200812181540.08366.jbarnes@virtuousgeek.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: David Airlie <airlied@linux.ie>

Fix this sparse warning:

  drivers/gpu/drm/i915/intel_fb.c:417:5: warning: symbol 'intelfb_panic' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---

On Fri, Dec 19, 2008 at 12:40 AM, Jesse Barnes <jbarnes@virtuousgeek.org> wrote:
> On Thursday, December 18, 2008 1:32 pm Hannes Eder wrote:
>> Fix this sparse warning:
>>
>>   drivers/gpu/drm/i915/intel_fb.c:417:5: warning: symbol 'intelfb_panic'
>> was not declared. Should it be static?
>
> Yep, this one should be static instead (I think, just double checking now to
> make sure it's not used elsewhere, iirc it's not).

Ok, so let's make the function static and there is no need to EXPORT
it, which wouldn't work for a static function anyway.

When is it safe to un-EXPORT a function?  When it is only referenced
within the translation unit it is defined in?  But it could be
referenced from outside the kernel source, or?


 drivers/gpu/drm/i915/intel_fb.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_fb.c b/drivers/gpu/drm/i915/intel_fb.c
index 12664c3..bbf6fe0 100644
--- a/drivers/gpu/drm/i915/intel_fb.c
+++ b/drivers/gpu/drm/i915/intel_fb.c
@@ -414,15 +414,14 @@ EXPORT_SYMBOL(intelfb_resize);
 
 static struct drm_mode_set kernelfb_mode;
 
-int intelfb_panic(struct notifier_block *n, unsigned long ununsed,
-		  void *panic_str)
+static int intelfb_panic(struct notifier_block *n, unsigned long ununsed,
+			 void *panic_str)
 {
 	DRM_ERROR("panic occurred, switching back to text console\n");
 
 	intelfb_restore();
 	return 0;
 }
-EXPORT_SYMBOL(intelfb_panic);
 
 static struct notifier_block paniced = {
 	.notifier_call = intelfb_panic,
-- 
1.5.6.3

