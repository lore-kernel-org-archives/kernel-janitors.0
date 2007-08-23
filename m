From: Adrian Bunk <bunk@kernel.org>
Date: Thu, 23 Aug 2007 04:05:04 +0000
Subject: Re: Ideas on column length in kernel "problem"?
Message-Id: <20070823040504.GM30705@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
In-Reply-To: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Thompson <postfail@hushmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 22, 2007 at 11:54:41PM -0400, Scott Thompson wrote:
> I haven't seen any recent solutions to this "problem"...
> 
> Many free (and not-free) mail clients wordwrap.  Hushmail wraps at 
> 68 (verified), Yahoo has options to wrap at a max of 99, and Gmail 
> was somewhere around 85-90 as I recall.  Not sure on other free / 
> inexpensive clients.  
> 
> However, several code modules have code lines with column lengths 
> well over 80 (the worst I have seen was 211).  This prevents people 
> with "minimal function" email clients (I'm being generous) from 
> making changes in the area of these long code lines, or from even 
> submitting fixes for the line length problem in modules themselves.
> 
> I don't have an easy solution short of finding volunteer(s) who can 
> submit patches to resolve this or peer-pressuring module owners 
> into resolving, so opening this issue up to the list for ideas 
> here.  In the meantime I'll run a quick review to assess just how 
> many changes this would be ...

Most people get it right, so there must be a solution available that
doesn't involve changing the kernel. ;-)

Most likely the problem is that you cut'n'paste your patches into your  
email client (or the editor your email client opens). If your client has 
some "Insert File" functionality use this instead.

> Note -- I am well aware that us 'poor users' could just 'get a real 
> email service', and if anyone knows of a free/inexpensive mail 
> client that will be able to handle the wordwrap requirements for 
> the current state of the linux tree please advise.

Open source email clients I have personally used to send patches are 
(al)pine with the included pico as editor and mutt with nano as editor, 
but it might be harder to find ones that don't work than ones that do 
work...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

