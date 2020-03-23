From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 23 Mar 2020 15:20:06 +0000
Subject: Re: [PATCH] perf cpumap: Use scnprintf instead of snprintf
Message-Id: <8bb4696a-3470-6613-50ce-a002fbce6b23@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200322172523.2677-1-christophe.jaillet@wanadoo.fr>
 <c0441e54a07e424f9646ca232d44e9d8@AcuMS.aculab.com>
In-Reply-To: <c0441e54a07e424f9646ca232d44e9d8@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Laight <David.Laight@ACULAB.COM>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "acme@kernel.org" <acme@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@redhat.com" <jolsa@redhat.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "zhe.he@windriver.com" <zhe.he@windriver.com>, "dzickus@redhat.com" <dzickus@redhat.com>, "jstancek@redhat.com" <jstancek@redhat.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Le 23/03/2020 à 16:11, David Laight a écrit :
> From: Christophe JAILLET
>> Sent: 22 March 2020 17:25
>> 'scnprintf' returns the number of characters written in the output buffer
>> excluding the trailing '\0', instead of the number of characters which
>> would be generated for the given input.
>>
>> Both function return a number of characters, excluding the trailing '\0'.
>> So comparaison to check if it overflows, should be done against max_size-1.
>> Comparaison against max_size can never match.
> NACK.
> Since snprintf() returns the number of characters it would have
> written to an infinite buffer the comparison can 'match'.
>
> However it should test for (ret >= PATH_MAX).

Agreed. I'll send a V2.

CJ

> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
>
