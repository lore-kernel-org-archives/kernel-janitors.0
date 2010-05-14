From: Dan Carpenter <error27@gmail.com>
Date: Fri, 14 May 2010 14:50:05 +0000
Subject: [patch -next] sound/asihpi: incorrect range check
Message-Id: <20100514145005.GD17487@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Eliot Blennerhassett <eblennerhassett@audioscience.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

The entity_type_to_size[] array has LAST_ENTITY_TYPE (11) number of elements,
not LAST_ENTITY_ROLE (17).  This only affects the debug output.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/pci/asihpi/hpifunc.c b/sound/pci/asihpi/hpifunc.c
index 254c580..eda26b3 100644
--- a/sound/pci/asihpi/hpifunc.c
+++ b/sound/pci/asihpi/hpifunc.c
@@ -3407,7 +3407,7 @@ u16 hpi_entity_alloc_and_pack(const enum e_entity_type type,
 	if (hE)
 		return hE;
 
-	HPI_DEBUG_ASSERT(role > entity_role_null && type < LAST_ENTITY_ROLE);
+	HPI_DEBUG_ASSERT(role > entity_role_null && type < LAST_ENTITY_TYPE);
 
 	bytes_to_copy = entity_type_to_size[type] * item_count;
 	total_size = hpi_entity_header_size(*entity) + bytes_to_copy;
