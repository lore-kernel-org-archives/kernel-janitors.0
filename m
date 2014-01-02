From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 02 Jan 2014 09:56:46 +0000
Subject: Re: Yet another newbie hopes to join the fold
Message-Id: <alpine.DEB.2.02.1401021054590.2182@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAPNrq4xas3OGqkv1027Bty+6CErw=Hk=RJxasPioED9KvkEGOA@mail.gmail.com>
In-Reply-To: <CAPNrq4xas3OGqkv1027Bty+6CErw=Hk=RJxasPioED9KvkEGOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2 Jan 2014, Gideon D'souza wrote:

> Hey Guys,
> 
> I'm just another hacking hoping to hack on the kernel.
> 
> I've played just a wee bit with toy OS's (from osdev.org), stuff like
> MikeOS etc. I've just begun reading Robert Love's - Linux Kernel
> Development.
> 
> I have two questions:
> 
> 1> I've got myself setup with Fedora 20 and I'm good to go, however Im
> somewhat scared by how contrived the kernel bugs are, and I'm
> wondering what kind of work can I do? Or any suggestions as to what I
> can code or write to learn something, maybe write to a log file
> everytime a process is created to understand that bit better?  IOW,
> what toy projects can I do to explore various aspects of the kernel.
> 
> 2> I started reading a linux device driver series, but how is a real
> driver written, can a random person get a technical hardware doc and
> go write a driver or is this something done only by a companies that
> manufactures hardware?

Also, read carefully the documentation about submitting patches 
(Documentation/SubmittingPatches) and do everything that it says.  And try 
sending any patches to yourself and applying them before sending them to 
the mailing list.  The get_maintainers.pl script helps you figure out who 
to send your patches to.

julia
