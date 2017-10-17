From: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 17 Oct 2017 12:26:47 +0000
Subject: Re: [PATCH 0/4] char-TPM: Adjustments for ten function implementations
Message-Id: <87tvyyhse0.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net> <20171016183139.otyh3m5c5yurtmow@linux.intel.com> <20171016183512.3bz6x4b6lbhpbkje@linux.intel.com> <20171017085124.pkrjzghcf5wmcydc@mwanda> <alpine.DEB.2.20.1710171055100.5035@hadrien> <20171017094434.csarc5fw5d32u64w@mwanda>
In-Reply-To: <20171017094434.csarc5fw5d32u64w@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, SF Markus Elfring <elfring@users.sourceforge.net>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Kenneth Goldman <kgold@linux.vnet.ibm.com>, Nayna Jain <nayna@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Peter =?utf-8?Q?H=C3=BCwe?= <PeterHuewe@gmx.de>, Stefan Berger <stefanb@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Tue, Oct 17, 2017 at 10:56:42AM +0200, Julia Lawall wrote:
>> 
>> 
>> On Tue, 17 Oct 2017, Dan Carpenter wrote:
>> 
>> > On Mon, Oct 16, 2017 at 09:35:12PM +0300, Jarkko Sakkinen wrote:
>> > >
>> > > A minor complaint: all commits are missing "Fixes:" tag.
>> > >
>> >
>> > Fixes is only for bug fixes.  These don't fix any bugs.
>> 
>> 0-day seems to put Fixes for everything.  Should they be removed when the
>> old code is undesirable but doesn't actually cause a crash, eg out of date
>> API.
>
> Yeah, I feel like Fixes tags don't belong for API updates and cleanups.

I try to use the criteria of "if someone had backported commit A, would
they also want commit B" (where B Fixes: A).

So it's a bit broader than just "A had a *bug*" and this is the fix.

That's obviously still a bit of a slippery slope, but somewhat helpful I
think. eg, pretty much no one is interested in backporting spelling
fixes, so those aren't Fixes.

And generally people aren't interested in backporting commits like these
ones that just update coding style.

cheers
