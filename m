From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 18 Apr 2016 14:55:37 +0000
Subject: [PATCH 4/5] TTY: add __init attribute
Message-Id: <1460991338-9845-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460991338-9845-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1460991338-9845-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@kernel.org>, Josh Triplett <josh@joshtriplett.org>

Add __init attribute on a function that is only called from other __init
functions and that is not inlined, at least with gcc version 4.8.4 on an
x86 machine with allyesconfig.  Currently, the function is put in the
.text.unlikely segment.  Declaring it as __init will cause it to be put in
the .init.text and to disappear after initialization.

The result of objdump -x on the function before the change is as follows:

000000000000014c l     F .text.unlikely 0000000000000a2e init_r_port

And after the change it is as follows:

0000000000000000 l     F .init.text	0000000000000a29 init_r_port

Done with the help of Coccinelle.  The semantic patch checks for local
static non-init functions that are called from an __init function and are
not called from any other function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/tty/rocket.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/rocket.c b/drivers/tty/rocket.c
index 0b802cd..e979f2f 100644
--- a/drivers/tty/rocket.c
+++ b/drivers/tty/rocket.c
@@ -615,7 +615,8 @@ static void rp_do_poll(unsigned long dummy)
  *  the board.  
  *  Inputs:  board, aiop, chan numbers
  */
-static void init_r_port(int board, int aiop, int chan, struct pci_dev *pci_dev)
+static void __init
+init_r_port(int board, int aiop, int chan, struct pci_dev *pci_dev)
 {
 	unsigned rocketMode;
 	struct r_port *info;

