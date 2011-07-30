From: Dan Carpenter <error27@gmail.com>
Date: Sat, 30 Jul 2011 08:19:58 +0000
Subject: [patch v2] w1: fix for loop in w1_f29_remove_slave()
Message-Id: <20110730081958.GA5575@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727095557.GL3824@shale.localdomain>
 <9C2475AA-829E-4BB8-A3D2-2444803A33D3@gmail.com>
 <CAOmT4fS1OqQb5KOOeFnGHt1tnYGBRutVrAZ4cXB6n=hou5fn8w@mail.gmail.com>
In-Reply-To: <CAOmT4fS1OqQb5KOOeFnGHt1tnYGBRutVrAZ4cXB6n=hou5fn8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bojan prtvar <prtvar.b@gmail.com>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Dagenais <jeff.dagenais@gmail.com>, Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

The for loop was looking for i <= 0 instead of i >= 0 so this
function never did anything.  Also we started with i NB_SYSFS_BIN_FILES instead of "NB_SYSFS_BIN_FILES - 1" which is an
off by one bug.

Reported-by: Bojan Prtvar <prtvar.b@gmail.com>
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2:  fix >= vs <
diff --git a/drivers/w1/slaves/w1_ds2408.c b/drivers/w1/slaves/w1_ds2408.c
index c377818..7c8cdb8 100644
--- a/drivers/w1/slaves/w1_ds2408.c
+++ b/drivers/w1/slaves/w1_ds2408.c
@@ -373,7 +373,7 @@ static int w1_f29_add_slave(struct w1_slave *sl)
 static void w1_f29_remove_slave(struct w1_slave *sl)
 {
 	int i;
-	for (i = NB_SYSFS_BIN_FILES; i <= 0; --i)
+	for (i = NB_SYSFS_BIN_FILES - 1; i >= 0; --i)
 		sysfs_remove_bin_file(&sl->dev.kobj,
 			&(w1_f29_sysfs_bin_files[i]));
 }
