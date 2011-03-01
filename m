From: Alan Cox <alan@linux.intel.com>
Date: Tue, 01 Mar 2011 13:50:23 +0000
Subject: Re: [patch] staging: gma500: fix some swapped gotos
Message-Id: <20110301135023.43d5bd61@bob.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110226124812.GH18043@bicker>
In-Reply-To: <20110226124812.GH18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 26 Feb 2011 15:48:12 +0300
Dan Carpenter <error27@gmail.com> wrote:

> These gotos were swapped.  In the original code, the first would
> result in a NULL dereference and the second would result in a memory
> leak.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied to my GMA500 tree. Need to sort out with GregKH how we handle
stuff in general though as it seems that staging may not work for this
driver due to the rate of change in the DRM tree.

Alan
