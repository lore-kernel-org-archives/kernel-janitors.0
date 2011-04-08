From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Fri, 08 Apr 2011 19:50:18 +0000
Subject: Re: [PATCH 4/5] arch/x86/pci/direct.c: Convert release_resource to
Message-Id: <20110408125018.49c6860f@jbarnes-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1297599132-7226-1-git-send-email-julia@diku.dk>
	<1297599132-7226-5-git-send-email-julia@diku.dk>
In-Reply-To: <1297599132-7226-5-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org

On Sun, 13 Feb 2011 13:12:11 +0100
Julia Lawall <julia@diku.dk> wrote:

> Request_region should be used with release_region, not release_resource.
> 
> The local variables region and region2 are dropped and the calls to
> release_resource are replaced with calls to release_region, using the first
> two arguments of the corresponding calls to request_region.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Applied to linux-next, thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
