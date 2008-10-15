From: walter harms <wharms@bfs.de>
Date: Wed, 15 Oct 2008 18:34:23 +0000
Subject: Re: A kernel janitor question
Message-Id: <48F637AF.60202@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee90333f0810141017i5907bc48jfd67cc909e2dbff3@mail.gmail.com>
In-Reply-To: <ee90333f0810141017i5907bc48jfd67cc909e2dbff3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



David Li schrieb:
> The requirement that I am not about sure about is if the kernel
> janitor needs to be able to build, configure and boot up a customized
> kernel in order to test his patches. It seems to me a must. What's the
> common practice in this for everyone? Are there any specific
> requirements on HW? Can any experienced janitors share some thoughts?


The answer depends on the situation. for some patches you need special hardware
so it should be the responsibility of the current subsystem maintainer to make
sure it works on it.

As janitor you have to compile-test the fixes at least and you should follow the thread
that means  if the maintainer says "you patch is bad because the documentation is faulty
not the program." you should fix the documentation in the next step not leave it as it is.

re,
 wh
