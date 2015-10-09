From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Oct 2015 06:40:50 +0000
Subject: [patch] intel_th: checking for ERR_PTR instead of NULL
Message-Id: <20151009064050.GB7540@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

devm_ioremap() returns NULL on error, it doesn't return an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwtracing/intel_th/pti.c b/drivers/hwtracing/intel_th/pti.c
index 1e3bbc8..57cbfdc 100644
--- a/drivers/hwtracing/intel_th/pti.c
+++ b/drivers/hwtracing/intel_th/pti.c
@@ -207,8 +207,8 @@ static int intel_th_pti_probe(struct intel_th_device *thdev)
 		return -ENODEV;
 
 	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (!base)
+		return -ENOMEM;
 
 	pti = devm_kzalloc(dev, sizeof(*pti), GFP_KERNEL);
 	if (!pti)
diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 99f7662..7b73ab9 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -1458,8 +1458,8 @@ static int intel_th_msc_probe(struct intel_th_device *thdev)
 		return -ENODEV;
 
 	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (!base)
+		return -ENOMEM;
 
 	msc = devm_kzalloc(dev, sizeof(*msc), GFP_KERNEL);
 	if (!msc)
diff --git a/drivers/hwtracing/intel_th/gth.c b/drivers/hwtracing/intel_th/gth.c
index 673d272..2dc5378 100644
--- a/drivers/hwtracing/intel_th/gth.c
+++ b/drivers/hwtracing/intel_th/gth.c
@@ -635,8 +635,8 @@ static int intel_th_gth_probe(struct intel_th_device *thdev)
 		return -ENODEV;
 
 	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (!base)
+		return -ENOMEM;
 
 	gth = devm_kzalloc(dev, sizeof(*gth), GFP_KERNEL);
 	if (!gth)
diff --git a/drivers/hwtracing/intel_th/sth.c b/drivers/hwtracing/intel_th/sth.c
index e488fcc..56101c3 100644
--- a/drivers/hwtracing/intel_th/sth.c
+++ b/drivers/hwtracing/intel_th/sth.c
@@ -194,16 +194,16 @@ static int intel_th_sth_probe(struct intel_th_device *thdev)
 		return -ENODEV;
 
 	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (!base)
+		return -ENOMEM;
 
 	res = intel_th_device_get_resource(thdev, IORESOURCE_MEM, 1);
 	if (!res)
 		return -ENODEV;
 
 	channels = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(channels))
-		return PTR_ERR(channels);
+	if (!channels)
+		return -ENOMEM;
 
 	sth = devm_kzalloc(dev, sizeof(*sth), GFP_KERNEL);
 	if (!sth)
