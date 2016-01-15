From: Bart Van Assche <bart.vanassche@sandisk.com>
Date: Fri, 15 Jan 2016 17:19:38 +0000
Subject: Re: InfiniBand-ocrdma: Delete unnecessary variable initialisations in 11 functions
Message-Id: <56992A2A.4020104@sandisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567EDED5.4040201@users.sourceforge.net>
 <5697D865.5010507@users.sourceforge.net>
 <5697DE31.9040309@users.sourceforge.net> <20160115132014.GC30615@leon.nu>
 <56990733.7000506@users.sourceforge.net> <20160115150935.GA32346@leon.nu>
 <56990FAC.6000506@users.sourceforge.net> <20160115155938.GB32346@leon.nu>
 <56991D52.8030808@users.sourceforge.net> <20160115170048.GC32346@leon.nu>
In-Reply-To: <20160115170048.GC32346-2ukJVAZIZ/Y@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mitesh Ahuja <mitesh.ahuja-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>

On 01/15/2016 09:00 AM, Leon Romanovsky wrote:
> On Fri, Jan 15, 2016 at 05:24:50PM +0100, SF Markus Elfring wrote:
>
> Since, you didn't answer to my original question, I will repeat it again.
> [Q.] What did you try to achieve by this patch?

Hello Leon,

Have you noticed Dan's reply: "Doing bogus initializations turns off 
GCC's checking for uninitialized variables so it's a bad habit."

Thanks,

Bart.
