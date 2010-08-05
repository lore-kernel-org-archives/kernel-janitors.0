From: =?UTF-8?B?SMOla29uIEzDuHZkYWw=?= <hlovdal@gmail.com>
Date: Thu, 05 Aug 2010 11:14:57 +0000
Subject: Re: [PATCH 2/2] kprobes: verify jprobe entry point
Message-Id: <AANLkTikgH3NeWtqDPxu5gRFZUkcphZOLuNuso8AJ0KuT@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
In-Reply-To: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 5 August 2010 11:47, Julia Lawall <julia@diku.dk> wrote:
> On Thu, 5 Aug 2010, walter harms wrote:
>> I am a bit converned about this code here:
>>       if (kallsyms_lookup_size_offset(addr, NULL, &offset) &&  offset = 0)
>>
>> offset is set inside kallsyms_lookup_size_offset(), right ?
>> but can you guarantee that the calling sequence is the same on all processors ?
>> (it is  not in case of functions).
>
> && should always be evaluated lazily from left to right.  Otherwise
> x != NULL && x->y = z wouldn't be safe.
>

The && operator triggers a sequence point.

I do not have access to the standard (ISO/IEC 9899:1990) any longer,
so the following is from a draft (but in case the text changed, there
are no functional differences for this):


2.1.2.3 Program execution
...
At certain specified points in the execution sequence called
sequence points, all side effects of previous evaluations shall
be complete and no side effects of subsequent evaluations
shall have taken place.
...
3.3.13 Logical AND operator
...
Unlike the bitwise binary & operator, the && operator guarantees
left-to-right evaluation; there is a sequence point after the
evaluation of the first operand.


BR Håkon Løvdal
