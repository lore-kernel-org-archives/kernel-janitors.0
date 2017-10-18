From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Wed, 18 Oct 2017 15:04:36 +0000
Subject: Re: [PATCH 0/4] char-TPM: Adjustments for ten function implementations
Message-Id: <20171018150436.j2uhzxsu4ebjoz3c@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net>
 <20171016183139.otyh3m5c5yurtmow@linux.intel.com>
 <20171016183512.3bz6x4b6lbhpbkje@linux.intel.com>
 <2e5e24b4-ea4d-e43b-22b2-e6b65e7203d2@users.sourceforge.net>
In-Reply-To: <2e5e24b4-ea4d-e43b-22b2-e6b65e7203d2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Kenneth Goldman <kgold@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>, Stefan Berger <stefanb@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Oct 16, 2017 at 10:44:18PM +0200, SF Markus Elfring wrote:
> > A minor complaint: all commits are missing "Fixes:" tag.
> 
> * Do you require it to be added to the commit messages?

I don't require it. It's part of the development process:

https://www.kernel.org/doc/html/v4.12/process/submitting-patches.html

> * Would you like to get a finer patch granularity then?

I don't understand what you are asking.

> * Do you find any more information missing?
> 
> Regards,
> Markus

I think I already answered to this in my earlier responses (commit
messages).

I probably won't take "sizeof(*foo)" type of change even if it
is a recommended style if that is the only useful thing that the
commit does.

/Jarkko
