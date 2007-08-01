From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 01 Aug 2007 10:38:39 +0000
Subject: Re: [PATCH 06/68] 0 -> NULL, for arch/frv
Message-Id: <46B062AF.1040907@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17167@ifs.emn.fr> <22618.1185531297@redhat.com>	 <87lkd29mk9.fsf@wanadoo.fr>	 <200707272138.23323.rgetz@blackfin.uclinux.org>	 <8bd0f97a0707271837q5d5f31d9pe342e72ebf9368c1@mail.gmail.com>	 <46AF255A.4050106@student.ltu.se> <8bd0f97a0708010303j7f443b06lf9d77f6d36816237@mail.gmail.com>
In-Reply-To: <8bd0f97a0708010303j7f443b06lf9d77f6d36816237@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, Yoann Padioleau <padator@wanadoo.fr>, David Howells <dhowells@redhat.com>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Mike Frysinger wrote:
> On 7/31/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
>   
>> Mike Frysinger wrote:
>>     
>>> On 7/27/07, Robin Getz <rgetz@blackfin.uclinux.org> wrote:
>>>       
>>>> If there is a definite style or semantic preference that everyone should live
>>>> with - does it make sense to put checks in checkpatch.pl to enforce it?
>>>>         
>>> checkpatch.pl does not have enough semantic knowledge to know if the
>>> thing being tested is a pointer ... dont know if the sparse utility
>>> would be able to pick it out as i'm not familiar with what level that
>>> thing runs at
>>>       
>> Didn't he mean "x = NULL" > "!x"?
>>     
>
> i'm sure i understand your meaning of ">" ... are you saying that "x
> = NULL" is greater (preferred) to "!x" or are you saying that "x =
> NULL" should be changed to "!x" ?
>   
If I understood Robin correctly, he suggested that checkpatch.pl would 
tell to convert "x = NULL" to "!x", if that would be the preferred way.
> i dont think the former case can be checked by checkpatch.pl, but the
> latter certainly can ... but i'd be very skeptical you could get the
> wider LKML audience to sign off one way or the other wrt to "x =
> NULL" vs "!x".  you can certainly get people to sign off on "x = 0"
> being wrong when x is a pointer.
>   
I agree!
BTW, too bad checkpatch.pl does not know the types, since it otherwise 
could check for the "x [=!]= 0"-thing.

Richard Knutsson

