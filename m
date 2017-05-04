From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 20:48:10 +0000
Subject: Re: [PATCH 7/9] drm/i915: Combine substrings for a message in gen6_drpc_info()
Message-Id: <afe761e4-02f0-2218-fc61-f44c8e041f49@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
 <da7e1514-a1d0-289d-e697-10df1bc7ed0b@users.sourceforge.net>
 <20170504201232.GM24019@nuc-i3427.alporthouse.com>
In-Reply-To: <20170504201232.GM24019@nuc-i3427.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -1529,8 +1529,8 @@ static int gen6_drpc_info(struct seq_file *m)
>>  
>>  	forcewake_count = READ_ONCE(dev_priv->uncore.fw_domain[FW_DOMAIN_ID_RENDER].wake_count);
>>  	if (forcewake_count) {
>> -		seq_puts(m, "RC information inaccurate because somebody "
>> -			    "holds a forcewake reference \n");
>> +		seq_puts(m,
>> +			 "RC information inaccurate because somebody holds a forcewake reference.\n");
> 
> And now you break the 80col rule. Blind adherence to checkpatch is impossible.

Have you got any other coding style preferences around the grepping
of longer message strings from such source code?

Regards,
Markus
