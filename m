From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 03 Mar 2005 17:55:02 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <42274F76.7050707@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Nishanth Aravamudan wrote:
> On Thu, Mar 03, 2005 at 06:41:19PM +0200, Alexey Dobriyan wrote:
> 
>>On Wednesday 02 March 2005 11:57, Domen Puncer wrote:
>>
>>
>>>remove_old_strings-drivers_telephony_ixj.patch
>>>  From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
>>>  Subject: [KJ] [PATCH]  ixj* - compile warning cleanup
>>
>>drivers/telephony/ixj.c:6172:11: warning: incorrect type in argument 1 (different address spaces)
>>drivers/telephony/ixj.c:6172:11:    expected char *buf
>>drivers/telephony/ixj.c:6172:11:    got void [noderef] *argp<asn:1>
>>
>>-               if (copy_to_user(argp, ixj_c_revision, strlen(ixj_c_revision)))
>>-                       retval = -EFAULT;
>>+               sprintf(argp, "\nDriver version %i.%i.%i", IXJ_VER_MAJOR, IXJ_VER_MINOR, IXJ_BLD_VER);
>>
>>
>>>int_sleep_on-drivers_cdrom_mcdx.patch
>>>  From: Nishanth Aravamudan <nacc@us.ibm.com>
>>>  Subject: [KJ] [PATCH 16/20] cdrom/mcdx: remove 	interruptible_sleep_on_timeout() usage
>>
>>drivers/cdrom/mcdx.c:844:2: warning: mixing declarations and code
>>drivers/cdrom/mcdx.c: In function `mcdx_delay':
>>drivers/cdrom/mcdx.c:844: warning: ISO C90 forbids mixed declarations and code
> 
> 
> I do not see these compile-time warnings. Admittedly, that warning is
> also rather difficult to justify in the kernel, as code with local
> variables declared in the middle of functions is relatively common :)

but not allowed/desirable in linux kernel...

Probably Alexey is using an older but still supported/allowed gcc
(like 2.9x) and you (Nish) are using 3.4.x or 4.x, where mixed decls
and code are allowed.

> It could just be that I need to modify my gcc flags, though... In any
> case, I'm not sure how big of a problem this is, but of course am
> willing to fix it, if so desired.

It's a problem and should be fixed.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
