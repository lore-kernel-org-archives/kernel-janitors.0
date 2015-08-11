From: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Date: Tue, 11 Aug 2015 04:57:04 +0000
Subject: Re: [linuxwifi] [patch] iwlwifi: mvm: fix a range check in debugfs code
Message-Id: <0BA3FCBA62E2DC44AF3030971E174FB32E7E7D52@hasmsx107.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150810214503.GC31724@mwanda>
In-Reply-To: <20150810214503.GC31724@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan

On 08/11/2015 12:45 AM, Dan Carpenter wrote:
> The &mvm->tof_data.range_req.ap[] array has IWL_MVM_TOF_MAX_APS elements
> so the check should be >= instead of >.  Also the test can underflow so
> I have changed "i" to unsigned.
> 
> Fixes: ce7929186a39 ('wlwifi: mvm: add basic Time of Flight (802.11mc FTM) support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Thanks - I added it in our internal tree.
