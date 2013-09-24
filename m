From: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue, 24 Sep 2013 20:13:26 +0000
Subject: Re: checkpatch guide for newbies
Message-Id: <CAErSpo4X0-PEYtZrY2r4GKmzTJhHK3eKdXrbccJhB7wVkVCYLA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130923090100.GE6192@mwanda> <CAErSpo5XgvuG=75nExa7yCa7C+Bxhk+1LwruxY8pv2DU+r-_aA@mail.gmail.com>
 <5241CB44.8080004@ahsoftware.de> <CA+MoWDpnNjeEN+Crzh2kQ7DPJ_DqEOP4z-9n3=EqP7hiPgZRXg@mail.gmail.com>
In-Reply-To: <CA+MoWDpnNjeEN+Crzh2kQ7DPJ_DqEOP4z-9n3=EqP7hiPgZRXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Alexander Holler <holler@ahsoftware.de>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 24, 2013 at 1:29 PM, Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
> On Tue, Sep 24, 2013 at 7:26 PM, Alexander Holler <holler@ahsoftware.de> wrote:
>>> On Mon, Sep 23, 2013 at 3:01 AM, Dan Carpenter <dan.carpenter@oracle.com>
>>> wrote:
>>>>
>>>>                  Long Lines
>>>>
>>>> Historically screens were 80 characters wide and it was annoying when
>>>> code went
>>>> over the edge.  These days we have larger screens, but we keep the 80
>>>> character
>>>> limit because it forces us to write simpler code.
>>
>> Sorry, but that just isn't true and never was. Having a line wide limit of
>> 80 characters while forcing tabs to be 8 characters long limits most code to
>> just 72 characters. And even less (max 64) inside constructs like if, for or
>> while.
>>
>> The only outcome of that totally silly rule is that variable names will
>> become shorted to silly acronyms almost nobody does understand make code
>> unreadable.

In the context of a two-sentence paragraph, Dan's original text is
pithy and accurate.  A Wikipedia article would deserve more
elaboration.

Obviously the skill of the programmer is the overwhelming factor, but
I think restricting the line length does help encourage simpler,
better-factored code.  It's also part of the whole "it's better to be
consistent than to be better" thing.  If 95% of the files in Linux use
80-character lines and the remainder use longer lines, it's just an
ongoing hassle for the reader.

>> I always feel like beeing in the IT stone age when programmers thought they
>> have to use variable names like a, b and c to save storage, memory or to
>> type less when reading linux kernel code.
> I was about to disagree because I've never seen variables named a, b
> or c, but I found that there are at least 2238 variables named a, b or
> c in linux-next. This is not good.

That is not self-evident.  In many cases, e.g., loop iterators, simple
names are fine.  Nothing is gained by renaming a loop counter from "a"
to "array_index."  Simple names for simple things help the reader
focus on more important aspects of the code.

Bjorn
