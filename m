From: Richard Weinberger <richard@nod.at>
Date: Mon, 15 Jun 2015 14:49:06 +0000
Subject: Re: [PATCH] um: Fix a build error
Message-Id: <557EE5E2.7080409@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434379436-8301-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1434379436-8301-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am 15.06.2015 um 16:43 schrieb Firo Yang:
> Gcc5 failed to build uml.
> Update codes to test __GNUC__ with 5 will be happier.
> 
> Signed-off-by: Firo Yang <firogm@gmail.com>

The issue got already addressed by patches:
[PATCH 2/5] um: Stop abusing __KERNEL__
[PATCH 3/5] um: Remove copy&paste code from init.h

They will appear soon in Linus' tree.

Thanks,
//richard
