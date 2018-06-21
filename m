From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Jun 2018 08:06:41 +0000
Subject: [PATCH] cpufreq: qcom-kryo: Fix error handling in probe()
Message-Id: <20180621080618.gzbm3qgbp42pdirg@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should return if get_cpu_device() fails or it leads to a NULL
dereference.  Also dev_pm_opp_of_get_opp_desc_node() returns NULL on
error, it never returns error pointers.

Fixes: 46e2856b8e18 ("cpufreq: Add Kryo CPU scaling driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/cpufreq/qcom-cpufreq-kryo.c b/drivers/cpufreq/qcom-cpufreq-kryo.c
index d049fe4b80c4..b54049614744 100644
--- a/drivers/cpufreq/qcom-cpufreq-kryo.c
+++ b/drivers/cpufreq/qcom-cpufreq-kryo.c
@@ -86,8 +86,8 @@ static int qcom_cpufreq_kryo_probe(struct platform_device *pdev)
 	int ret;
 
 	cpu_dev = get_cpu_device(0);
-	if (NULL = cpu_dev)
-		ret = -ENODEV;
+	if (!cpu_dev)
+		return -ENODEV;
 
 	msm8996_version = qcom_cpufreq_kryo_get_msm_id();
 	if (NUM_OF_MSM8996_VERSIONS = msm8996_version) {
@@ -96,8 +96,8 @@ static int qcom_cpufreq_kryo_probe(struct platform_device *pdev)
 	}
 
 	np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
-	if (IS_ERR(np))
-		return PTR_ERR(np);
+	if (!np)
+		return -ENOENT;
 
 	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu");
 	if (!ret) {
