From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 18:41:04 +0000
Subject: Re: char/tpm: Improve a size determination in nine functions
Message-Id: <9689f036-ba9f-d23b-cf89-c289bc308771@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net>
 <83a166af-aecc-649d-dfe3-a72245345209@users.sourceforge.net>
 <1508238182.16112.475.camel@linux.intel.com>
 <c8d37c0407a949c1abb35cfd79c17f58@infineon.com>
 <1508244757.4234.60.camel@linux.vnet.ibm.com>
 <alpine.DEB.2.20.1710171456360.5035@hadrien>
 <1508253453.4234.81.camel@linux.vnet.ibm.com>
In-Reply-To: <1508253453.4234.81.camel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, Alexander Steffen <Alexander.Steffen@infineon.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Kenneth Goldman <kgold@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?Q?Peter_H=c3=bcwe?= <PeterHuewe@gmx.de>, Stefan Berger <stefanb@linux.vnet.ibm.com>

>> 	p = kmalloc(sizeof(*p), ...);
>>
>> The alternative form where struct name is spelled out hurts readability and
>> introduces an opportunity for a bug when the pointer variable type is changed
>> but the corresponding sizeof that is passed to a memory allocator is not.
> 
> True, thanks for the reminder.

Will it trigger further software development considerations (besides my contributions)?


> Is this common in new code?

Do you start an official survey here?


> Is there a script/ or some other automated way of catching this usage

Yes. - I am using an approach for the semantic patch language.   ;-)


> before patches are upstreamed?

I imagine that a corresponding source code analysis variant could be applied
in more cases if sufficient acceptance could be achieved.


> Just as you're doing here, the patch description should reference this
> in the patch description.

Do you find my wording “This issue was detected by using the Coccinelle software.” insufficient?

Regards,
Markus
