From: "Arend van Spriel" <arend@broadcom.com>
Date: Thu, 04 Oct 2012 21:10:09 +0000
Subject: Re: [patch 2/3] brcmfmac: fix end of loop check (signedness bug)
Message-Id: <506DFB31.8080208@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003060631.GB3802@elgon.mountain>
 <506DB82B.9010106@broadcom.com> <20121004184212.GO13767@mwanda>
In-Reply-To: <20121004184212.GO13767@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

On 10/04/2012 08:42 PM, Dan Carpenter wrote:
> On Thu, Oct 04, 2012 at 06:24:11PM +0200, Arend van Spriel wrote:
>> On 10/03/2012 08:06 AM, Dan Carpenter wrote:
>>> The problem here is that we loop until "remained_buf_len" is less than
>>> zero, but since it is unsigned, it never is.
>>>
>>> "remained_buf_len" has to be large enough to hold the value from
>>> "mgmt_ie_buf_len".  That variable is type u32, but it only holds small
>>> values so I have changed to both variables to int.
>>>
>>> Also I removed the bogus initialization from "mgmt_ie_buf_len" so that
>>> GCC can detect if it is used unitialized.  I moved the declaration of
>>> "remained_buf_len" closer to where it is used so it's easier to read.
>>>
>>
>> Hi Dan,
>>
>> Good catch. I applied the patch internally on our HEAD and had it
>> reviewed. We did not take moving the declaration as we prefer to
>> have all variables at the top of the function. It makes it easier to
>> find what is declared in a function and whether exceeding the local
>> variable limit mentioned in Chapter 6. Functions of the CodingStyle
>> (we are exceeding it already ;-) ).
>>
>> Are you ok with us submitting it? It would be sent out for 3.8 or do
>> you prefer to have it fixed in 3.7?
>
> Uh, I don't know how hard it is to trigger this bug.  If it's
> impossible to trigger then we could wait until 3.8 otherwise I
> would tend to merge it into 3.7 given that we haven't hit -rc1 yet.

Hi Dan,

I don't know either, but to safe myself the trouble I will post it to 
John for 3.7. Thanks.

Gr. AvS


