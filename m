From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 01 Apr 2014 13:49:16 +0000
Subject: [PATCH 0/3] replace del_timer by del_timer_sync
Message-Id: <1396360159-16244-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org

These patches replace del_timer by del_timer_sync in remove functions.

