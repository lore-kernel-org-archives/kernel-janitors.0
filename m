From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 Nov 2008 12:57:34 +0000
Subject: [PATCH] drivers/media/video/cx88/cx88-alsa.c: Adjust error-handling
Message-Id: <Pine.LNX.4.64.0811271357100.15160@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org, v4l-dvb-maintainer@linuxtv.org, video4linux-list@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In the function cx88_audio_initdev, the value card has been created using
snd_card_new.  The other error handling code in this function frees the
value using snd_card_free.  I have thus changed the first error case to do
the same.  On the other hand, it may be that card is not sufficiently
initialized at this point to use snd_card_free, in which case something
else should be done to free the memory in the error case.

In the function snd_cx88_create the call kfree(chip) in one error case looks
suspicious, both because it is not done in the other error code, and
because chip points into the middle of the memory allocated by
snd_card_new, ie it is not itself associated with a separate kmalloc.
Therefore I have removed it.

The semantic match that finds the first problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S,S1;
position p1,p2,p3;
expression E,E1;
type T,T1;
expression *ptr != NULL;
@@

(
 if ((x@p1 = snd_card_new(...)) = NULL) S
|
 x@p1 = snd_card_new(...);
)
 ... when != snd_card_free(...,(T)x,...)
     when != if (...) { <+... snd_card_free(...,(T)x,...) ...+> }
     when != true x = NULL || ...
     when != x = E
     when != E = (T)x
     when any
(
 if (x = NULL || ...) S1
|
 if@p2 (...) {
  ... when != snd_card_free(...,(T1)x,...)
      when != if (...) { <+... snd_card_free(...,(T1)x,...) ...+> }
      when != x = E1
      when != E1 = (T1)x
(
  return \(0\|<+...x...+>\|ptr\);
|
  return@p3 ...;
)
}
)

@ script:python @
p1 << r.p1;
p3 << r.p3;
@@

print "* file: %s snd_card_new: %s return: %s" % (p1[0].file,p1[0].line,p3[0].line)

// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/cx88/cx88-alsa.c           |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/media/video/cx88/cx88-alsa.c b/drivers/media/video/cx88/cx88-alsa.c
index 06f171a..66c755c 100644
--- a/drivers/media/video/cx88/cx88-alsa.c
+++ b/drivers/media/video/cx88/cx88-alsa.c
@@ -742,7 +742,6 @@ static int __devinit snd_cx88_create(struct snd_card *card,
 	core = cx88_core_get(pci);
 	if (NULL = core) {
 		err = -EINVAL;
-		kfree (chip);
 		return err;
 	}
 
@@ -812,7 +811,7 @@ static int __devinit cx88_audio_initdev(struct pci_dev *pci,
 
 	err = snd_cx88_create(card, pci, &chip);
 	if (err < 0)
-		return (err);
+		goto error;
 
 	err = snd_cx88_pcm(chip, 0, "CX88 Digital");
 	if (err < 0)
