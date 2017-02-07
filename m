From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 07 Feb 2017 19:43:30 +0000
Subject: [PATCH 04/18] HID: Improve another size determination in open_collection()
Message-Id: <19c977dd-521b-c284-adc5-ee4050f3297b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <edd25fcd-8625-2469-fa28-2315f81b6b8e@users.sourceforge.net>
In-Reply-To: <edd25fcd-8625-2469-fa28-2315f81b6b8e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 6 Feb 2017 19:19:22 +0100

Replace the specification of a data structure by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 51f3547ca44f..404eccd0d670 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -138,11 +138,9 @@ static int open_collection(struct hid_parser *parser, unsigned type)
 			return -ENOMEM;
 
 		memcpy(collection, parser->device->collection,
-			sizeof(struct hid_collection) *
-			parser->device->collection_size);
+		       sizeof(*collection) * parser->device->collection_size);
 		memset(collection + parser->device->collection_size, 0,
-			sizeof(struct hid_collection) *
-			parser->device->collection_size);
+		       sizeof(*collection) * parser->device->collection_size);
 		kfree(parser->device->collection);
 		parser->device->collection = collection;
 		parser->device->collection_size *= 2;
-- 
2.11.1

