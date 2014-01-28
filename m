From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 28 Jan 2014 21:08:24 +0000
Subject: Re: Getting Started with Kernel Janitors Project
Message-Id: <alpine.DEB.2.02.1401282204350.2041@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAEqxDE=rOu4Gdf_XVot3oDJNKmibT1Ke7kt93Pmgvj+EAmZjVw@mail.gmail.com>
In-Reply-To: <CAEqxDE=rOu4Gdf_XVot3oDJNKmibT1Ke7kt93Pmgvj+EAmZjVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 28 Jan 2014, Wang Zhe wrote:

> Hi all,
> I am new to linux kernel project and came through the kernelnewbies
> webpage saying kernel janitor project is a good way to get me started
> contributing to kernel. But I am not quite sure how to get started
> with the janitor project. I read through the TODO list
> (http://kernelnewbies.org/KernelJanitors/Todo) but the items there
> sounds very general to me. Is there any sort of list that looks like
> the issue list of most Github project (i.e. has specified which file
> should I look for, instead of more general TODO description)?
> 
> In general, any suggestion on how to get me started contributing to
> this project will be really appreciated.
> 
> (This is the first time I send email to the mailing list and I
> apologize if it's not appropriate ask this kind of question on the
> mailing list.)

Actually, this question is asked often.  You may want to look through the 
archives to see what we told the last person :)

Some suggestions are:
1) There are some bug finding tools in the Linux kernel scripts directory.  
Figure out how to use them, and fix the bugs that they identify.
2) Look into the code in drivers/staging.  There are probably a lot of 
easy cleanups there.
3) Look through the git logs to see what other people have done recently.  
In general, a problem never occurs only once, so changes made in one place 
are probably needed in other places as well.

And in the interest of self-promotion, you may want to look at 
http://coccinelle.lip6.fr/

Also be sure to read the documentation on submitting patches and do 
everything it says.  You are still likely to make mistakes, so be ready 
for some corrections.

julia
