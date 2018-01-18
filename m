From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 18 Jan 2018 23:35:04 +0000
Subject: Re: [PATCH-next] init/main.c: make local symbol static
Message-Id: <34989256-cac4-05ed-5b74-53a956b89eb2@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118220629.25116-1-chrisadr@gentoo.org>
 <9f473c55-7304-dda3-dea4-2734292927a6@infradead.org>
 <30828c91-a39d-6342-2774-32386baa30b6@amd.com>
 <1516318407.2510.76.camel@gentoo.org>
In-Reply-To: <1516318407.2510.76.camel@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christopher_D=c3=adaz_Riveros?= <chrisadr@gentoo.org>, Tom Lendacky <thomas.lendacky@amd.com>, mingo@kernel.org, akpm@linux-foundation.org, tglx@linutronix.de, keescook@chromium.org, lauraa@codeaurora.org, rostedt@goodmis.org, mhocko@suse.com, tal.shorer@gmail.com, viresh.kumar@linaro.org, lokeshvutla@ti.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/18/2018 03:33 PM, Christopher Díaz Riveros wrote:
> El jue, 18-01-2018 a las 16:31 -0600, Tom Lendacky escribió:
>> On 1/18/2018 4:09 PM, Randy Dunlap wrote:
>>> On 01/18/2018 02:06 PM, Christopher Díaz Riveros wrote:
>>>> Fixes the following sparse warning:
>>>>
>>>> init/main.c:167:12: warning:
>>>>   symbol 'envp_init' was not declared. Should it be static?
>>>>
>>>> Signed-off-by: Christopher Díaz Riveros <chrisadr@gentoo.org>
>>>
>>> Does the kernel build OK after this change?
>>>
> 
> I built it a couple of times before sending the patch, now I compiled
> it again and everything went ok.
> 
>>> What about the other user(s) of envp_init?
>>
>> It looks like it's referenced in init/do_mounts_initrd.c.  Rather
>> than making it static, it should be declared in .h file.
>>

init/Makefile should give you a clue.

> 
> Ok, I'll try to figure it out, akpm accepted the patch in mm-next but
> was dropped because of testing failures. I'm still very new to all of
> this process.


-- 
~Randy
