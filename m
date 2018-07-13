From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:05:35 +0000
Subject: [PATCH] tty: serial: jsm: remove redundant pointer ch
Message-Id: <20180713090535.3205-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107114107.22805-1-colin.king@canonical.com>
In-Reply-To: <20171107114107.22805-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G . Piccoli" <gpiccoli@linux.vnet.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer ch is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'ch' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/serial/jsm/jsm_tty.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/jsm/jsm_tty.c b/drivers/tty/serial/jsm/jsm_tty.c
index b6bd6e15e07b..689774c073ca 100644
--- a/drivers/tty/serial/jsm/jsm_tty.c
+++ b/drivers/tty/serial/jsm/jsm_tty.c
@@ -430,7 +430,6 @@ int jsm_uart_port_init(struct jsm_board *brd)
 {
 	int i, rc;
 	unsigned int line;
-	struct jsm_channel *ch;
 
 	if (!brd)
 		return -ENXIO;
@@ -444,7 +443,7 @@ int jsm_uart_port_init(struct jsm_board *brd)
 	brd->nasync = brd->maxports;
 
 	/* Set up channel variables */
-	for (i = 0; i < brd->nasync; i++, ch = brd->channels[i]) {
+	for (i = 0; i < brd->nasync; i++) {
 
 		if (!brd->channels[i])
 			continue;
-- 
2.17.1

