From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Thu, 25 May 2017 09:29:49 +0000
Subject: Re: MIPS: Alchemy: Delete an error message for a failed memory allocation in alchemy_pci_probe()
Message-Id: <CAOLZvyGEzzQ_Jvy3NNQqDER4QHe2Dj-Y4sX2MNANo-phXbzQ8g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6ebb5193-239f-5c34-c5f6-2be8a2fa79a5@users.sourceforge.net>
 <CAOLZvyHq-7q0XxiBsyX3q0g0J3kjfFv4SU7amX1hpjRDyK+feQ@mail.gmail.com>
 <796029e7-60a3-a94b-8b5c-4686a0656560@users.sourceforge.net>
 <CAOLZvyH-DF_r77kzcVcn+A-tTov+aNZ1oGNQLnGWXE35UODqtQ@mail.gmail.com> <70394897-a67a-2b49-2d46-a20fb2de51f2@users.sourceforge.net>
In-Reply-To: <70394897-a67a-2b49-2d46-a20fb2de51f2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?B?UmFsZiBCw6RjaGxl?= <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, May 25, 2017 at 8:54 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>> How do you think about to achieve a small code reduction also for this software module?
>>
>> Generally speaking, sure.
>
> Thanks for your interest in such a direction.
>
>
>> But why remove just this one?  Is it because it loosely follows a
>> pattern that was deemed removable in that slidedeck you linked to?
>
> I derived another source code search approach from the implementation
> of the check “OOM_MESSAGE” in the script “checkpatch.pl” for
> the semantic patch language (Coccinelle software).
> The involved search patterns are still evolving and the used lists
> (or regular expressions) for function names where it might make sense
> to reconsider the usage of special logging calls is therefore incomplete.
>
>
>> (the "usb_submit_urb()" part)?
>
> Would you like to extend the function selection for further considerations?
>
>
>>> Do you find information from a Linux allocation failure report sufficient
>>> for such a function implementation?
>>
>> Yes, I wrote that code, and in case this driver doesn't load, I'd like
>> to know precisely where initialization failed.
>> I can happily spare a few bytes for that.
>
> Does this kind of answer contain a bit of contradiction?
>
> * Why do you seem to insist on another message if information from a Linux
>   allocation failure report would be sufficient already also for this
>   software module?
>
> * Do you want that it can become easier to map a position in a backtrace
>   to a place in your source code?

Does kmalloc() nowadays print a message which invocation (source line) failed?
If so I won't be standing in your way, but if not, you need to come up with
something for convincing than answering questions with more questions.

Manuel
