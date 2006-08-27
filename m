From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 27 Aug 2006 08:01:49 +0000
Subject: Re: [KJ] Need Updated list of TODO
Message-Id: <20060827080149.GD5204@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5f87992f0608240236x48924624v86e342ffd75313be@mail.gmail.com>
In-Reply-To: <5f87992f0608240236x48924624v86e342ffd75313be@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Aug 27, 2006 at 02:10:28PM +1000, Darren Jenkins wrote:
> On 8/27/06, Shakthi Kannan <shakthimaan@gmail.com> wrote:
> > Is it possible for the developers to transform the entries in
> >
> > http://www.kerneljanitors.org/TODO
> >
> > into a tabulated form, maybe in a wiki, perhaps? So, whoever is
> > working on cleaning up a particular task, can have their name assigned
> > next to it. This way we don't get to work on the same task.
> >
> > Appreciate any feedback,
>
> To check if someone else is doing/has done the same task, just check
> the KJ patch set and the recent archives to see if there is a patch

s/KJ/-mm/ :-( In particular, kzalloc and pci_module_init conversion
seems to be well-covered.

> for the file/files you are wanting to change, or to see if someone is
> doing a series of similar patches.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
