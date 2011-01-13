From: Sukanto Ghosh <sukanto.cse.iitb@gmail.com>
Date: Thu, 13 Jan 2011 06:49:44 +0000
Subject: Re: [PATCH] Removes warning related to use of uninitialized variable i
Message-Id: <AANLkTi=2E=d9rGDrc01G9sfcoFBUHv_wRq3KLDeFt=m-@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
In-Reply-To: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The warning is given by GCC 4.2.2 (provided with eldk cross-compiler
4.2 for ppc_4xx)
Resending the patch with uninitialized_var()

Signed-off-by: Sukanto Ghosh <sukanto.cse.iitb@gmail.com>
--


diff --git a/drivers/serial/8250.c b/drivers/serial/8250.c
index b25e6e4..05c0ba3 100644
--- a/drivers/serial/8250.c
+++ b/drivers/serial/8250.c
@@ -1724,7 +1724,7 @@ static int serial_link_irq_chain(struct
uart_8250_port *up)

 static void serial_unlink_irq_chain(struct uart_8250_port *up)
 {
-       struct irq_info *i;
+       struct irq_info *uninitialized_var(i);
        struct hlist_node *n;
        struct hlist_head *h;
