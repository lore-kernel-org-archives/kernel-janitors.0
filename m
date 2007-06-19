From: "pradeep singh" <pradeep.rautela@gmail.com>
Date: Tue, 19 Jun 2007 04:55:41 +0000
Subject: Re: [KJ] How to create a pxeboot initrd from scratch
Message-Id: <a901b49a0706182143l3a054793lc6234f6697c7081e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BAY103-DAV13DFBDCDC54FEC06B93E9CE120@phx.gbl>
In-Reply-To: <BAY103-DAV13DFBDCDC54FEC06B93E9CE120@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi

Try asking on
linux-newbies
or
kernelnewbies.(though it would be offtopic there too i guess).
You can also try alt.os.linux group at googlegroups.

HTH

thanks
--pradeep

On 6/19/07, Vaughn E. Clinton <vclinton@msn.com> wrote:
>
>
> I need help - BAD.  I'm not sure where to ask this question, but maybe
> someone on this list can redirect me.  I'm trying to pxeboot across a
> myri10ge card to initiate a kick start installation with RHEL 4.3.
> Unfortunately, the base pxeboot kernel image is 2.6.9-34 and it does not
> contain the myri10ge kernel module.
>
> I've been able to build the kernel module against the 2.6.9-34 kernel and
> move it over to my original "images/pxeboot/initrd.img" file by tearing it
> open and adding the file to the "/lib/" directory of the initrd file and
> modifying the modules-info and depends file with respect to the initrd image
> itself..
>
> Now, this image is not based on "busybox" and I'm not familiar enough with
> the process, but I that I think it is using "loader" (I think it's the
> anaconda loader binary) and "init" (it looks like a minimal version of
> "init") to load the kernel modules that are detected and mount the virtual
> file systems.
>
> What is keeping me from completing the process is that I can't see the
> myri10ge card at that level unless I get "udevstart" to run (which is kludge
> that I use for calling via the "linuxrc" script and busybox).
>
> Anyway, I guess my million dollar question is , "how do I get the booting
> kernel/initrd to recognize the device in a non-busybox environment"?  What
> should I add to the native "images/pxeboot/initrd.img" file to make the
> magic happen?
>
> Thanks in advance ...
>
> Regards,
>
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
>


-- 
Pradeep
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
