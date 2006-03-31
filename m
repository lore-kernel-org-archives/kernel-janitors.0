From: Dale Sedivec <dale-keyword-kerneljanitors.5631dd@codefu.org>
Date: Fri, 31 Mar 2006 20:07:22 +0000
Subject: [KJ] [PATCH] au88x0: clean up __devinit/__devexit
Message-Id: <20060331200722.GA21020@morgase.caliginous.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97097706056500044=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97097706056500044==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed all use of __devinit/__devexit and init.h from headers.  Any
attributes given in the prototype but not in the function definition have
been moved to the definition.

An exception is vortex_eq_free: I removed the __devexit attribute because
vortex_eq_free is called from vortex_core_shutdown, and
vortex_core_shutdown may be called from __devinit snd_vortex_create.

Compile tested with allyesconfig and allmodconfig.

Signed-off-by: Dale Sedivec <dale@codefu.org>

---

Patches against 2.6.16.

 sound/pci/au88x0/au88x0.h      |   13 ++++++-------
 sound/pci/au88x0/au88x0_core.c |    2 +-
 sound/pci/au88x0/au88x0_eq.c   |    2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.h b/sound/pci/au88x0/au88x0.h
index c2ad267..b115dba 100644
--- a/sound/pci/au88x0/au88x0.h
+++ b/sound/pci/au88x0/au88x0.h
@@ -19,7 +19,6 @@
 
 #ifdef __KERNEL__
 #include <sound/driver.h>
-#include <linux/init.h>
 #include <linux/pci.h>
 #include <asm/io.h>
 #include <sound/core.h>
@@ -277,14 +276,14 @@ static void vortex_Vort3D_InitializeSour
 #endif
 
 /* Driver stuff. */
-static int __devinit vortex_gameport_register(vortex_t * card);
+static int vortex_gameport_register(vortex_t * card);
 static void vortex_gameport_unregister(vortex_t * card);
 #ifndef CHIP_AU8820
-static int __devinit vortex_eq_init(vortex_t * vortex);
-static int __devexit vortex_eq_free(vortex_t * vortex);
+static int vortex_eq_init(vortex_t * vortex);
+static int vortex_eq_free(vortex_t * vortex);
 #endif
 /* ALSA stuff. */
-static int __devinit snd_vortex_new_pcm(vortex_t * vortex, int idx, int nr);
-static int __devinit snd_vortex_mixer(vortex_t * vortex);
-static int __devinit snd_vortex_midi(vortex_t * vortex);
+static int snd_vortex_new_pcm(vortex_t * vortex, int idx, int nr);
+static int snd_vortex_mixer(vortex_t * vortex);
+static int snd_vortex_midi(vortex_t * vortex);
 #endif
diff --git a/sound/pci/au88x0/au88x0_core.c b/sound/pci/au88x0/au88x0_core.c
index e3394fe..5958945 100644
--- a/sound/pci/au88x0/au88x0_core.c
+++ b/sound/pci/au88x0/au88x0_core.c
@@ -2658,7 +2658,7 @@ static void vortex_spdif_init(vortex_t *
 
 /* Initialization */
 
-static int vortex_core_init(vortex_t * vortex)
+static int __devinit vortex_core_init(vortex_t * vortex)
 {
 
 	printk(KERN_INFO "Vortex: init.... ");
diff --git a/sound/pci/au88x0/au88x0_eq.c b/sound/pci/au88x0/au88x0_eq.c
index c8280f8..6c3f636 100644
--- a/sound/pci/au88x0/au88x0_eq.c
+++ b/sound/pci/au88x0/au88x0_eq.c
@@ -886,7 +886,7 @@ static char *EqBandLabels[10] __devinitd
 };
 
 /* ALSA driver entry points. Init and exit. */
-static int vortex_eq_init(vortex_t * vortex)
+static int __devinit vortex_eq_init(vortex_t * vortex)
 {
 	struct snd_kcontrol *kcontrol;
 	int err, i;

--===============97097706056500044==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97097706056500044==--
