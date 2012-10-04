From: Stephen Hemminger <shemminger@vyatta.com>
Date: Thu, 04 Oct 2012 14:44:42 +0000
Subject: Re: [PATCH 19/20] drivers/net/ethernet/marvell/skge.c: fix error return code
Message-Id: <20121004074442.180d8f01@nehalam.linuxnetplumber.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349281090-10013-20-git-send-email-peter.senna@gmail.com>
	<20121003092508.6a7da662@nehalam.linuxnetplumber.net>
	<CA+MoWDp4W5BCA1t_HgEtLhMs1btVTOkbtBytOVtAzJriEZ-16A@mail.gmail.com>
In-Reply-To: <CA+MoWDp4W5BCA1t_HgEtLhMs1btVTOkbtBytOVtAzJriEZ-16A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: mlindner@marvell.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 4 Oct 2012 11:05:55 +0200
Peter Senna Tschudin <peter.senna@gmail.com> wrote:

> >
> > Thanks for looking into these kind of problems. The contents
> > of the patch are correct, but the automated commit message is useless.
> > You shouldn't just blindly say what the automated
> > script was looking for, you should describe what the bug is so that evaluators
> > can decide what the impact is and if it should be backported to stable
> > and vendor kernels.
> >
> > Please resubmit the patchs with a reasonable analysis in the commit message.
> > Something like:
> >
> >   There is a bug in skge driver. If alloc_etherdev() fails, then
> >   skge_devinit() will return NULL, and the skge_probe function incorrectly
> >   returns success 0. It should return -ENOMEM instead.
> >
> >
> 
> Stephen, I do not want to include function names on the commit
> message. What do you think about this updated message, is it
> acceptable?
> 

No still to generic, it needs to be written by a human examining
the file and understanding what the cause and effect of the bug
is.

