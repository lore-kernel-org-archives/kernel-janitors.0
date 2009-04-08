From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 13:51:18 +0000
Subject: Re: [PATCH 06/56] cifs: Remove void casts
Message-Id: <49DCABD6.4080209@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080426r1dd57eddo598df8bae686cae4@mail.gmail.com>
In-Reply-To: <36ca99e90904080426r1dd57eddo598df8bae686cae4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

Fixed patch

Thanks

Jack

--

cifs: Remove void casts

From: Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---

 fs/cifs/transport.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index 0ad3e2d..86191b0 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -111,8 +111,7 @@ AllocOplockQEntry(struct inode *pinode, __u16 fid,
struct cifsTconInfo *tcon)
         cERROR(1, ("Null parms passed to AllocOplockQEntry"));
         return NULL;
     }
-    temp = (struct oplock_q_entry *) kmem_cache_alloc(cifs_oplock_cachep,
-                               GFP_KERNEL);
+    temp = kmem_cache_alloc(cifs_oplock_cachep, GFP_KERNEL);
     if (temp = NULL)
         return temp;
     else {
