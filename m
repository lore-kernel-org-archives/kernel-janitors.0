From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 09 Oct 2012 23:30:20 +0000
Subject: [target:queue 47/51] drivers/target/target_core_pscsi.c:464:5: sparse: symbol 'pscsi_configure_devic
Message-Id: <20121009233020.GC9331@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas, Christoph,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git queue
head:   738b86ac5e56c645aa5b7bf49cb38e2a04c665f8
commit: 410aeee637c47bcf7e8dd7893347fe0811e07ab1 [47/51] target: kill struct se_subsystem_dev


vim +464 drivers/target/target_core_pscsi.c

410aeee6 Christoph Hellwig  2012-10-08 @464  int pscsi_configure_device(struct se_device *dev)
c66ac9db Nicholas Bellinger 2010-12-17  465  {
410aeee6 Christoph Hellwig  2012-10-08  466  	struct se_hba *hba = dev->se_hba;
410aeee6 Christoph Hellwig  2012-10-08  467  	struct pscsi_dev_virt *pdv = PSCSI_DEV(dev);
c66ac9db Nicholas Bellinger 2010-12-17  468  	struct scsi_device *sd;
410aeee6 Christoph Hellwig  2012-10-08  469  	struct pscsi_hba_virt *phv = dev->se_hba->hba_ptr;
c66ac9db Nicholas Bellinger 2010-12-17  470  	struct Scsi_Host *sh = phv->phv_lld_host;
c66ac9db Nicholas Bellinger 2010-12-17  471  	int legacy_mode_enable = 0;
410aeee6 Christoph Hellwig  2012-10-08  472  	int ret;

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--r5Pyd7+fXNt84Ff3
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-410aeee.diff"

diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
index b296508..a30af59 100644
--- a/drivers/target/target_core_pscsi.c
+++ b/drivers/target/target_core_pscsi.c
@@ -461,7 +461,7 @@ static int pscsi_create_type_other(struct se_device *dev,
 	return 0;
 }
 
-int pscsi_configure_device(struct se_device *dev)
+static int pscsi_configure_device(struct se_device *dev)
 {
 	struct se_hba *hba = dev->se_hba;
 	struct pscsi_dev_virt *pdv = PSCSI_DEV(dev);
diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index bcbf035..5145633 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -297,7 +297,7 @@ void transport_register_session(
 }
 EXPORT_SYMBOL(transport_register_session);
 
-void target_release_session(struct kref *kref)
+static void target_release_session(struct kref *kref)
 {
 	struct se_session *se_sess = container_of(kref,
 			struct se_session, sess_kref);

--r5Pyd7+fXNt84Ff3--
