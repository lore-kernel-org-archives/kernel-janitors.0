From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:21:34 +0000
Subject: [PATCH 02/56] alpha: Remove void casts
Message-Id: <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---
 arch/alpha/boot/bootpz.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 1036b51..6e7af60 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -129,7 +129,7 @@ pal_init(void)
 	pcb_va->flags = 1;
 	pcb_va->res1 = 0;
 	pcb_va->res2 = 0;
-	pcb_pa = (struct pcb_struct *)find_pa((unsigned long)pcb_va);
+	pcb_pa = find_pa((unsigned long)pcb_va);
 
 	/*
 	 * a0 = 2 (OSF)
-- 
1.5.4.3

