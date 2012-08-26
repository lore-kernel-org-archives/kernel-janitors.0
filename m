From: Cyrill Gorcunov <gorcunov@openvz.org>
Date: Sun, 26 Aug 2012 20:40:49 +0000
Subject: Re: [vfs:master 30/32] fs/proc/fd.c:87:55: sparse: incorrect type in initializer (different base typ
Message-Id: <20120826204049.GE7428@moon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120826191257.GC9107@localhost>
In-Reply-To: <20120826191257.GC9107@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Aug 26, 2012 at 09:20:49PM +0100, Al Viro wrote:
> On Sun, Aug 26, 2012 at 11:52:36PM +0400, Cyrill Gorcunov wrote:
> > -				unsigned f_mode = file->f_mode;
> > +				unsigned int f_mode = file->f_mode;
> 
> This changes nothing; unsigned and unsigned int are exactly the same.
> fmode_t isn't, from sparse POV, and that's what you want to use here.

True. I get messed with this warning. Please see updated below.
---
From: Cyrill Gorcunov <gorcunov@openvz.org>
Subject: fs, proc: Fix sparse warning in tid_fd_revalidate

The following warnings have been caught

 | + fs/proc/fd.c:87:55: sparse: incorrect type in initializer (different base types)
 |   fs/proc/fd.c:87:55:    expected unsigned int [unsigned] f_mode
 |   fs/proc/fd.c:87:55:    got restricted fmode_t [usertype] f_mode
 | + fs/proc/fd.c:105:54: sparse: restricted fmode_t degrades to integer
 |   fs/proc/fd.c:107:54: sparse: restricted fmode_t degrades to integer

make f_mode and i_mode declared with proper types.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Cyrill Gorcunov <gorcunov@openvz.org>
CC: Al Viro <viro@ZenIV.linux.org.uk>
---
 fs/proc/fd.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6.git/fs/proc/fd.c
=================================--- linux-2.6.git.orig/fs/proc/fd.c
+++ linux-2.6.git/fs/proc/fd.c
@@ -84,7 +84,7 @@ static int tid_fd_revalidate(struct dent
 			rcu_read_lock();
 			file = fcheck_files(files, fd);
 			if (file) {
-				unsigned f_mode = file->f_mode;
+				fmode_t f_mode = file->f_mode;
 
 				rcu_read_unlock();
 				put_files_struct(files);
@@ -101,7 +101,7 @@ static int tid_fd_revalidate(struct dent
 				}
 
 				if (S_ISLNK(inode->i_mode)) {
-					unsigned i_mode = S_IFLNK;
+					umode_t i_mode = S_IFLNK;
 					if (f_mode & FMODE_READ)
 						i_mode |= S_IRUSR | S_IXUSR;
 					if (f_mode & FMODE_WRITE)
