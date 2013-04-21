From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 21 Apr 2013 11:10:03 +0000
Subject: [patch] [media] media: info leak in media_device_enum_entities()
Message-Id: <20130421111003.GD6171@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The last part of the "u_ent.name" buffer isn't cleared so it still has
uninitialized stack memory.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/media-device.c b/drivers/media/media-device.c
index 99b80b6..1957c0d 100644
--- a/drivers/media/media-device.c
+++ b/drivers/media/media-device.c
@@ -102,9 +102,12 @@ static long media_device_enum_entities(struct media_device *mdev,
 		return -EINVAL;
 
 	u_ent.id = ent->id;
-	u_ent.name[0] = '\0';
-	if (ent->name)
-		strlcpy(u_ent.name, ent->name, sizeof(u_ent.name));
+	if (ent->name) {
+		strncpy(u_ent.name, ent->name, sizeof(u_ent.name));
+		u_ent.name[sizeof(u_ent.name) - 1] = '\0';
+	} else {
+		memset(u_ent.name, 0, sizeof(u_ent.name));
+	}
 	u_ent.type = ent->type;
 	u_ent.revision = ent->revision;
 	u_ent.flags = ent->flags;
