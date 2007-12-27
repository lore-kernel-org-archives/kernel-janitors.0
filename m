From: "H. Peter Anvin" <hpa@zytor.com>
Date: Thu, 27 Dec 2007 01:21:34 +0000
Subject: Re: [PATCH 1/3] arch/x86: Use offsetof
Message-Id: <4772FE1E.3040401@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0712261712450.1185@pc-041.diku.dk> <20071226194718.GB8844@elf.ucw.cz> <4772F972.7070802@zytor.com> <20071227011712.GG27894@ZenIV.linux.org.uk>
In-Reply-To: <20071227011712.GG27894@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Julia Lawall <julia@diku.dk>, tglx@linutronix.de, viro@ftp.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Al Viro wrote:
> On Wed, Dec 26, 2007 at 05:01:38PM -0800, H. Peter Anvin wrote:
> 
>> The right way to do it is:
>>
>> 	memset(&info.vm86plus, 0, sizeof info.vm86plus);
> 
> If it's just one field _and_ we don't have padding we want to zero out -
> certainly...

It is - [comments removed for clarity]:

struct kernel_vm86_struct {
         struct kernel_vm86_regs regs;
#define VM86_TSS_ESP0 flags
         unsigned long flags;
         unsigned long screen_bitmap;
         unsigned long cpu_type;
         struct revectored_struct int_revectored;
         struct revectored_struct int21_revectored;
         struct vm86plus_info_struct vm86plus;
         struct pt_regs *regs32;
};
