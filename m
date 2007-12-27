From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Thu, 27 Dec 2007 01:44:33 +0000
Subject: Re: [PATCH 1/3] arch/x86: Use offsetof
Message-Id: <Pine.LNX.4.64.0712270243370.32714@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0712261712450.1185@pc-041.diku.dk>
 <20071226194718.GB8844@elf.ucw.cz> <4772F972.7070802@zytor.com>
In-Reply-To: <4772F972.7070802@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pavel Machek <pavel@ucw.cz>, Julia Lawall <julia@diku.dk>, tglx@linutronix.de, viro@ftp.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On Dec 26 2007 17:01, H. Peter Anvin wrote:
>> > @@ -215,7 +215,9 @@ asmlinkage int sys_vm86old(struct pt_reg
>> >   ret = -EFAULT;
>> >   if (tmp)
>> > 		goto out;
>> > -	memset(&info.vm86plus, 0, (int)&info.regs32 - (int)&info.vm86plus);
>> > +	memset(&info.vm86plus, 0,
>> > +	       offsetof(struct kernel_vm86_struct, regs32) -
>> > +	       offsetof(struct kernel_vm86_struct, vm86plus));
>> 
>> I do not think this makes it more readable... (int) -> (char *) would
>> make it portable and readable, AFAICT.
>>         Pavel
>
> The right way to do it is:
>
> 	memset(&info.vm86plus, 0, sizeof info.vm86plus);

Either way, downcasting a pointer to (int) is dangerous,
even if this one occurrence happens to be in 32-bit-only code.
