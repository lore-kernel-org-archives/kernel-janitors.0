From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Feb 2016 11:57:03 +0000
Subject: re: kernel/locking/lockdep.c: convert hash tables to hlists
Message-Id: <20160204115703.GA3734@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andrew Morton,

The patch 680a50c9271b: "kernel/locking/lockdep.c: convert hash
tables to hlists" from Feb 4, 2016, leads to the following static
checker warning:

	kernel/locking/lockdep.c:3933 lockdep_free_key_range()
	warn: 'head' can't be NULL.

kernel/locking/lockdep.c
  3928          /*
  3929           * Unhash all classes that were created by this module:
  3930           */
  3931          for (i = 0; i < CLASSHASH_SIZE; i++) {
  3932                  head = classhash_table + i;
  3933                  if (!head)

classhash_table is an array.

  3934                          continue;
  3935                  hlist_for_each_entry_rcu(class, head, hash_entry) {
  3936                          if (within(class->key, start, size))
  3937                                  zap_class(class);
  3938                          else if (within(class->name, start, size))
  3939                                  zap_class(class);
  3940                  }
  3941          }

Also:
kernel/locking/lockdep.c:3990 lockdep_reset_lock() warn: 'head' can't be NULL.


regards,
dan carpenter
