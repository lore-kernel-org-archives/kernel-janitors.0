From: Roel Kluin <12o3l@tiscali.nl>
Date: Wed, 23 Apr 2008 19:36:23 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480F8FB7.9090006@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Julia Lawall wrote:
>> I noted you had more results in the same files. Is there a difference
>> in results when you remove the asterisks before the expression?
> 
> Actually, I'm a little puzzled by your results.  None of your files seem 
> to be in my output (based on a check of a few examples), but that is 
> normal because you consider many other types.  But none of my files are in 
> your output either.  Did you just remove them to avoid being redundant, or 
> is your rule overlooking the simple unsigned int case?

These are only the results with unsigned typedefs. I removed the previous.
of the unsigned and unsigned long there were few that were not in your
results.

> I might have gotten a few more examples because of using the options 
> -all_includes -I ./include.  The it takes into account more include files, 
> and thus has a better chance of finding structure fields that have an 
> unsigned int type.  But that doesn't seem to account for the difference.

Ok, thanks, I'll try that too.

> julia

To answer your other question: I'm already posting patches for the ones that
should be fixed. Patches that fix things are always welcome.

Regards,

Roel Kluin
