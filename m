From: jiangyiwen <jiangyiwen@huawei.com>
Date: Wed, 22 Nov 2017 09:31:06 +0000
Subject: [V9fs-developer] [bug report] fs/9p: inode blocks show error in fscache mode
Message-Id: <5A1543DA.30504@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, sochin.jiang@huawei.com, Eduard Shishkin <Eduard.Shishkin@huawei.com>, "Xulei (Stone)" <stone.xulei@huawei.com>

Hi all,

I test a scenario that will cause the difference of inode blocks
between client and host, the scenario as follows:

Precondition:
1) use VirtFS(virtio-9p) to connect guest and host.
2) 9p dir in guest is /mnt/9p, host is /9p-host.
3) server fs is ext4 and block size is 4096.

Test steps:
1) on the client(guest)
# touch /mnt/9p/test/file
# dd if=/dev/zero of=/mnt/9p/test/file bs=1 count43456 seek02528 conv=notrunc

2) on the client(guest)
# stat /mnt/9p/test/file
the file's blocks is 4582 blocks(block size is 512)

3) on the server(host)
# stat /9p-host/test/file
the file's blocks is 2040 blocks(block size is 512)

Cause analysis:
Because the file is sparse file, so in function v9fs_write_end will
update inode blocks according to difference between last_pos and
inode_size, only when last_pos is larger than the inode_size, then it
update the blocks and inode_size, the operation is not fit the sparse
file.

Currently I want to call v9fs_invalidate_inode_attr to invalidate inode,
but it will influence the performance, so I don't have a good solution.

Please advise. Thanks in advance!

Best regards,
Yiwen

