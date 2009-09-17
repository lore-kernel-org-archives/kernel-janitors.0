From: Jesse Barnes <jesse.barnes@intel.com>
Date: Thu, 17 Sep 2009 17:12:19 +0000
Subject: Re: [PATCH 5/10] drivers/pci: Move a dereference below a NULL test
Message-Id: <20090917101219.19cb4da1@jbarnes-g45>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191726360.16542@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907191726360.16542@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kristen.c.accardi@intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 19 Jul 2009 17:26:58 +0200 (CEST)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> If the NULL test is necessary, then the dereference should be moved
> below the NULL test.
> 
> The semantic patch that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)

Sorry I missed this one.  Looks like it's been fixed another way
though...

-- 
Jesse Barnes, Intel Open Source Technology Center
