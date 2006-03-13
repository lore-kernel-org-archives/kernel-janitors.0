From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Mar 2006 20:34:27 +0000
Subject: [KJ] /mm/slab.c
Message-Id: <002201c646dd$864603d0$11cfc756@bureau>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

in /mm/slab.c we can find around line 263 :

struct array_cache {
 unsigned int avail;
 unsigned int limit;
 unsigned int batchcount;
 unsigned int touched;
 spinlock_t lock;
 void *entry[0];  /*
     * Must have this definition in here for the proper
     * alignment of array_cache. Also simplifies accessing
     * the entries.
     * [0] is for gcc 2.95. It should really be [].
     */
};

The last line of the comment seems outdated, so maybe it could be removed
and the [0] turned into [] as suggested which is IMO a bit clearer.

As far as I know (/Documentation/Changes), 2.95 is no more the reference
when building the kernel.

As I have actually no way to compile the kernel, I just point it out in case
someone wants to give it a try.

CJ


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
