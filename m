From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 16:32:16 +0000
Subject: Re: [PATCH 0/4] char-TPM: Adjustments for ten function implementations
Message-Id: <5cf54c5a-778f-3f00-8772-547785c22009@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net>
 <20171016183139.otyh3m5c5yurtmow@linux.intel.com>
 <20171016183512.3bz6x4b6lbhpbkje@linux.intel.com>
 <20171017085124.pkrjzghcf5wmcydc@mwanda>
 <f9b35a67-bd7f-b140-bdc1-cb4886a6b1ea@users.sourceforge.net>
 <1508255833.3129.33.camel@HansenPartnership.com>
In-Reply-To: <1508255833.3129.33.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Kenneth Goldman <kgold@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?Q?Peter_H=c3=bcwe?= <PeterHuewe@gmx.de>, Stefan Berger <stefanb@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> Fixes is only for bug fixes.  These don't fix any bugs.
>>
>> How do you distinguish these in questionable source code
>> from other error categories or software weaknesses?
> 
> A style change is one that doesn't change the effect of the execution.

This can occasionally be fine, can't it?


>  These don't actually even change the assembly,

How did you check it?

I would expect that there are useful run time effects to consider
for three proposed update steps (in this patch series).


> so there's programmatic proof they're not fixing anything.

I find that the software refactoring “Improve a size determination in nine functions”
should fit to this observation (while the source code can become a bit better).


> Bug means potentially user visible fault.

Thanks for your constructive feedback.

Regards,
Markus
