From: Paul Moore <paul@paul-moore.com>
Date: Sat, 01 Apr 2017 14:52:26 +0000
Subject: Re: selinux: Fix an uninitialized variable bug in range_read()
Message-Id: <CAHC9VhT8nXOPpOy5sRpRYjVnj2oOgFGAzibgkj_ZpK7xyg35qg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170331152118.GA8141@mwanda>
	<1490975541.31110.12.camel@tycho.nsa.gov>
	<CAHC9VhT7njoVyHgyiTQhCcvZEYrTE_XZRLxT4+JJPiH3W88AUw@mail.gmail.com>
	<fb1cb81c-4b03-5b21-f933-ea3e58491a13@users.sourceforge.net>
In-Reply-To: <fb1cb81c-4b03-5b21-f933-ea3e58491a13@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-security-module@vger.kernel.org

On Sat, Apr 1, 2017 at 2:40 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>>> We removed this initialization as a cleanup but it is probably
>>>> required.
>>>>
>>>> The concern is that "nel" can be zero.  I'm not an expert on SELinux
>>>> code but I think it looks possible to write an SELinux policy which
>>>> triggers this bug.  GCC doesn't catch this, but my static checker
>>>> does.
>>>>
>>>> Fixes: 9c312e79d6af ("selinux: Delete an unnecessary variable
>>>> initialisation in range_read()")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> Nice catch, thanks!
>>>
>>> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
>>
>> Yes, indeed.  Thanks Dan, I should have caught this when merging Markus' patch.
>
> How do you think about the possibility to call the function “range_read” only with
> a system configuration where the interface “le32_to_cpu” will be resolved to
> a positive value so that statements in the corresponding for loop will be executed
> at least once?

I suggest we leave this as-is for the moment.

-- 
paul moore
www.paul-moore.com
