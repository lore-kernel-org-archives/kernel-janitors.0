From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 Dec 2014 18:56:53 +0000
Subject: Re: Mailbox: Add support for Platform Communication Channel
Message-Id: <20141217185653.GR4911@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141215215643.GA2882@mwanda>
In-Reply-To: <20141215215643.GA2882@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Dec 17, 2014 at 11:46:09AM -0500, Ashwin Chaugule wrote:
> > Also this file has some Sparse warnings:
> 
> I've looked at these previously too and I believe they're false
> positives.  Will send a follow up patch at the earliest.
> 

They're not bugs, it just means that there are some __iomem annotations
missing and some functions should be made static or declared in a .h
file or whatever.

Something like this:

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 6dbf6fc..ccf0b18 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -171,8 +171,8 @@ EXPORT_SYMBOL_GPL(pcc_mbox_free_channel);
 static bool pcc_tx_done(struct mbox_chan *chan)
 {
 	struct acpi_pcct_hw_reduced *pcct_ss = chan->con_priv;
-	struct acpi_pcct_shared_memory *generic_comm_base -		(struct acpi_pcct_shared_memory *) pcct_ss->base_address;
+	struct acpi_pcct_shared_memory __iomem *generic_comm_base +		(struct acpi_pcct_shared_memory __iomem *) pcct_ss->base_address;
 	u16 cmd_delay = pcct_ss->latency;
 	unsigned int retries = 0;
 
@@ -206,8 +206,8 @@ static bool pcc_tx_done(struct mbox_chan *chan)
 static int pcc_send_data(struct mbox_chan *chan, void *data)
 {
 	struct acpi_pcct_hw_reduced *pcct_ss = chan->con_priv;
-	struct acpi_pcct_shared_memory *generic_comm_base -		(struct acpi_pcct_shared_memory *) pcct_ss->base_address;
+	struct acpi_pcct_shared_memory __iomem *generic_comm_base +		(struct acpi_pcct_shared_memory __iomem *) pcct_ss->base_address;
 	struct acpi_generic_address doorbell;
 	u64 doorbell_preserve;
 	u64 doorbell_val;


