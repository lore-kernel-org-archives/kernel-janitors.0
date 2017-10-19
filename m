From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Oct 2017 20:44:48 +0000
Subject: Re: char/tpm: Less checks in tpm_ibmvtpm_probe() after error detection
Message-Id: <c1b3b269-46eb-7102-a281-c8f105abdf7e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net>
 <09a2c3a1-1b10-507d-a866-258b570f6da1@users.sourceforge.net>
 <20171019135632.4af42743@kitsune.suse.cz>
 <20171019133646.gu7qv2tywfk4tcxj@mwanda>
In-Reply-To: <20171019133646.gu7qv2tywfk4tcxj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Kenneth Goldman <kgold@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?Q?Peter_H=c3=bcwe?= <PeterHuewe@gmx.de>, Stefan Berger <stefanb@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> If the code doing the allocation is changed in the future the single
>> cleanup can stay whereas multiple labels have to be rewritten again.
> 
> No, they don't unless you choose bad label names.  Perhaps numbered
> labels?  We don't get a lot of those in the kernel any more.  Label
> name should be based on what the label does.  Often I see bad label
> names like generic labels:
> 
> 	foo = kmalloc();
> 	if (!foo)
> 		goto out;
> 
> What is out going to do?  Another common anti-pattern is come-from
> labels:
> 
> 	foo = kmalloc();
> 	if (!foo)
> 		goto kmalloc_failed;
> 
> Obviously, we can see from the if statement that the alloc failed and
> you *just* know the next line is going to be is going to be:
> 
> 	if (invalid)
> 		goto kmalloc_failed;
> 
> Which is wrong because kmalloc didn't fail...  But if the label name is
> based on what it does then, when you add or a remove an allocation, you
> just have to edit the one thing.

Would you be interested in an update on a topic like “Source code review
around jump label usage”?
https://lkml.org/lkml/2015/12/11/378

Regards,
Markus
