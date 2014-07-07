From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Jul 2014 10:49:33 +0000
Subject: re: [PATCH] configfs: User-driven configuration filesystem
Message-Id: <20140707104933.GA8740@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Joel Becker,

This is a semi-automatic email about new static checker warnings.

The patch 7063fbf22611: "[PATCH] configfs: User-driven configuration
filesystem" from Dec 15, 2005, leads to the following Smatch
complaint:

fs/configfs/inode.c:256 configfs_drop_dentry()
	 error: we previously assumed 'dentry->d_inode' could be null (see line 252)

fs/configfs/inode.c
   251			spin_lock(&dentry->d_lock);
   252			if (!(d_unhashed(dentry) && dentry->d_inode)) {
                                                    ^^^^^^^^^^^^^^^
We want ->d_inode to be NULL (or d_unhashed() to be false).

   253				dget_dlock(dentry);
   254				__d_drop(dentry);
   255				spin_unlock(&dentry->d_lock);
   256				simple_unlink(parent->d_inode, dentry);
                                                               ^^^^^^
But then we dereference dentry->d_inode here inside the call to
simple_unlink() which is puzzling and means the initial condition is
wrong somehow.  Maybe the parenthesis are wrong and it should be:

		if (!d_unhashed(dentry) && dentry->d_inode) {

   257			} else
   258				spin_unlock(&dentry->d_lock);

regards,
dan carpenter
