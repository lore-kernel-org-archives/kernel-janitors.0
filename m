From: Jarod Wilson <jarod@redhat.com>
Date: Tue, 17 Aug 2010 21:41:08 +0000
Subject: Re: [patch] Staging: lirc: remove unneeded variable
Message-Id: <20100817214108.GE13566@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100810061120.GB18431@bicker>
In-Reply-To: <20100810061120.GB18431@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 13, 2010 at 03:38:40PM +0200, Dan Carpenter wrote:
> On Wed, Aug 11, 2010 at 10:46:47PM -0400, Jarod Wilson wrote:
> > On Tue, Aug 10, 2010 at 08:11:20AM +0200, Dan Carpenter wrote:
> > > We never use control_req so I removed it.
> > > 
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > 
> > Leftover cruft from when lirc_imon also supported the devices now covered
> > by the ir-core imon driver.
> > 
> 
> Speak of left over stuff, it's weird that I didn't notice this before
> but gcc complains about an unitialized variable in
> imon_incoming_packet().
> 
> drivers/staging/lirc/lirc_imon.c: In function ‘imon_incoming_packet’:
> drivers/staging/lirc/lirc_imon.c:661: warning: ‘chunk_num’ may be used
> 	uninitialized in this function
> 
> I don't know how to fix that, but it looks important.

Ew. Yeah, that doesn't look so hot like it is right now. The old lirc_imon
driver had chunk_num = buf[7], and made much more extensive use of
chunk_num. Simply removing chunk_num and using buf[7] should be fine.

Signed-off-by: Jarod Wilson <jarod@redhat.com>
---
 drivers/staging/lirc/lirc_imon.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lirc/lirc_imon.c b/drivers/staging/lirc/lirc_imon.c
index 6649325..2351c88 100644
--- a/drivers/staging/lirc/lirc_imon.c
+++ b/drivers/staging/lirc/lirc_imon.c
@@ -599,7 +599,7 @@ static void imon_incoming_packet(struct imon_context *context,
 	struct device *dev = context->driver->dev;
 	int octet, bit;
 	unsigned char mask;
-	int i, chunk_num;
+	int i;
 
 	/*
 	 * just bail out if no listening IR client
@@ -658,7 +658,7 @@ static void imon_incoming_packet(struct imon_context *context,
 		}
 	}
 
-	if (chunk_num = 10) {
+	if (buf[7] = 10) {
 		if (context->rx.count) {
 			submit_data(context);
 			context->rx.count = 0;


-- 
Jarod Wilson
jarod@redhat.com

