From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Wed, 10 Oct 2012 01:25:30 +0000
Subject: Re: [target:queue 47/51] drivers/target/target_core_pscsi.c:464:5: sparse: symbol 'pscsi_configure_d
Message-Id: <1349832330.3776.249.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121009233020.GC9331@localhost>
In-Reply-To: <20121009233020.GC9331@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2012-10-10 at 07:30 +0800, Fengguang Wu wrote:
> Hi Nicholas, Christoph,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git queue
> head:   738b86ac5e56c645aa5b7bf49cb38e2a04c665f8
> commit: 410aeee637c47bcf7e8dd7893347fe0811e07ab1 [47/51] target: kill struct se_subsystem_dev
> 
> 
> vim +464 drivers/target/target_core_pscsi.c
> 
> 410aeee6 Christoph Hellwig  2012-10-08 @464  int pscsi_configure_device(struct se_device *dev)
> c66ac9db Nicholas Bellinger 2010-12-17  465  {
> 410aeee6 Christoph Hellwig  2012-10-08  466  	struct se_hba *hba = dev->se_hba;
> 410aeee6 Christoph Hellwig  2012-10-08  467  	struct pscsi_dev_virt *pdv = PSCSI_DEV(dev);
> c66ac9db Nicholas Bellinger 2010-12-17  468  	struct scsi_device *sd;
> 410aeee6 Christoph Hellwig  2012-10-08  469  	struct pscsi_hba_virt *phv = dev->se_hba->hba_ptr;
> c66ac9db Nicholas Bellinger 2010-12-17  470  	struct Scsi_Host *sh = phv->phv_lld_host;
> c66ac9db Nicholas Bellinger 2010-12-17  471  	int legacy_mode_enable = 0;
> 410aeee6 Christoph Hellwig  2012-10-08  472  	int ret;
> 
> Please consider folding the attached diff :-)
> 

Applied to target-pending/queue for v3.8-rc code.

Thanks Wu !

> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation

