From: Sukanto Ghosh <sukanto.cse.iitb@gmail.com>
Date: Thu, 13 Jan 2011 02:26:43 +0000
Subject: [PATCH] Removes warning related to use of uninitialized variable i
Message-Id: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Diff against 2.6.37


Signed-off-by: Sukanto Ghosh <sukanto.cse.iitb@gmail.com>

----
diff --git a/drivers/serial/8250.c b/drivers/serial/8250.c
index b25e6e4..add97dd 100644
--- a/drivers/serial/8250.c
+++ b/drivers/serial/8250.c
@@ -1724,7 +1724,7 @@ static int serial_link_irq_chain(struct
uart_8250_port *up)

 static void serial_unlink_irq_chain(struct uart_8250_port *up)
 {
-       struct irq_info *i;
+       struct irq_info *i = NULL;
        struct hlist_node *n;
        struct hlist_head *h;

@@ -1739,7 +1739,7 @@ static void serial_unlink_irq_chain(struct
uart_8250_port *up)
        }

        BUG_ON(n = NULL);
-       BUG_ON(i->head = NULL);
+       BUG_ON(i = NULL || i->head = NULL);

        if (list_empty(i->head))
                free_irq(up->port.irq, i);
