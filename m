From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 08 May 2017 15:29:00 +0000
Subject: [RFC] Spurious error handling code in 'vc4_get_hang_state_ioctl'
Message-Id: <bba7889b-7f80-c973-0a1b-e56a4a88cb03@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

While looking for labels with a spurious order in the linux kernel code, 
I came across code around:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/vc4/vc4_gem.c#n106

The error handling in this for loop looks spurious to me:
    - if 'drm_gem_handle_create' fails, we leak 'bo_state'
      This is freed after the 'copy_to_user'
    - if 'drm_gem_handle_create' fails, then we have 'state->bo_count = 
i - 1'
      This looks odd. 'state->bo_count = i' sounds more logical to me.
    - as 'state->bo_count' is updated, this could mean than the 
'copy_to_user' should be performed.

I don't have any idea if one of the above is true (unless the memory 
leak), so I just send it as a RFC to get feed-back.

The corresponding patch would look like:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -109,18 +109,19 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, 
void *data,

          ret = drm_gem_handle_create(file_priv, kernel_state->bo[i],
                          &handle);

          if (ret) {
-            state->bo_count = i - 1;
-            goto err;
+            state->bo_count = i;
+            goto do_copy;
          }
          bo_state[i].handle = handle;
          bo_state[i].paddr = vc4_bo->base.paddr;
          bo_state[i].size = vc4_bo->base.base.size;
      }

+do_copy:
      if (copy_to_user((void __user *)(uintptr_t)get_state->bo,
               bo_state,
               state->bo_count * sizeof(*bo_state)))
          ret = -EFAULT;

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Best regards,

CJ

