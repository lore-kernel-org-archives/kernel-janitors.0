From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 09 Feb 2007 08:55:09 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <45CC36ED.6000508@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vignesh Babu BM wrote:
> Just went through the archives....
>
>         I tried to recreate the compile-failure (was some time ago since
>         it 
>         happened) when using min()/max() in a struct but it happily compiled it 
>         so (thankfully) you are correct, just need to use min()/max(). :)
>         
>         Richard Knutsson
>         
> Do you mean to say that you were able to compile when the macros were used inside struct?
> Im still not able to get that to happen...
>
> I tried that change in linux-2.6/fs/lockd/mon.c
>
> static struct rpc_procinfo	nsm_procedures[] = {
> [SM_MON] = {
> 		.p_proc		= SM_MON,
> 		.p_encode	= (kxdrproc_t) xdr_encode_mon,
> 		.p_decode	= (kxdrproc_t) xdr_decode_stat_res,
> 		.p_bufsiz	= max(SM_mon_sz, SM_monres_sz) << 2,
> 		.p_statidx	= SM_MON,
> 		.p_name		= "MONITOR",
> 	},
> [SM_UNMON] = {
> 		.p_proc		= SM_UNMON,
> 		.p_encode	= (kxdrproc_t) xdr_encode_unmon,
> 		.p_decode	= (kxdrproc_t) xdr_decode_stat,
> 		.p_bufsiz	= max(SM_mon_id_sz, SM_unmonres_sz) << 2,
> 		.p_statidx	= SM_UNMON,
> 		.p_name		= "UNMONITOR",
> 	},
> };
>   
No, I "recreated" it by making a small test-file where I used 
min()/max() in a struct, and it worked without a pip from the compiler.
Can not say I'm sure what the difference were, but xdr4.c and mon.c 
didn't seem to like it.

What do you say of something like this below? (It is not tested)

(Signed-off-by:) Richard Knutsson
---

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 63fb18d..0533b2d 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -252,6 +252,14 @@ static inline int __attribute__ ((format (printf, 1, 2))) pr_debug(const char *
 #error "Please fix asm/byteorder.h"
 #endif /* __LITTLE_ENDIAN */
 
+
+/*
+ * __min()/__max() is unsafe.
+ * Use min()/max() when available.
+ */
+#define __min(x,y)	((x) < (y) ? (x) : (y))
+#define __max(x,y)	((x) > (y) ? (x) : (y))
+
 /*
  * min()/max() macros that also do
  * strict type-checking.. See the
@@ -261,13 +269,13 @@ static inline int __attribute__ ((format (printf, 1, 2))) pr_debug(const char *
 	typeof(x) _x = (x);	\
 	typeof(y) _y = (y);	\
 	(void) (&_x = &_y);		\
-	_x < _y ? _x : _y; })
+	__min(_x, _y); })
 
 #define max(x,y) ({ \
 	typeof(x) _x = (x);	\
 	typeof(y) _y = (y);	\
 	(void) (&_x = &_y);		\
-	_x > _y ? _x : _y; })
+	__max(_x, _y); })
 
 /*
  * ..and if you can't take the strict
@@ -276,9 +284,9 @@ static inline int __attribute__ ((format (printf, 1, 2))) pr_debug(const char *
  * Or not use min/max at all, of course.
  */
 #define min_t(type,x,y) \
-	({ type __x = (x); type __y = (y); __x < __y ? __x: __y; })
+	({ type __x = (x); type __y = (y); __min(__x, __y); })
 #define max_t(type,x,y) \
-	({ type __x = (x); type __y = (y); __x > __y ? __x: __y; })
+	({ type __x = (x); type __y = (y); __max(__x, __y); })
 
 
 /**


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
