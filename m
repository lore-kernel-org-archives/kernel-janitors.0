From: Willem Riede <osst@riede.org>
Date: Tue, 13 Jul 2004 23:59:43 +0000
Subject: Re: [Kernel-janitors] [PATCH] Re: no set_current_state() before
Message-Id: <1089765906l.26949l.2l@serve.riede.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <40F41EA6.9000900@us.ibm.com>
	<1089760052l.26949l.0l@serve.riede.org>
	<29495f1d04071316362e782433@mail.gmail.com>
In-Reply-To: <29495f1d04071316362e782433@mail.gmail.com> (from
	nish.aravamudan@gmail.com on Tue, Jul 13, 2004 at 19:36:01 -0400)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nish Aravamudan <nish.aravamudan@gmail.com>
Cc: Nishanth Aravamudan <nacc@us.ibm.com>, kernel-janitors@lists.osdl.org, osst-users@lists.sourceforge.net, linux-scsi@vger.kernel.org

On 07/13/2004 07:36:01 PM, Nish Aravamudan wrote:
> 
> The main reason I see for using msleep() instead is if the task should
> sleep for at least 100 ms. Using TASK_INTERRUPTIBLE (or really
> anything other than msleep()) is not guaranteed to sleep as long as
> requested. If that's ok / desired, then I won't convert it, of course.

There is no need for such guarantee. The current behavior is OK, by design.

Regards, Willem Riede.


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
