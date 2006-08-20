From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 20 Aug 2006 15:19:16 +0000
Subject: Re: [KJ] Unused OSS drivers?
Message-Id: <20060820151916.GM7813@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ae4f6940608200302x369beaadi1135e6afe0c92b6a@mail.gmail.com>
In-Reply-To: <3ae4f6940608200302x369beaadi1135e6afe0c92b6a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Aug 20, 2006 at 12:02:22PM +0200, Johann Uhrmann wrote:

> Hi,

Hi Johann,

> in the kernel 2.6.18-rc4 (from git) I found two unchecked calls to
> request_region
> and tried to write a patch for it.
> However, I could not manage to compile those drivers - they seem to be missing
> in menuconfig.

that's expected. Look at the "drivers that were depending on 
OBSOLETE_OSS_DRIVER" entry in 
Documentation/feature-removal-schedule.txt.

> Which settings are necessary to compile the following files:
> sound/oss/msnd_*.c
> sound/oss/gus_wave.c
> 
> If there is really no way to compile those drivers, I guess they
> should be completely removed from the kernel source.

Already done in -mm, patch will go into 2.6.19.

> Kind regards,
> 
> Johann Uhrmann

cu
Adrian

-- 

    Gentoo kernels are 42 times more popular than SUSE kernels among
    KLive users  (a service by SUSE contractor Andrea Arcangeli that
    gathers data about kernels from many users worldwide).

       There are three kinds of lies: Lies, Damn Lies, and Statistics.
                                                    Benjamin Disraeli

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
