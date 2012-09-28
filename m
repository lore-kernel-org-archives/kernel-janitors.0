From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 11:16:24 +0000
Subject: [glommer-memcg:slab-common/kmalloc 29/30] mm/slab_common.c:274:68: sparse: incorrect type in argumen
Message-Id: <20120928111624.GB31784@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6sX45UoQRIJXqkqR"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git slab-common/kmalloc
head:   f957c1ead131972db578b945e25982f4607da6ba
commit: f957c1ead131972db578b945e25982f4607da6ba [29/30] CK1 [13/13] Common function to create the kmalloc array

+ mm/slab_common.c:274:68: sparse: incorrect type in argument 3 (different base types)
  mm/slab_common.c:274:68:    expected unsigned long [unsigned] flags
  mm/slab_common.c:274:68:    got restricted gfp_t [usertype] flags
  mm/slab_common.c:277:69: sparse: incorrect type in argument 3 (different base types)
  mm/slab_common.c:277:69:    expected unsigned long [unsigned] flags
  mm/slab_common.c:277:69:    got restricted gfp_t [usertype] flags
  mm/slab_common.c:282:65: sparse: incorrect type in argument 3 (different base types)
  mm/slab_common.c:282:65:    expected unsigned long [unsigned] flags
  mm/slab_common.c:282:65:    got restricted gfp_t [usertype] flags
+ mm/slab_common.c:310:56: sparse: restricted gfp_t degrades to integer
  mm/slab_common.c: In function 'create_boot_cache':
  mm/slab_common.c:236:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' [-Wformat]

vim +274 mm/slab_common.c

