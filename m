From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 16 Oct 2015 20:05:55 +0000
Subject: Re: [PATCH v2] powerpc/mpc5xxx: Avoid dereferencing potentially freed memory
Message-Id: <562158A3.90000@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151014040011.8AB1514110A@ozlabs.org>
 <1444888580-12966-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1444890977.5970.4.camel@ellerman.id.au> <5620971D.8040103@wanadoo.fr>
 <1444988979.12954.1.camel@ellerman.id.au>
In-Reply-To: <1444988979.12954.1.camel@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 16/10/2015 11:49, Michael Ellerman a écrit :
> On Fri, 2015-10-16 at 08:20 +0200, Christophe JAILLET wrote:
>> Le 15/10/2015 08:36, Michael Ellerman a écrit :
>>> On Thu, 2015-10-15 at 07:56 +0200, Christophe JAILLET wrote:
>>>> Use 'of_property_read_u32()' instead of
>>>> 'of_get_property()'+pointer
>>>> dereference in order to avoid access to potentially freed memory.
>>>>
>>>> Use 'of_get_next_parent()' to simplify the while() loop and avoid
>>>> the
>>>> need of a temp variable.
>>>>
>>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>>> ---
>>>> v2: Use of_property_read_u32 instead of of_get_property+pointer
>>>> dereference
>>>> *** Untested ***
>>> Thanks.
>>>
>>> Can someone with an mpc5xxx test this?
>> Hi,
>> I don't think it is an issue, but while looking at another similar
>> patch, I noticed that the proposed patch adds a call to
>> be32_to_cpup()
>> (within of_property_read_u32).
>> Apparently, powerPC is a BE architecture, so this call should be a no
>> -op.
>>
>> Just wanted to point it out, in case of.
> Hi Christoph,
>
> I'm not sure I follow.
>
> The device tree is always big endian, but of_property_read_u32() does
> the
> conversion to CPU endian for you already. That is one of the advantages
> of
> using it.
>
> cheers
>

Hi,
sorry if un-clear.

What I mean is that in the patch related 
'powerpc/sysdev/mpc5xxx_clocks.c', there was no call to 'be32_to_cpup'.
So in the proposed patch, 'of_property_read_u32' adds it.

While in the patch against 'powerpc/kernel/prom.c', 'be32_to_cpup' was 
called explicitly.
So using 'of_property_read_u32' keep the same logic.


Basically the code from 'mpc5xxx_clocks.c' and from 'prom.c' were 
written the same way. I found spurious that a call to 'be32_to_cpup' was 
done in only one case.
Maybe, it was a missing in 'mpc5xxx_clocks.c'.


I don't know if it can be an issue or not. I just find it 'strange'.


CJ


