From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Tue, 17 Oct 2017 15:57:13 +0000
Subject: Re: [PATCH 0/4] char-TPM: Adjustments for ten function implementations
Message-Id: <1508255833.3129.33.camel@HansenPartnership.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net>
 <20171016183139.otyh3m5c5yurtmow@linux.intel.com>
 <20171016183512.3bz6x4b6lbhpbkje@linux.intel.com>
 <20171017085124.pkrjzghcf5wmcydc@mwanda>
 <f9b35a67-bd7f-b140-bdc1-cb4886a6b1ea@users.sourceforge.net>
In-Reply-To: <f9b35a67-bd7f-b140-bdc1-cb4886a6b1ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Dan Carpenter <dan.carpenter@oracle.com>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Kenneth Goldman <kgold@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Peter =?ISO-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>, Stefan Berger <stefanb@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2017-10-17 at 11:25 +0200, SF Markus Elfring wrote:
> > 
> > Fixes is only for bug fixes.  These don't fix any bugs.
> 
> How do you distinguish these in questionable source code
> from other error categories or software weaknesses?

A style change is one that doesn't change the effect of the execution.
 These don't actually even change the assembly, so there's programmatic
proof they're not fixing anything.

Bug means potentially user visible fault.  In any bug fix commit you
should document the fault and its effects on users so those backporting
can decide if they care or not.

James

