From: "H. Peter Anvin" <hpa@zytor.com>
Date: Sun, 29 Mar 2009 22:10:46 +0000
Subject: Re: [PATCH 1/2] x86: Add getter/setter static inlines for x86 	descriptors
Message-Id: <49CFF1E6.3020301@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1238361501.git.ice799@gmail.com>	 <76c37743d20e5737eadc747cbdddbc2beb11f074.1238361501.git.ice799@gmail.com>	 <49CFE7E0.80500@zytor.com> <3605561d0903291450v516a7e9csaff4309c0cacb121@mail.gmail.com>
In-Reply-To: <3605561d0903291450v516a7e9csaff4309c0cacb121@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Damato <ice799@gmail.com>
Cc: linux-x86_64@vger.kernel.org, w@1wt.eu, mingo@elte.hu, jeremy@goop.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Joe Damato wrote:
>>
>> This is a serious question.  The x86 descriptors are so complex that
>> it's not clear to me that this restriction makes the code any more
>> clear.  Especially not with things like:
>>
>> -               cpu->arch.gdt[i].b |= 0x00000100;
>> +               desc_set_hi(tmp,  desc_get_hi(tmp) | 0x00000100);
>>
>> This isn't an improvement.  If you're doing to so something like this,
>> you need to actually implement the *intent* here.
> 
> Hi -
> 
> In my first patch set several months ago I replaced the structure
> desc_struct with bit fields that exposed the fields for IDT/LDT/TSS
> entries. This patch set was rejected for several reasons, one of which
> was that Linux is trying to move away from bit fields. I also received
> other comments such as "take a smaller bite", etc.
> 
> So instead of the bit fields, I implemented static inline
> getters/setters. I thought that this small change would be a good
> first step to re-test the waters of submitting patches to the kernel
> before I started to clean out more pieces of the x86 architecture
> specific code.
> 
> I agree that this isn't very clear, but from comments I received on my
> first set, I assumed that this was closer to what people wanted to see
> in the kernel. I am happy to iterate and submit something better, but
> I am clearly misunderstanding what people would like to see.
> 
> Any suggestions on how this first-timer can help are greatly appreciated.
> 

If you're going to implement get/set then you need getters and setters
that make sense.  Now, doing something like that might be acceptable as
part of a larger patchset (which is one way to "take smaller bites"),
but the above is just gratuitous obfuscation, since it leaves in place
the ugliest part of it all, which is the magic constant 0x00000100.

Personally, I would be just as happy treating the descriptor as an u64
and explicitly do shifts and masks with well-defined constants.  It's
the magic constants that suck.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

