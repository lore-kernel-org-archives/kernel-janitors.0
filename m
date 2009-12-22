From: David Vrabel <david.vrabel@csr.com>
Date: Tue, 22 Dec 2009 12:26:08 +0000
Subject: Re: [PATCH] MAINTAINERS: Fix entry for uwb to include subdirectories
Message-Id: <4B30BAE0.5040700@csr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261472760-24854-1-git-send-email-peterhuewe@gmx.de> <1261473735.1895.22.camel@Joe-Laptop.home>
In-Reply-To: <1261473735.1895.22.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

Joe Perches wrote:
> On Tue, 2009-12-22 at 10:05 +0100, Peter Huewe wrote:
>> This little patch removes the asterisk wildcard, in order to get the uwb
>> maintainer when using get_maintainer.pl on anyfiles in the
>> subdirectories of uwb.
> 
> Is this correct?
> Does David Vrabel maintain drivers/uwb/i1480/ ?

Yes, it's basically obsolete hardware that Intel no longer develops
which is why it doesn't see many changes.  I'd just delete it except
there's a few people actually using it.

Neither the UWB or WLP maintainer entries are completely correct.  I'll
fix them up.

David
-- 
David Vrabel, Senior Software Engineer, Drivers
CSR, Churchill House, Cambridge Business Park,  Tel: +44 (0)1223 692562
Cowley Road, Cambridge, CB4 0WZ                 http://www.csr.com/


Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
