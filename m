From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 31 Aug 2012 06:54:02 +0000
Subject: [samsung:devfreq-for-next 3/5] drivers/devfreq/devfreq.c:75:5: sparse: symbol 'devfreq_get_freq_leve
Message-Id: <20120831065402.GA6761@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="9amGYk9869ThD9tj"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonghwa,

FYI, there are new sparse warnings show up in

tree:   git://git.infradead.org/users/kmpark/linux-samsung devfreq-for-next
head:   90609cd121f47446e6a04862214423dbc75bd493
commit: 4b77f78761889635ba1abd2f4ec1e7f45012e48c [3/5] devfreq: Add sysfs node for representing frequency transition information.

All sparse warnings:

+ drivers/devfreq/devfreq.c:75:5: sparse: symbol 'devfreq_get_freq_level' was not declared. Should it be static?
+ drivers/devfreq/devfreq.c:86:5: sparse: symbol 'devfreq_update_status' was not declared. Should it be static?

vim +75 drivers/devfreq/devfreq.c
    72		return ERR_PTR(-ENODEV);
    73	}
    74	
  > 75	int devfreq_get_freq_level(struct devfreq *devfreq, unsigned long freq)
    76	{
    77		int lev;
    78	

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--9amGYk9869ThD9tj
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-4b77f78.diff"

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 00e326c..e00a386 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -72,7 +72,7 @@ static struct devfreq *find_device_devfreq(struct device *dev)
 	return ERR_PTR(-ENODEV);
 }
 
-int devfreq_get_freq_level(struct devfreq *devfreq, unsigned long freq)
+static int devfreq_get_freq_level(struct devfreq *devfreq, unsigned long freq)
 {
 	int lev;
 
@@ -83,7 +83,7 @@ int devfreq_get_freq_level(struct devfreq *devfreq, unsigned long freq)
 	return -EINVAL;
 }
 
-int devfreq_update_status(struct devfreq *devfreq, unsigned long freq)
+static int devfreq_update_status(struct devfreq *devfreq, unsigned long freq)
 {
 	int lev, prev_lev;
 	unsigned long cur_time;

--9amGYk9869ThD9tj--