55a6b9f9 (Christoph Lameter 2012-09-26  258) #ifdef CONFIG_ZONE_DMA
55a6b9f9 (Christoph Lameter 2012-09-26  259) struct kmem_cache *kmalloc_dma_caches[KMALLOC_SHIFT_HIGH + 1];
55a6b9f9 (Christoph Lameter 2012-09-26  260) EXPORT_SYMBOL(kmalloc_dma_caches);
55a6b9f9 (Christoph Lameter 2012-09-26  261) #endif
55a6b9f9 (Christoph Lameter 2012-09-26  262) 
f957c1ea (Christoph Lameter 2012-09-26  263) /*
f957c1ea (Christoph Lameter 2012-09-26  264)  * Create the kmalloc array. Some of the regular kmalloc arrays
f957c1ea (Christoph Lameter 2012-09-26  265)  * may already have been created because they were needed to
f957c1ea (Christoph Lameter 2012-09-26  266)  * enable allocations for slab creation.
f957c1ea (Christoph Lameter 2012-09-26  267)  */
f957c1ea (Christoph Lameter 2012-09-26  268) void __init create_kmalloc_caches(gfp_t flags)
f957c1ea (Christoph Lameter 2012-09-26  269) {
f957c1ea (Christoph Lameter 2012-09-26  270) 	int i;
f957c1ea (Christoph Lameter 2012-09-26  271) 
f957c1ea (Christoph Lameter 2012-09-26  272) 	/* Caches that are not of the two-to-the-power-of size */
f957c1ea (Christoph Lameter 2012-09-26  273) 	if (KMALLOC_MIN_SIZE <= 32 && !kmalloc_caches[1])
f957c1ea (Christoph Lameter 2012-09-26 @274) 		kmalloc_caches[1] = create_kmalloc_cache(NULL, 96, flags);
f957c1ea (Christoph Lameter 2012-09-26  275) 
f957c1ea (Christoph Lameter 2012-09-26  276) 	if (KMALLOC_MIN_SIZE <= 64 && !kmalloc_caches[2])
f957c1ea (Christoph Lameter 2012-09-26  277) 		kmalloc_caches[2] = create_kmalloc_cache(NULL, 192, flags);
f957c1ea (Christoph Lameter 2012-09-26  278) 
f957c1ea (Christoph Lameter 2012-09-26  279) 	for (i = KMALLOC_SHIFT_LOW; i <= KMALLOC_SHIFT_HIGH; i++)
f957c1ea (Christoph Lameter 2012-09-26  280) 		if (!kmalloc_caches[i])
f957c1ea (Christoph Lameter 2012-09-26  281) 			kmalloc_caches[i] = create_kmalloc_cache(NULL,
f957c1ea (Christoph Lameter 2012-09-26  282) 				       			1 << i, flags);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--6sX45UoQRIJXqkqR
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="slab_common.c"

/*
 * Slab allocator functions that are independent of the allocator strategy
 *
 * (C) 2012 Christoph Lameter <cl@linux.com>
 */
#include <linux/slab.h>

#include <linux/mm.h>
#include <linux/poison.h>
#include <linux/interrupt.h>
#include <linux/memory.h>
#include <linux/compiler.h>
#include <linux/module.h>
#include <linux/cpu.h>
#include <linux/uaccess.h>
#include <asm/cacheflush.h>
#include <asm/tlbflush.h>
#include <asm/page.h>

#include "slab.h"

enum slab_state slab_state;
LIST_HEAD(slab_caches);
DEFINE_MUTEX(slab_mutex);
struct kmem_cache *kmem_cache;

#ifdef CONFIG_DEBUG_VM
static int kmem_cache_sanity_check(const char *name, size_t size)
{
	struct kmem_cache *s = NULL;

	if (!name || in_interrupt() || size < sizeof(void *) ||
		size > KMALLOC_MAX_SIZE) {
		pr_err("kmem_cache_create(%s) integrity check failed\n", name);
		return -EINVAL;
	}

	list_for_each_entry(s, &slab_caches, list) {
		char tmp;
		int res;

		/*
		 * This happens when the module gets unloaded and doesn't
		 * destroy its slab cache and no-one else reuses the vmalloc
		 * area of the module.  Print a warning.
		 */
		res = probe_kernel_address(s->name, tmp);
		if (res) {
			pr_err("Slab cache with size %d has lost its name\n",
			       s->object_size);
			continue;
		}

		if (!strcmp(s->name, name)) {
			pr_err("%s (%s): Cache name already exists.\n",
			       __func__, name);
			dump_stack();
			s = NULL;
			return -EINVAL;
		}
	}

	WARN_ON(strchr(name, ' '));	/* It confuses parsers */
	return 0;
}
#else
static inline int kmem_cache_sanity_check(const char *name, size_t size)
{
	return 0;
}
#endif

/*
 * Figure out what the alignment of the objects will be given a set of
 * flags, a user specified alignment and the size of the objects.
 */
unsigned long calculate_alignment(unsigned long flags,
		unsigned long align, unsigned long size)
{
	/*
	 * If the user wants hardware cache aligned objects then follow that
	 * suggestion if the object is sufficiently large.
	 *
	 * The hardware cache alignment cannot override the specified
	 * alignment though. If that is greater then use it.
	 */
	if (flags & SLAB_HWCACHE_ALIGN) {
		unsigned long ralign = cache_line_size();
		while (size <= ralign / 2)
			ralign /= 2;
		align = max(align, ralign);
	}

	if (align < ARCH_SLAB_MINALIGN)
		align = ARCH_SLAB_MINALIGN;

	return ALIGN(align, sizeof(void *));
}


/*
 * kmem_cache_create - Create a cache.
 * @name: A string which is used in /proc/slabinfo to identify this cache.
 * @size: The size of objects to be created in this cache.
 * @align: The required alignment for the objects.
 * @flags: SLAB flags
 * @ctor: A constructor for the objects.
 *
 * Returns a ptr to the cache on success, NULL on failure.
 * Cannot be called within a interrupt, but can be interrupted.
 * The @ctor is run when new pages are allocated by the cache.
 *
 * The flags are
 *
 * %SLAB_POISON - Poison the slab with a known test pattern (a5a5a5a5)
 * to catch references to uninitialised memory.
 *
 * %SLAB_RED_ZONE - Insert `Red' zones around the allocated memory to check
 * for buffer overruns.
 *
 * %SLAB_HWCACHE_ALIGN - Align the objects in this cache to a hardware
 * cacheline.  This can be beneficial if you're counting cycles as closely
 * as davem.
 */

struct kmem_cache *kmem_cache_create(const char *name, size_t size, size_t align,
		unsigned long flags, void (*ctor)(void *))
{
	struct kmem_cache *s = NULL;
	int err = 0;

	get_online_cpus();
	mutex_lock(&slab_mutex);

	if (!kmem_cache_sanity_check(name, size) == 0)
		goto out_locked;


	s = __kmem_cache_alias(name, size, align, flags, ctor);
	if (s)
		goto out_locked;

	s = kmem_cache_zalloc(kmem_cache, GFP_KERNEL);
	if (s) {
		s->object_size = s->size = size;
		s->align = calculate_alignment(flags, align, size);
		s->ctor = ctor;
		s->name = kstrdup(name, GFP_KERNEL);
		if (!s->name) {
			kmem_cache_free(kmem_cache, s);
			err = -ENOMEM;
			goto out_locked;
		}

		err = __kmem_cache_create(s, flags);
		if (!err) {

			s->refcount = 1;
			list_add(&s->list, &slab_caches);

		} else {
			kfree(s->name);
			kmem_cache_free(kmem_cache, s);
		}
	} else
		err = -ENOMEM;

out_locked:
	mutex_unlock(&slab_mutex);
	put_online_cpus();

	if (err) {

		if (flags & SLAB_PANIC)
			panic("kmem_cache_create: Failed to create slab '%s'. Error %d\n",
				name, err);
		else {
			printk(KERN_WARNING "kmem_cache_create(%s) failed with error %d",
				name, err);
			dump_stack();
		}

		return NULL;
	}

	return s;
}
EXPORT_SYMBOL(kmem_cache_create);

void kmem_cache_destroy(struct kmem_cache *s)
{
	get_online_cpus();
	mutex_lock(&slab_mutex);
	s->refcount--;
	if (!s->refcount) {
		list_del(&s->list);

		if (!__kmem_cache_shutdown(s)) {
			if (s->flags & SLAB_DESTROY_BY_RCU)
				rcu_barrier();

			kfree(s->name);
			kmem_cache_free(kmem_cache, s);
		} else {
			list_add(&s->list, &slab_caches);
			printk(KERN_ERR "kmem_cache_destroy %s: Slab cache still has objects\n",
				s->name);
			dump_stack();
		}
	}
	mutex_unlock(&slab_mutex);
	put_online_cpus();
}
EXPORT_SYMBOL(kmem_cache_destroy);

int slab_is_available(void)
{
	return slab_state >= UP;
}

#ifndef CONFIG_SLOB

/* Create a cache during boot when no slab services are available yet */
void __init create_boot_cache(struct kmem_cache *s, const char *name, size_t size,
		unsigned long flags)
{
	int err;

	s->name = name;
	s->size = s->object_size = size;
	s->align = calculate_alignment(flags, ARCH_KMALLOC_MINALIGN, size);
	err = __kmem_cache_create(s, flags);

	if (err)
		panic("Creation of kmalloc slab %s size=%ld failed. Reason %d\n",
					name, size, err);

	list_add(&s->list, &slab_caches);
	s->refcount = -1;	/* Exempt from merging for now */
}

struct kmem_cache *__init create_kmalloc_cache(const char *name, size_t size,
				unsigned long flags)
{
	struct kmem_cache *s = kmem_cache_zalloc(kmem_cache, GFP_NOWAIT);

	if (!s)
		panic("Out of memory when creating slab %s\n", name);

	create_boot_cache(s, name, size, flags);
	s->refcount = 1;
	return s;
}

struct kmem_cache *kmalloc_caches[KMALLOC_SHIFT_HIGH + 1];
EXPORT_SYMBOL(kmalloc_caches);

#ifdef CONFIG_ZONE_DMA
struct kmem_cache *kmalloc_dma_caches[KMALLOC_SHIFT_HIGH + 1];
EXPORT_SYMBOL(kmalloc_dma_caches);
#endif

/*
 * Create the kmalloc array. Some of the regular kmalloc arrays
 * may already have been created because they were needed to
 * enable allocations for slab creation.
 */
void __init create_kmalloc_caches(gfp_t flags)
{
	int i;

	/* Caches that are not of the two-to-the-power-of size */
	if (KMALLOC_MIN_SIZE <= 32 && !kmalloc_caches[1])
		kmalloc_caches[1] = create_kmalloc_cache(NULL, 96, flags);

	if (KMALLOC_MIN_SIZE <= 64 && !kmalloc_caches[2])
		kmalloc_caches[2] = create_kmalloc_cache(NULL, 192, flags);

	for (i = KMALLOC_SHIFT_LOW; i <= KMALLOC_SHIFT_HIGH; i++)
		if (!kmalloc_caches[i])
			kmalloc_caches[i] = create_kmalloc_cache(NULL,
				       			1 << i, flags);

	/* Kmalloc array is now usable */
	slab_state = UP;

	for (i = 0; i <= KMALLOC_SHIFT_HIGH; i++) {
		struct kmem_cache *s = kmalloc_caches[i];
		char *n;

		if (s) {
			n = kasprintf(GFP_NOWAIT, "kmalloc-%d", kmalloc_size(i));

			BUG_ON(!n);
			s->name = n;
		}
	}

#ifdef CONFIG_ZONE_DMA
	for (i = 0; i <= KMALLOC_SHIFT_HIGH; i++) {
		struct kmem_cache *s = kmalloc_caches[i];

		if (s) {
			int size = kmalloc_size(i);
			char *n = kasprintf(GFP_NOWAIT,
				 "dma-kmalloc-%d", size);

			BUG_ON(!n);
			kmalloc_dma_caches[i] = create_kmalloc_cache(n,
				size, SLAB_CACHE_DMA | flags);
		}
	}
#endif
}


#endif /* !CONFIG_SLOB */

--6sX45UoQRIJXqkqR--
