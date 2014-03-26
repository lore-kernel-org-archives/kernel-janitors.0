From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 26 Mar 2014 21:33:38 +0000
Subject: [PATCH 0/7] replace del_timer by del_timer_sync
Message-Id: <1395869625-15209-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, linux-mips@linux-mips.org, linux-hams@vger.kernel.org

These patches replace del_timer by del_timer_sync in module_exit functions.

