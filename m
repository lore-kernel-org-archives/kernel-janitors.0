From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 26 Mar 2020 13:30:07 +0000
Subject: Re: [PATCH 3/8] mmap locking API: use coccinelle to convert mmap_sem rwsem call sites
Message-Id: <b1c878c0-878a-6684-7cac-d1f4409295f6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michel Lespinasse <walken@google.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Hugh Dickins <hughd@google.com>, Jerome Glisse <jglisse@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, Liam Howlett <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Ying Han <yinghan@google.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> This change converts the existing mmap_sem rwsem calls to use the new
> mmap locking API instead.
>
> The change is generated using coccinelle with the following rules:

Do you find the following script variant more succinct together
with the usage of a disjunction in a single SmPL rule?


@replacement@
expression x;
@@
(
-init_rwsem
+mmap_init_lock
|
-down_write
+mmap_write_lock
|
-down_write_killable
+mmap_write_lock_killable
|
-down_write_trylock
+mmap_write_trylock
|
-up_write
+mmap_write_unlock
|
-downgrade_write
+mmap_downgrade_write_lock
|
-down_read
+mmap_read_lock
|
-down_read_killable
+mmap_read_lock_killable
|
-down_read_trylock
+mmap_read_trylock
|
-up_read
+mmap_read_unlock
|
-rwsem_is_locked
+mmap_is_locked
)
 (
- &
  x
- ->mmap_sem
 )


Regards,
Markus
