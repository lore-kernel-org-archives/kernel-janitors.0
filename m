From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 08 May 2019 13:07:16 +0000
Subject: Re: [PATCH] mptsas: fix undefined behaviour of a shift of an int by more than 31 places
Message-Id: <de7e3aaf-0155-5007-c228-510f0d0de428@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190504164010.24937-1-colin.king@canonical.com>
 <1557027274.2821.2.camel@HansenPartnership.com>
In-Reply-To: <1557027274.2821.2.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/05/2019 04:34, James Bottomley wrote:
> On Sat, 2019-05-04 at 17:40 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the shift of int value 1 by more than 31 places can result
>> in undefined behaviour. Fix this by making the 1 a ULL value before
>> the shift operation.
> 
> Fusion SAS is pretty ancient.  I thought the largest one ever produced
> had four phys, so how did you produce the overflow?

This was an issue found by static analysis with Coverity; so I guess
won't happen in the wild, in which case the patch could be ignored.

Colin

> 
> James
> 
