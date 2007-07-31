From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 31 Jul 2007 12:04:42 +0000
Subject: Re: [PATCH 06/68] 0 -> NULL, for arch/frv
Message-Id: <46AF255A.4050106@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17167@ifs.emn.fr> <22618.1185531297@redhat.com>	 <87lkd29mk9.fsf@wanadoo.fr>	 <200707272138.23323.rgetz@blackfin.uclinux.org> <8bd0f97a0707271837q5d5f31d9pe342e72ebf9368c1@mail.gmail.com>
In-Reply-To: <8bd0f97a0707271837q5d5f31d9pe342e72ebf9368c1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, Yoann Padioleau <padator@wanadoo.fr>, David Howells <dhowells@redhat.com>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Mike Frysinger wrote:
> On 7/27/07, Robin Getz <rgetz@blackfin.uclinux.org> wrote:
>   
>> If there is a definite style or semantic preference that everyone should live
>> with - does it make sense to put checks in checkpatch.pl to enforce it?
>>     
>
> checkpatch.pl does not have enough semantic knowledge to know if the
> thing being tested is a pointer ... dont know if the sparse utility
> would be able to pick it out as i'm not familiar with what level that
> thing runs at
>   
Didn't he mean "x = NULL" > "!x"?

Richard Knutsson
(wrote this offline so if someone has already reply, then sorry about 
the noise)


