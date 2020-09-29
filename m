From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:23 +0000
Subject: [PATCH 00/20] media: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-samsung-soc@vger.kernel.org
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

These patches replace commas by semicolons.  This was done using the
Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.

This semantic patch ensures that commas inside for loop headers will not be
transformed.  It also doesn't touch macro definitions.

Coccinelle ensures that braces are added as needed when a single-statement
branch turns into a multi-statement one.

This semantic patch has a few false positives, for variable delcarations
such as:

LIST_HEAD(x), *y;

The semantic patch could be improved to avoid these, but for the moment
they have been removed manually (2 occurrences).

// <smpl>
@initialize:ocaml@
@@

let infunction p   (* avoid macros *)
  (List.hd p).current_element <> "something_else"

let combined p1 p2   (List.hd p1).line_end = (List.hd p2).line ||
  (((List.hd p1).line_end < (List.hd p2).line) &&
   ((List.hd p1).col < (List.hd p2).col))

@bad@
statement S;
declaration d;
position p;
@@

S@p
d

// special cases where newlines are needed (hope for no more than 5)
@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@r@
expression e1,e2;
statement S;
position p != bad.p;
@@

e1 ,@S@p e2;

@@
expression e1,e2;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && not(combined p1 p2) };
statement S;
position r.p;
@@

e1@p1
-,@S@p
+;
e2@p2
... when any
// </smpl>

---

 drivers/media/dvb-frontends/m88ds3103.c             |    6 ++---
 drivers/media/dvb-frontends/rtl2832.c               |   14 ++++++------
 drivers/media/dvb-frontends/ts2020.c                |   10 ++++-----
 drivers/media/i2c/msp3400-kthreads.c                |   12 +++++++---
 drivers/media/pci/bt8xx/bttv-cards.c                |    6 +++--
 drivers/media/pci/saa7134/saa7134-video.c           |    7 ++++--
 drivers/media/platform/coda/coda-common.c           |    2 -
 drivers/media/platform/exynos4-is/fimc-core.c       |    6 +++--
 drivers/media/platform/s3c-camif/camif-core.c       |    6 +++--
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c |    2 -
 drivers/media/radio/radio-sf16fmr2.c                |    2 -
 drivers/media/tuners/mt2060.c                       |    2 -
 drivers/media/usb/au0828/au0828-video.c             |    2 -
 drivers/media/usb/dvb-usb-v2/dvbsky.c               |   22 ++++++++++----------
 drivers/media/usb/dvb-usb-v2/lmedm04.c              |    2 -
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c             |    4 +--
 drivers/media/usb/dvb-usb/dib0700_devices.c         |    4 +--
 drivers/media/usb/em28xx/em28xx-audio.c             |   14 ++++++------
 drivers/media/usb/gspca/ov534.c                     |   12 +++++-----
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c         |    2 -
 20 files changed, 75 insertions(+), 62 deletions(-)
