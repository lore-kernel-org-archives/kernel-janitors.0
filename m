From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 May 2017 21:23:19 +0000
Subject: [PATCH] Input: synaptics-rmi4 - change a char type to u8
Message-Id: <20170503212319.frj4k66dzezlleey@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Dyer <nick@shmanahar.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch doesn't like when we use "%02X" to print char types because,
what about if it's a negative?

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/rmi4/rmi_f34v7.c b/drivers/input/rmi4/rmi_f34v7.c
index 10c0d11b72c9..ae2db1c3aebf 100644
--- a/drivers/input/rmi4/rmi_f34v7.c
+++ b/drivers/input/rmi4/rmi_f34v7.c
@@ -518,7 +518,7 @@ static int rmi_f34v7_read_queries(struct f34_data *f34)
 			query_1_7.partition_support[1] & HAS_GUEST_CODE;
 
 	if (query_0 & HAS_CONFIG_ID) {
-		char f34_ctrl[CONFIG_ID_SIZE];
+		u8 f34_ctrl[CONFIG_ID_SIZE];
 		int i = 0;
 		u8 *p = f34->configuration_id;
 		*p = '\0';
