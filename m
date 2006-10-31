From: "Suren Naidu" <naidu.suren@gmail.com>
Date: Tue, 31 Oct 2006 08:46:31 +0000
Subject: Re: [KJ] [PATCH] Changed all calls to pci_module_init to be
Message-Id: <429af9e30610310046i6c6637fcq67281fad103f08ef@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061028201039.GB20208@zeno.unh.edu>
In-Reply-To: <20061028201039.GB20208@zeno.unh.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> >
> > I wouldn't mind doing that.  Just a simple find/replace of 'FALSE' with 'false'
> > and 'TRUE' with 'true'?
> Both yes and no. Of course you can do a simple replace (like just using
> sed with "s/FALSE/false/") but I think it is a good idea to check the
> paths for the variables to see they are real booleans (only gets 'false'
> and 'true', also only used in logical operations) and also clean up
> things like "if (b = TRUE)". If you make such a patch, can you cc: me
> too, please?

Is this a janitor project ? Is anyone working on it ?

Suren
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
