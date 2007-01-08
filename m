From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Mon, 08 Jan 2007 02:21:58 +0000
Subject: Re: [KJ] ruminations on kernel.h
Message-Id: <20070108022158.GA17437@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jan 07, 2007 at 03:24:41PM -0500, Robert P. J. Day wrote:
> 
>   just thinking out loud here, but does anyone else think that the
> header file include/linux/kernel.h is a little ... unstructured?
> IMHO, i would think that it would make more sense to partition a lot
> of the content of that file into other (and possibly newer) header
> files.
> 

I think so too, Kernel.h is just a collection of loosly connected maros.
Even the naming of the header relate nothing to its contents (printk Macros,
container_of, ..).
But will the community accept it easily ?. I mean this will mean patching a very
big number of files to use the new names/header files.

>   thoughts?  i might whip up a patch just to get some feedback.

If the community accepted it, I have some time to handle the task of patching 
the files to use the new header files.

-- 
Ahmed S. Darwish
http://darwish-07.blogspot.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
