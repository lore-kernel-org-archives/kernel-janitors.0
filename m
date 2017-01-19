From: Richard Weinberger <richard@nod.at>
Date: Thu, 19 Jan 2017 07:56:31 +0000
Subject: Re: [PATCH 0/5] UM: Fine-tuning for some function implementations
Message-Id: <2585eee4-c3cf-229f-1603-a29d404db618@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c10b7f33-f573-aa9f-239e-ccca5540f264@users.sourceforge.net>
In-Reply-To: <c10b7f33-f573-aa9f-239e-ccca5540f264@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, user-mode-linux-devel@lists.sourceforge.net, user-mode-linux-user@lists.sourceforge.net, Anton Ivanov <aivanov@kot-begemot.co.uk>, Dan Williams <dan.j.williams@intel.com>, Hannes Reinecke <hare@suse.com>, Jeff Dike <jdike@addtoit.com>, Jens Axboe <axboe@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Markus,

Am 18.01.2017 um 22:55 schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Jan 2017 22:48:02 +0100
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (5):
>   port: Move an assignment for the variable "fd" in port_wait()
>   port: Delete three error messages for a failed memory allocation
>   port: Improve size determinations in port_data()
>   ubd: Move two assignments for the variable "err" in ubd_remove()
>   ubd: Improve size determinations in do_ubd_request()

please don't send drive-by patches.
Please see:
marc.info/?i 170111225640.14e5d962@bbrezillon

Nacked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
