From: Julia Lawall <julia@diku.dk>
Date: Thu, 29 Jul 2010 08:56:21 +0000
Subject: Re: [Cocci] correct handling of return values
Message-Id: <Pine.LNX.4.64.1007291052410.18192@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C51394B.2060306@users.sourceforge.net>
In-Reply-To: <4C51394B.2060306@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 29 Jul 2010, SF Markus Elfring wrote:

> > I'm currently working on this task:
> > http://kernelnewbies.org/KernelJanitors/Todo/ReturnCodes
> > 
> > I think this task can be partly done with coccinelle. The most often cases of
> > invalid handling is no handling :)
> > 
> > I am not guru of coccinelle, but I think it is very useful here. So,
> > I've written basic script of finding common errors, but it is not ideal.
> 
> Were any improvements achieved since my request "Detection of ignored function
> return values" that will help in this use case?
> http://lists.diku.dk/pipermail/cocci/2010-February/000690.html
> http://www.mail-archive.com/cocci@diku.dk/msg00157.html

Looking back at that disucssion, it sees that the main issue was whether 
one would know the return type of a function.  If the function is not 
local, one can know that from the prototype.  One then runs into the 
problem that prototypes are often in header files, and Coccinelle takes 
into account at most the header files that are mentioned in the file 
explicitly.  Nothing has changed in that regard.

If you care only about bug finding, but not automatic bug fixing, a 
possibility is to run CPP first.  There is some support for doing this, 
but I don't remember what it is.  Nicolas Palix should know, however.

julia
