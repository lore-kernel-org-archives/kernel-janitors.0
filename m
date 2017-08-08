From: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 08 Aug 2017 02:13:12 +0000
Subject: Re: block/ps3vram: Delete an error message for a failed memory allocation in ps3vram_cache_init()
Message-Id: <87shh2olhj.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e22ee16a-5f34-46bd-577f-9b7ca75e9035@users.sourceforge.net>
 <b6b5f2f0-bbfe-8471-d8fc-e236ea0b1ea4@infradead.org>
 <dd16f28c-1613-cfb2-5349-07aaac2f2f5a@users.sourceforge.net>
 <8d140d00-935c-da0a-ff2e-167abe642bda@infradead.org>
 <32cdcd8a-1000-223c-71da-4c9119954d4e@users.sourceforge.net>
 <3a657b44-2bc8-ee05-3a42-db7af354967e@infradead.org>
 <57b472a0-0245-f821-cea8-171c34cc9df7@users.sourceforge.net>
In-Reply-To: <57b472a0-0245-f821-cea8-171c34cc9df7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

SF Markus Elfring <elfring@users.sourceforge.net> writes:

>>>> I didn't consider one would be triggered by the kzalloc failure.
>>>
>>> Do you reconsider any special system settings for further
>>> software evolution then?
>> 
>> Sorry, I don't quite understand your question.
>
> Do you try to configure the Linux error reporting to any special needs?
>
>
>> I think your original patch is OK,
>
> How does this feedback fit to the initial response “Not Applicable”?
> https://patchwork.ozlabs.org/patch/798575/

That comes from me, and means "I can't apply this patch", because it's
not a powerpc patch.

Looking at the maintainers output though maybe that is meant to go via
the powerpc tree.

cheers
