From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 30 Dec 2007 13:54:58 +0000
Subject: Re: [PATCH 1/3] arch/x86: Use offsetof
Message-Id: <20071230135458.GB21106@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0712261712450.1185@pc-041.diku.dk> <20071226194718.GB8844@elf.ucw.cz> <4772F972.7070802@zytor.com> <20071227011712.GG27894@ZenIV.linux.org.uk> <4772FE1E.3040401@zytor.com>
In-Reply-To: <4772FE1E.3040401@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Pavel Machek <pavel@ucw.cz>, Julia Lawall <julia@diku.dk>, tglx@linutronix.de, viro@ftp.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* H. Peter Anvin <hpa@zytor.com> wrote:

>>> The right way to do it is:
>>>
>>> 	memset(&info.vm86plus, 0, sizeof info.vm86plus);
>>
>> If it's just one field _and_ we don't have padding we want to zero out -
>> certainly...
>
> It is - [comments removed for clarity]:
>
> struct kernel_vm86_struct {
>         struct kernel_vm86_regs regs;
> #define VM86_TSS_ESP0 flags
>         unsigned long flags;
>         unsigned long screen_bitmap;
>         unsigned long cpu_type;
>         struct revectored_struct int_revectored;
>         struct revectored_struct int21_revectored;
>         struct vm86plus_info_struct vm86plus;
>         struct pt_regs *regs32;
> };

hm, i'm wondering why it was done in such a complex way. Clearing a 
struct field is always done via sizeof. Maybe we lost some alignment 
assumption somewhere along the line?

	Ingo
