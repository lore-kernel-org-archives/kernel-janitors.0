From: Eliot Blennerhassett <eblennerhassett@audioscience.com>
Date: Wed, 28 Mar 2012 21:43:20 +0000
Subject: Re: [patch] ALSA: asihpi - fix return type of hpios_locked_mem_alloc()
Message-Id: <4F7385F8.4050004@audioscience.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120328065702.GA9113@elgon.mountain>
In-Reply-To: <20120328065702.GA9113@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 29/03/12 03:38, Takashi Iwai wrote:
> At Wed, 28 Mar 2012 09:57:02 +0300,
> Dan Carpenter wrote:
>>
>> This function returns zero or -ENOMEM, but because it's type is u16, the
>> -ENOMEM gets changed to 65524.  None of the callers care, but lets fix
>> it anyway as a cleanup.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Applied it now.  Thanks.

Hmm. I guess it is too late to NAK this change?

I'd prefer changing the return value to HPI_ERROR_MEMORY_ALLOC and
leaving the function signature alone.

Any chance to make this change?

--
Eliot


