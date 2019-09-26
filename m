From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Thu, 26 Sep 2019 07:08:14 +0000
Subject: Re: [PATCH] bnvdimm/namsepace: Don't set claim_class on error
Message-Id: <fe170e53-92d1-eca8-d419-1a4210cb7313@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925181056.11097-1-ira.weiny@intel.com>
 <ff7ff4f5b4289d189a7c347591a5c35876ea804f.camel@intel.com>
 <20190925184939.GA11669@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20190925184939.GA11669@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ira Weiny <ira.weiny@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>

On 25/09/2019 20:49, Ira Weiny wrote:
>>>
>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>>> ---
>>>  drivers/nvdimm/namespace_devs.c | 19 +++++++++----------
>>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> One minor nit below, but otherwise it looks good to me:
>> Reviewed-by: Vishal Verma <vishal.l.verma@intel.com>

Another minor nit, the Subject says:
"bnvdimm/namsepace: Don't set claim_class on error"

a.k.a missing the 'li' part of libnvdimm

-- 
Johannes Thumshirn                            SUSE Labs Filesystems
jthumshirn@suse.de                                +49 911 74053 689
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 Nürnberg
Germany
(HRB 247165, AG München)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
