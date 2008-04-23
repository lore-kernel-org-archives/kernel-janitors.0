From: Julia Lawall <julia@diku.dk>
Date: Wed, 23 Apr 2008 19:12:26 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.64.0804232108450.13226@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> I noted you had more results in the same files. Is there a difference
> in results when you remove the asterisks before the expression?

Actually, I'm a little puzzled by your results.  None of your files seem 
to be in my output (based on a check of a few examples), but that is 
normal because you consider many other types.  But none of my files are in 
your output either.  Did you just remove them to avoid being redundant, or 
is your rule overlooking the simple unsigned int case?

I might have gotten a few more examples because of using the options 
-all_includes -I ./include.  The it takes into account more include files, 
and thus has a better chance of finding structure fields that have an 
unsigned int type.  But that doesn't seem to account for the difference.

julia

