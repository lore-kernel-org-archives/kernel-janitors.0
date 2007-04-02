From: Greg KH <greg@kroah.com>
Date: Mon, 02 Apr 2007 03:40:42 +0000
Subject: Re: [KJ] my first janitorial
Message-Id: <20070402034042.GA27102@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
In-Reply-To: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 02, 2007 at 08:57:21AM +0530, surya.prabhakar@wipro.com wrote:
> Greg,
>    In my earlier mails I did send patches for cleanup related to almost
> all instances of pci_find_device cleanup ( archives can be checked ) .
> Unfortunately the driver maintainer never responded. And people are
> doing the same thing again.

Then push them to the kernel-janitor maintainer (who is that these days)
and get them into the main kernel tree.  Persistance is the key here.

The fact that the driver maintainer/author did not respond is not
supprising, as the reason these drivers need fixing is that no one seems
to be maintaining them anymore :)

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
