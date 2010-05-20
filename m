From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 20 May 2010 08:40:55 +0000
Subject: [PATCH 11/11] ALSA: hda: Storage class should be before const qualifier
Message-Id: <1274344855-9336-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: perex@perex.cz, tiwai@suse.de, alsa-devel@alsa-project.org
Cc: Tobias Klauser <tklauser@distanz.ch>, kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 sound/pci/hda/patch_realtek.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 80a183f..53538b0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -14207,7 +14207,7 @@ enum {
 	ALC269_FIXUP_SONY_VAIO,
 };
 
-const static struct hda_verb alc269_sony_vaio_fixup_verbs[] = {
+static const struct hda_verb alc269_sony_vaio_fixup_verbs[] = {
 	{0x19, AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_VREFGRD},
 	{}
 };
-- 
1.6.3.3

