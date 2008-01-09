From: Andi Kleen <andi@firstfloor.org>
Date: Wed, 09 Jan 2008 00:27:29 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080109002729.GH2117@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <47840C57.6000304@gmail.com> <20080109000946.GG2117@one.firstfloor.org> <47841296.8090104@gmail.com>
In-Reply-To: <47841296.8090104@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Winchester <kjwinchester@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, paolo.ciarrocchi@gmail.com, gorcunov@gmail.com, jgarzik@pobox.com, linux-ide@vger.kernel.org

> Sorry about the noise here - I now notice that not all .ioctl function
> pointers have the option of changing to .unlocked_ioctl.  In this case,
> the ioctl is in the struct scsi_host_template, rather than struct
> file_operations.
> 
> I'll try to be a little more careful about the git grepping in the future.

Well it just points to another area that needs to be improved. Clearly
scsi_host_template should have a unlocked_ioctl too.

-Andi
