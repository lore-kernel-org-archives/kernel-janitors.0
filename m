From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 12 Jan 2021 10:24:21 +0000
Subject: Re: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in variable ret
Message-Id: <69547a3a-8b58-69cc-af87-fac7b7d03cb4@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210108123546.19601-1-colin.king@canonical.com>
 <20210111163551.GA33269@sirena.org.uk>
 <9bef4fe5-0eed-03f8-9505-909b669ba49b@canonical.com>
 <20210112102204.GG5083@kadam>
In-Reply-To: <20210112102204.GG5083@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, =?UTF-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org

On 12/01/2021 10:22, Dan Carpenter wrote:
> On Mon, Jan 11, 2021 at 05:37:36PM +0000, Colin Ian King wrote:
>> On 11/01/2021 16:35, Mark Brown wrote:
>>> On Fri, Jan 08, 2021 at 12:35:46PM +0000, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> Currently when attempting to start the BE fails because the
>>>> FE is not started the error return variable ret is not initialized
>>>> and garbage is returned.  Fix this by setting it to 0 so the
>>>
>>> This doesn't apply against current code, please check and resend.
>>>
>>
>> Current ASoC tree now has two commits:
>>
>> commit 4eeed5f40354735c4e68e71904db528ed19c9cbb
>> Author: Souptick Joarder <jrdr.linux@gmail.com>
>> Date:   Sat Jan 9 09:15:01 2021 +0530
>>
>>     ASoC: soc-pcm: return correct -ERRNO in failure path
>>
>> commit e91b65b36fde0690f1c694f17dd1b549295464a7
>> Author: Dan Carpenter <dan.carpenter@oracle.com>
>> Date:   Mon Jan 11 12:50:21 2021 +0300
>>
>>     ASoC: soc-pcm: Fix an uninitialized error code
>>
>> ..both set ret to non-zero, which I believe will throw a subsequent
>> warning messagethat's not strictly related.
> 
> My patch restored the original behavior.  And I think that errors should
> return error codes.  What you're saying is basically "Returning an error
> is a bug because it will trigger an error message in the caller".  So
> then we have to have a debate about printks as a layering violation.
> 
> I don't like error messages generally, because I think they make the
> code messy.  A lot of people put error messages for impossible things.
> Or if a kmalloc() fails or whatever.  There are too many error messages
> which people add in an auto-pilot way without considering whether it's
> necessary.
> 
> But some people think, and maybe they're correct, that it's best if
> every function in the call tree prints a message.  That way you can
> trace the error path easily.

+1

Yep, good point, ignore my fix. Thanks Dan for your observations.

> 
> regards,
> dan carpenter
> 
