From: "Paul Bonser" <misterpib@gmail.com>
Date: Mon, 08 Jan 2007 03:07:56 +0000
Subject: Re: [KJ] ruminations on kernel.h
Message-Id: <e6101e100701071907m27ee24ddp38b1ad4708bddab9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/7/07, Ahmed S. Darwish <darwish.07@gmail.com> wrote:
> I think so too, Kernel.h is just a collection of loosly connected maros.
> Even the naming of the header relate nothing to its contents (printk Macros,
> container_of, ..).
> But will the community accept it easily ?. I mean this will mean patching a very
> big number of files to use the new names/header files.
>
> >   thoughts?  i might whip up a patch just to get some feedback.
>
> If the community accepted it, I have some time to handle the task of patching
> the files to use the new header files.

As a temporary step, kernel.h could be changed to include the files
that the macros are partitioned out into, and then it could be
encouraged to include only the actual needed files in any newly
created files and the existing files that include kernel.h could be
more slowly converted over to just include the files they need.
What does everyone think of this idea? Is it too much of a hack, or a
more graceful way to transition?

-- 
Paul Bonser
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
