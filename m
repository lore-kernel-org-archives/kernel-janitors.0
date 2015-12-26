From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 26 Dec 2015 21:57:42 +0000
Subject: [PATCH 0/2] remove assignment from IS_ERR argument
Message-Id: <1451167064-2288-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2;
statement S1,S2;
@@

+e1 = e2;
if (IS_ERR(
    e1
-   = e2
   )) S1 else S2
// </smpl>

---

 drivers/usb/mon/mon_text.c |    6 ++++--
 ipc/mqueue.c               |    3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)
