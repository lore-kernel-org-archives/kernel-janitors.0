From: Julia Lawall <julia@diku.dk>
Date: Tue, 01 Jan 2008 21:08:10 +0000
Subject: [PATCH 1/2] drivers/media/radio: Use video_device_release rather
Message-Id: <Pine.LNX.4.64.0801012207110.19803@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: v4l-dvb-maintainer@linuxtv.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The file drivers/media/video/videodev.c defines both video_device_alloc and
video_device_release.  These are essentially just kzmalloc and kfree,
respectively, but it seems better to use video_device_release, as done in
the other media files, rather than kfree, in case the implementation some
day changes.


The problem was found using the following semantic match.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* E = video_device_alloc(...);
  if (E = NULL) S
  ... when != video_device_release(...,(T1)E,...)
      when != if (E != NULL) { ... video_device_release(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != video_device_release(...,(T2)E,...)
        when != if (E != NULL) { ... video_device_release(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/drivers/media/radio/radio-maestro.c b/drivers/media/radio/radio-maestro.c
--- a/drivers/media/radio/radio-maestro.c	2007-06-02 22:32:16.000000000 +0200
+++ b/drivers/media/radio/radio-maestro.c	2008-01-01 14:18:44.000000000 +0100
@@ -423,7 +423,7 @@ static int __devinit maestro_probe(struc
 errunr:
 	video_unregister_device(maestro_radio_inst);
 errfr1:
-	kfree(maestro_radio_inst);
+	video_device_release(maestro_radio_inst);
 errfr:
 	kfree(radio_unit);
 err:
