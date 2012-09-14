From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Sep 2012 23:47:11 +0000
Subject: [cifs:for-next 61/66] fs/cifs/file.c:708:1: sparse: function 'cifs_find_fid_lock_conflict' with exte
Message-Id: <20120914234711.GB31637@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Pavel,

FYI, there are new sparse warnings show up in

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   c246704dfe86f2c1875b59a8d60ca69c1f48acb4
commit: 2485496555e7b3f0280e2958934e10fb2672fcf5 [61/66] CIFS: Check for mandatory brlocks on read/write

All sparse warnings:

+ fs/cifs/file.c:708:1: sparse: function 'cifs_find_fid_lock_conflict' with external linkage has definition
+ fs/cifs/file.c:708:1: sparse: symbol 'cifs_find_fid_lock_conflict' was not declared. Should it be static?

vim +708 fs/cifs/file.c
   698	cifs_del_lock_waiters(struct cifsLockInfo *lock)
   699	{
   700		struct cifsLockInfo *li, *tmp;
   701		list_for_each_entry_safe(li, tmp, &lock->blist, blist) {
   702			list_del_init(&li->blist);
   703			wake_up(&li->block_q);
   704		}
   705	}
   706	
   707	extern bool
 > 708	cifs_find_fid_lock_conflict(struct cifs_fid_locks *fdlocks, __u64 offset,
   709				    __u64 length, __u8 type, struct cifsFileInfo *cfile,
   710				    struct cifsLockInfo **conf_lock, bool rw_check)
   711	{
   712		struct cifsLockInfo *li;
   713		struct cifsFileInfo *cur_cfile = fdlocks->cfile;
   714		struct TCP_Server_Info *server = tlink_tcon(cfile->tlink)->ses->server;
   715	
   716		list_for_each_entry(li, &fdlocks->locks, llist) {
   717			if (offset + length <= li->offset ||
   718			    offset >= li->offset + li->length)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
