From: Mika Kukkonen <mikukkon@iki.fi>
Date: Mon, 21 Mar 2016 19:28:39 +0000
Subject: [PATCH] [JANITOR] Actually use the calculated cnt in kernel/trace/ring_buffer.c
Message-Id: <CANj=StrD-fmQDHQ-8MLdn0YTn=s5tv1TH25HLaSBS0ZiTcQc+Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Was deleting an old github kernel tree and noticed this one line patch
I had made years back. Can't remember the compiler warning anymore but
clearly it complained about pointless assigment to cnt since it is not
used after that, although to me it looks like it should.

Signed-off-by: Mika Kukkonen <mikukkon@iki.fi>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 95181e3..22d1007 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4756,7 +4756,7 @@ static __init int rb_write_something(struct
rb_test_data *data, bool nested)
        cnt = data->cnt + (nested ? 27 : 0);

        /* Multiply cnt by ~e, to make some unique increment */
-       size = (data->cnt * 68 / 25) % (sizeof(rb_string) - 1);
+       size = (cnt * 68 / 25) % (sizeof(rb_string) - 1);

        len = size + sizeof(struct rb_item);

--MiKu
