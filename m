From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Mon, 05 Dec 2005 17:12:59 +0000
Subject: Re: [KJ] [PATCH 1/21] polling loops: change exit condition
Message-Id: <4394751B.3080701@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43923469.3090808@gmail.com>
In-Reply-To: <43923469.3090808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Nishanth Aravamudan wrote:
>>>here is the first part of patch which changes many polling loops to use
>>>jiffies and time_after / time_before instead of counters
>>>most of the changes are in drivers directory (except first patch)
>>>as it is my first patch for linux kernel, feel free to point out any
>>>mistake you'll find
>>
>>Hmm, what happened to the poll_event API that Nish had suggested
>>some time ago for this problem? Was there an actual reason against
>>merging it or did the patch just get lost?
> 
> 
> A good question. I'll try to dig up my patch from my old machine and
> take a look if it can be used instead of all these changes.
i think you ment "with", not "instead" ;)
in my ("kernel newbie" ;) humble opinion these macros make code harder
too read

(last version of your patch i found is here: 
http://lists.osdl.org/pipermail/kernel-janitors/2005-March/003699.html)

regards,
Marcin
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
