From: Andi Drebes <lists-receive@programmierforen.de>
Date: Fri, 24 Aug 2007 10:31:52 +0000
Subject: Re: Ideas on column length in kernel "problem"?
Message-Id: <200708241231.52767.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
In-Reply-To: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postfail@hushmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Many free (and not-free) mail clients wordwrap.  Hushmail wraps at 
> 68 (verified), Yahoo has options to wrap at a max of 99, and Gmail 
> was somewhere around 85-90 as I recall.  Not sure on other free / 
> inexpensive clients.  
It happens so often that people send mangled patches that it might be useful 
to create a wiki page or something with the most common email clients and a 
sample configuration that prevents them from mangling patches. Maybe somebody 
feels like doing so in his / her spare time.
 
> However, several code modules have code lines with column lengths 
> well over 80 (the worst I have seen was 211).  This prevents people 
> with "minimal function" email clients (I'm being generous) from 
> making changes in the area of these long code lines, or from even 
> submitting fixes for the line length problem in modules themselves.
I think this is also a matter of conding style. Documentation/CodingStyle 
says:

"The limit on the length of lines is 80 columns and this is a hard limit."

So actually there shouldn't be any line longer than that. Perhaps it would be 
nice to create a patches that shorten the lines and to send them to the 
kernel-janitors ml.

<snip>
> Note -- I am well aware that us 'poor users' could just 'get a real 
> email service', and if anyone knows of a free/inexpensive mail 
> client that will be able to handle the wordwrap requirements for 
> the current state of the linux tree please advise.
see above.

	Cheers,
		Andi
