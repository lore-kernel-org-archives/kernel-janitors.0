From: Tobias Klauser <tklauser@distanz.ch>
Date: Sat, 08 Mar 2008 15:48:19 +0000
Subject: Re: how to create a multipart, numbered git patch?
Message-Id: <20080308154819.GB29451@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803080930270.14846@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803080930270.14846@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

(hit the wrong reply key, so here for the list again)

On 2008-03-08 at 15:33:11 +0100, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> 
>   i've tried to follow a couple previous tutorials and never
> succeeded, so is there a meticulous recipe for how to create a
> muitipart git patch that i can follow?  based on what i've read, what
> i would be doing is
> 
> 1) start with a freshly pulled repo
> 2) make each change and commit it

I prefer to do my changes on a local branch.

> 3) once i've made all my changes, somehow generate the patch

git format-patch is your friend here. Check the -n option.

> 4) do a git --reset hard to resycn with the repo, right?

I just delete the branch after all patches have been merged upstream.

Cheers, Tobias
