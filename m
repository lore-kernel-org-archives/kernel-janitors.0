From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Fri, 11 Oct 2019 13:35:57 +0000
Subject: Re: [v3] thunderbolt: Fix to check the return value of kmemdup
Message-Id: <20191011133557.GF2819@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325212523.11799-1-pakki001@umn.edu>
 <f2960ada-7e06-33d1-1533-78989a3e1d2a@web.de>
In-Reply-To: <f2960ada-7e06-33d1-1533-78989a3e1d2a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Aditya Pakki <pakki001@umn.edu>, Andreas Noever <andreas.noever@gmail.com>, Kangjie Lu <kjlu@umn.edu>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 11, 2019 at 03:00:13PM +0200, Markus Elfring wrote:
> > uuid in add_switch is allocted via kmemdup which can fail.
> 
> I have tried another script for the semantic patch language out.
> This source code analysis approach points out that the implementation
> of the function “icm_handle_event” contains still an unchecked call
> of the function “kmemdup”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/thunderbolt/icm.c?id<db9446a117d5d63af823bde6fe6babc312e77b#n1627
> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/thunderbolt/icm.c#L1627

Right it misses that.

> How do you think about to improve it?

Feel free to send a patch fixing it ;-) Or I can do that myself.
