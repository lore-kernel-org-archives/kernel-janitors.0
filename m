From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 04 Feb 2016 18:50:41 +0000
Subject: Re: kernel/locking/lockdep.c: convert hash tables to hlists
Message-Id: <20160204105041.d236d3df2bbcb342a59bf29f@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160204115703.GA3734@mwanda>
In-Reply-To: <20160204115703.GA3734@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 4 Feb 2016 14:57:03 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Hello Andrew Morton,
> 
> The patch 680a50c9271b: "kernel/locking/lockdep.c: convert hash
> tables to hlists" from Feb 4, 2016, leads to the following static
> checker warning:
> 
> 	kernel/locking/lockdep.c:3933 lockdep_free_key_range()
> 	warn: 'head' can't be NULL.
> 
> kernel/locking/lockdep.c
>   3928          /*
>   3929           * Unhash all classes that were created by this module:
>   3930           */
>   3931          for (i = 0; i < CLASSHASH_SIZE; i++) {
>   3932                  head = classhash_table + i;
>   3933                  if (!head)
> 
> classhash_table is an array.
> 
>   3934                          continue;
>   3935                  hlist_for_each_entry_rcu(class, head, hash_entry) {
>   3936                          if (within(class->key, start, size))
>   3937                                  zap_class(class);
>   3938                          else if (within(class->name, start, size))
>   3939                                  zap_class(class);
>   3940                  }
>   3941          }
> 
> Also:
> kernel/locking/lockdep.c:3990 lockdep_reset_lock() warn: 'head' can't be NULL.

doh, OK, thanks, even better.

--- a/kernel/locking/lockdep.c~kernel-locking-lockdepc-convert-hash-tables-to-hlists-fix
+++ a/kernel/locking/lockdep.c
@@ -3930,8 +3930,6 @@ void lockdep_free_key_range(void *start,
 	 */
 	for (i = 0; i < CLASSHASH_SIZE; i++) {
 		head = classhash_table + i;
-		if (!head)
-			continue;
 		hlist_for_each_entry_rcu(class, head, hash_entry) {
 			if (within(class->key, start, size))
 				zap_class(class);
@@ -3987,8 +3985,6 @@ void lockdep_reset_lock(struct lockdep_m
 	locked = graph_lock();
 	for (i = 0; i < CLASSHASH_SIZE; i++) {
 		head = classhash_table + i;
-		if (!head)
-			continue;
 		hlist_for_each_entry_rcu(class, head, hash_entry) {
 			int match = 0;
 
_

