From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Sat, 05 Apr 2008 01:05:19 +0000
Subject: Re: any value to numerous checks of "#ifdef __GNUC__"?
Message-Id: <82faac5b0804041805ia0f47abmbe33dd09e0472cab@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Apr 5, 2008 at 12:18 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>  is it
>  even remotely feasible that the kernel might someday support a non-GNU
>  C compiler, given the numerous gcc extensions that are used?

I think people are working on getting tinycc to compile an un-modified
kernel, and I think LLVM is close-ish, also some BSD guys are working
on PCC so it might be able to compile the kernel in the
(distant?)future.

It concerns me a little that GCC is the only OSS compiler that can
compile the kernel.


Darren J.
