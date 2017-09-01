From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Sep 2017 10:08:10 +0000
Subject: [PATCH][staging-next] staging: unisys: visorbus: make two functions static
Message-Id: <20170901100810.17172-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tim Sell <timothy.sell@unisys.com>, David Binder <david.binder@unisys.com>, Sameer Wadgaonkar <sameer.wadgaonkar@unisys.com>, Charles Daniels <cdaniels@fastmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, sparmaintainer@unisys.com, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions sig_queue_offset and sig_data_offset are local to
the source and do not need to be in global scope, so make them
static.

Cleans up sparse warnings:
symbol 'sig_queue_offset' was not declared. Should it be static?
symbol 'sig_data_offset' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/unisys/visorbus/visorchannel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/unisys/visorbus/visorchannel.c b/drivers/staging/unisys/visorbus/visorchannel.c
index 49d1f5f9ef1d..2a000fee3119 100644
--- a/drivers/staging/unisys/visorbus/visorchannel.c
+++ b/drivers/staging/unisys/visorbus/visorchannel.c
@@ -155,7 +155,7 @@ void *visorchannel_get_header(struct visorchannel *channel)
  * Return offset of a specific SIGNAL_QUEUE_HEADER from the beginning of a
  * channel header
  */
-int sig_queue_offset(struct channel_header *chan_hdr, int q)
+static int sig_queue_offset(struct channel_header *chan_hdr, int q)
 {
 	return ((chan_hdr)->ch_space_offset +
 	       ((q) * sizeof(struct signal_queue_header)));
@@ -165,8 +165,8 @@ int sig_queue_offset(struct channel_header *chan_hdr, int q)
  * Return offset of a specific queue entry (data) from the beginning of a
  * channel header
  */
-int sig_data_offset(struct channel_header *chan_hdr, int q,
-		    struct signal_queue_header *sig_hdr, int slot)
+static int sig_data_offset(struct channel_header *chan_hdr, int q,
+			   struct signal_queue_header *sig_hdr, int slot)
 {
 	return (sig_queue_offset(chan_hdr, q) + sig_hdr->sig_base_offset +
 	       (slot * sig_hdr->signal_size));
-- 
2.14.1

