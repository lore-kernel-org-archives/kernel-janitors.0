From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Apr 2020 10:45:22 +0000
Subject: [bug report] drm/xen-front: Add support for Xen PV display frontend
Message-Id: <20200421104522.GA86681@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleksandr_andrushchenko@epam.com
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Kernel Janitors,

Here is another idea that someone could work on, fixing the
IS_ERR_OR_NULL() checks in the xen driver.

The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
display frontend" from Apr 3, 2018, leads to the following static
checker warning:

	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
	warn: passing zero to 'ERR_CAST'

drivers/gpu/drm/xen/xen_drm_front_gem.c
   133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
   134                                                  size_t size)
   135  {
   136          struct xen_gem_object *xen_obj;
   137  
   138          xen_obj = gem_create(dev, size);
   139          if (IS_ERR_OR_NULL(xen_obj))
   140                  return ERR_CAST(xen_obj);

This warning is old and it's actually the result of a bug I had in my
devel version of Smatch yesterday.  xen_obj can't really be NULL, but
if it were then the caller would return success which would probably
create some issues.

When a function returns both error pointers and NULL then NULL is a
special case of success.  Like say you have:  "p = start_feature();".
If there is an allocation failure, then the code should return -ENOMEM
and the whole thing should fail.  But if the feature is optional and
the user has disabled it in the config then we return NULL and the
caller has to be able to accept that.  There are a lot of these
IS_ERR_OR_NULL() checks in the xen driver...

The one here is clearly buggy because returning NULL would lead to a
run time failure.  All these IS_ERR_OR_NULL() should be checked and
probably changed to just IS_ERR().

This sort of change is probably change is probably easiest if you build
the Smatch DB and you can check if Smatch thinks the functions return
NULL.

~/smatch/smatch_data/db/smdb.py return_states gem_create | grep INTERNAL
drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 58 |  (-4095)-(-1) |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 62 | 4065035897849303040 |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 66 | 4065035897849303040 |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 68 | 0,(-4095)-(-1) |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |

Smatch thinks that gem_create() sometimes returns NULL or error pointers
but that's because of a bug in the unreleased version of Smatch and
because gem_create() uses IS_ERR_OR_NULL().

   141  
   142          return &xen_obj->base;
   143  }

regards,
dan carpenter
