From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 11 Dec 2012 03:05:27 +0000
Subject: [PATCH 0/1] media: saa7146: don't use mutex_lock_interruptible in
Message-Id: <1355195128-10209-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, michael@mihu.de, mchehab@redhat.com, linux-media@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>

This is the same kind of bug as the one fixed by
ddc43d6dc7df0849fe41b91460fa76145cf87b67 : mutex_lock() must be used in the
device_release file operation in order for all resources to be freed, since
returning -RESTARTSYS has no effect here.

I stole the commit log from Sylwester Nawrocki, who fixed a few of these issues,
since I could not formulate it better.

---

Cyril Roelandt (1):
  media: saa7146: don't use mutex_lock_interruptible() in
    device_release().

 drivers/media/common/saa7146/saa7146_fops.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
1.7.10.4

