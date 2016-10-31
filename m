From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 31 Oct 2016 09:50:12 +0000
Subject: Re: [PATCH] cxl: Fix error handling
Message-Id: <87vaw826gb.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030213451.24624-1-christophe.jaillet@wanadoo.fr>
 <e6e4eb09-28d1-ad7c-6ab3-8e954c27ed23@au1.ibm.com>
In-Reply-To: <e6e4eb09-28d1-ad7c-6ab3-8e954c27ed23@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Andrew Donnellan <andrew.donnellan@au1.ibm.com> writes:

> On 31/10/16 08:34, Christophe JAILLET wrote:
>> 'cxl_dev_context_init()' returns an error pointer in case of error, not
>> NULL. So test it with IS_ERR.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
>
>> ---
>> un-compiled because I don't have the required  cross build environment.
>
> Builds fine here.
>
> In future, you might want to bundle all 3 of your patches either into 1 
> patch (while they are changes which can be done separately, it's all 
> fixes to one type of problem in relation to one function, so personally 
> I'm okay with that) or send it as a series, so that it's clear to 
> everyone that they're all related fixes.

> Additionally, having the same patch subject line for two patches sent in 
> short succession is a bit confusing - in future, try and avoid that.

Yeah. I actually assumed it was two versions of the same patch.

cheers
