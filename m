From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Oct 2010 13:59:15 +0000
Subject: [PATCH 1/4] drivers/media/dvb/ttpci/av7110_av.c: Add missing error handling code
Message-Id: <1286027958-7333-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Extend the error handling code with operations found in other nearby error
handling code.

A simplified version of the sematic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
@r@
statement S1,S2,S3;
constant C1,C2,C3;
@@

*if (...)
 {... S1 return -C1;}
...
*if (...)
 {... when != S1
    return -C2;}
...
*if (...)
 {... S1 return -C3;}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This is only a suggestion.  All of the other ways out of this function call
wake_up(&buf->queue);.  But I don't understand the code well enough to know
why, or whether there is a reason not to do it in this case.

 drivers/media/dvb/ttpci/av7110_av.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb/ttpci/av7110_av.c b/drivers/media/dvb/ttpci/av7110_av.c
index 6ef3996..3ce5ccf 100644
--- a/drivers/media/dvb/ttpci/av7110_av.c
+++ b/drivers/media/dvb/ttpci/av7110_av.c
@@ -245,8 +245,11 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen)
 		return -1;
 	}
 	while (1) {
-		if ((len = dvb_ringbuffer_avail(buf)) < 6)
+		len = dvb_ringbuffer_avail(buf);
+		if (len < 6) {
+			wake_up(&buf->queue);
 			return -1;
+		}
 		sync =  DVB_RINGBUFFER_PEEK(buf, 0) << 24;
 		sync |= DVB_RINGBUFFER_PEEK(buf, 1) << 16;
 		sync |= DVB_RINGBUFFER_PEEK(buf, 2) << 8;

