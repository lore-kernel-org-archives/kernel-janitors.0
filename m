From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 15 Mar 2006 11:20:54 +0000
Subject: [KJ][Patch] remove compatability  /mm/slab.c
Message-Id: <1142421654.7781.31.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41312057877328412=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41312057877328412==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-03-13 at 21:34 +0100, Christophe Jaillet wrote:
> Hi all,
> 
> in /mm/slab.c we can find around line 263 :
> 
> struct array_cache {
>  unsigned int avail;
>  unsigned int limit;
>  unsigned int batchcount;
>  unsigned int touched;
>  spinlock_t lock;
>  void *entry[0];  /*
>      * Must have this definition in here for the proper
>      * alignment of array_cache. Also simplifies accessing
>      * the entries.
>      * [0] is for gcc 2.95. It should really be [].
>      */
> };
> 
> The last line of the comment seems outdated, so maybe it could be removed
> and the [0] turned into [] as suggested which is IMO a bit clearer.

G'day list,

Here is a patch for the above.

It compiles fine, however I'm not sure if I should be doing anything
else in support of this change or if this is all that is required.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc6/mm/slab.c.orig	2006-03-15 21:34:59.000000000 +1100
+++ linux-2.6.16-rc6/mm/slab.c	2006-03-15 21:38:11.000000000 +1100
@@ -266,12 +266,11 @@ struct array_cache {
 	unsigned int batchcount;
 	unsigned int touched;
 	spinlock_t lock;
-	void *entry[0];		/*
-				 * Must have this definition in here for the proper
-				 * alignment of array_cache. Also simplifies accessing
-				 * the entries.
-				 * [0] is for gcc 2.95. It should really be [].
-				 */
+	void *entry[];	/*
+			 * Must have this definition in here for the proper
+			 * alignment of array_cache. Also simplifies accessing
+			 * the entries.
+			 */
 };
 
 /* bootstrap: The caches do not work without cpuarrays anymore,



--===============41312057877328412==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41312057877328412==--
