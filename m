From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 12 May 2020 05:21:01 +0000
Subject: MAINTAINERS: Wrong ordering in VIRTIO BALLOON
Message-Id: <alpine.DEB.2.21.2005120717260.3701@felia>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

with your commit 6d6b93b9afd8 ("MAINTAINERS: Add myself as virtio-balloon 
co-maintainer"), visible on next-20200508, ./scripts/checkpatch.pl -f 
MAINTAINERS complains:

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
#17982: FILE: MAINTAINERS:17982:
+F:	include/uapi/linux/virtio_balloon.h
+F:	include/linux/balloon_compaction.h

This is due to wrong ordering of the entries in your submission. If you 
would like me to send you a patch fixing that, please just let me know.

It is a recent addition to checkpatch.pl to report ordering problems in 
MAINTAINERS, so you might have not seen that at submission time.


Best regards,

Lukas
